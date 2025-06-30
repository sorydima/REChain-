import yaml
import asyncio
import os
from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes, MessageHandler, filters
from bridge import MatrixBridge
from analytics import log_event as analytics_log_event
from logger import log_event, log_error
from dashboard_api import inc_metric
import aiohttp
from plugins.example_plugin import echo_command
import importlib
import glob
import time
try:
    import redis
except ImportError:
    redis = None

# Load config
with open('config.yaml') as f:
    config = yaml.safe_load(f)
TELEGRAM_TOKEN = config['telegram']['bot_token']
CHAT_ROOM_MAPPING = config['bridge']['chat_room_mapping']
ADMIN_IDS = config.get('telegram', {}).get('admin_ids', [])
AI_MODERATION_URL = config.get('rechain', {}).get('ai_moderation_url', 'https://rechain.example.com/ai/moderate')
AI_MODERATION_KEY = config.get('rechain', {}).get('ai_api_key', 'demo-key')
MAPPINGS_FILE = 'mappings.yaml'

USE_REDIS = False  # Set to True and configure if using Redis for shared state
REDIS_CONFIG = {'host': 'localhost', 'port': 6379, 'db': 0}
redis_client = None
if USE_REDIS and redis:
    with open('redis_config.yaml') as f:
        REDIS_CONFIG.update(yaml.safe_load(f))
    redis_client = redis.Redis(**REDIS_CONFIG)

# Load or initialize mappings
if USE_REDIS and redis_client:
    mappings_yaml = redis_client.get('mappings')
    dynamic_mappings = yaml.safe_load(mappings_yaml) if mappings_yaml else {}
else:
    if os.path.exists(MAPPINGS_FILE):
        with open(MAPPINGS_FILE) as f:
            dynamic_mappings = yaml.safe_load(f) or {}
    else:
        dynamic_mappings = dict(CHAT_ROOM_MAPPING)

def save_mappings():
    if USE_REDIS and redis_client:
        redis_client.set('mappings', yaml.safe_dump(dynamic_mappings))
    else:
        with open(MAPPINGS_FILE, 'w') as f:
            yaml.safe_dump(dynamic_mappings, f)

app = None  # Will be set in main()

PLUGINS_DIR = 'plugins'
loaded_plugins = {}

def load_plugins(app):
    global loaded_plugins
    loaded_plugins = {}
    for plugin_path in glob.glob(f'{PLUGINS_DIR}/*.py'):
        if plugin_path.endswith('__init__.py'):
            continue
        module_name = plugin_path.replace('/', '.').replace('\\', '.').rstrip('.py')
        module_name = module_name[:-3] if module_name.endswith('.py') else module_name
        try:
            module = importlib.import_module(module_name)
            importlib.reload(module)
            if hasattr(module, 'register'):
                module.register(app)
            loaded_plugins[module_name] = module
            log_event(f"Loaded plugin: {module_name}")
        except Exception as e:
            log_error(f"Failed to load plugin {module_name}: {e}")

def reload_plugins(app):
    load_plugins(app)
    log_event("Plugins reloaded via /reload_plugins")

async def ai_moderate(text):
    payload = {'text': text, 'api_key': AI_MODERATION_KEY}
    async with aiohttp.ClientSession() as session:
        try:
            async with session.post(AI_MODERATION_URL, json=payload) as resp:
                if resp.status == 200:
                    result = await resp.json()
                    return result.get('result', 'clean') == 'clean'
                else:
                    log_error(f"[AI Moderation] Failed: {resp.status}")
                    return True  # Fail open
        except Exception as e:
            log_error(f"[AI Moderation] Error: {e}")
            return True  # Fail open

def load_translations():
    translations = {}
    for path in glob.glob('i18n/*.yaml'):
        lang = path.split('/')[-1].split('.')[0]
        with open(path) as f:
            translations[lang] = yaml.safe_load(f)
    return translations

def get_lang(user_id):
    # For demo, always return 'en'. Extend to per-user or per-chat.
    return 'en'

translations = load_translations()

def t(key, user_id):
    lang = get_lang(user_id)
    return translations.get(lang, {}).get(key, key)

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text(t('start', update.effective_user.id))
    await analytics_log_event('command', {'command': 'start', 'user': update.effective_user.id})
    log_event(f"/start by {update.effective_user.id}")

async def bridge_status(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text('Bridge is running. Telegram and Matrix connections are active.')
    await analytics_log_event('command', {'command': 'bridge_status', 'user': update.effective_user.id})
    log_event(f"/bridge_status by {update.effective_user.id}")

async def bridge_help(update: Update, context: ContextTypes.DEFAULT_TYPE):
    help_text = (
        "Available commands:\n"
        "/start - Greet the bot\n"
        "/bridge_status - Show bridge health\n"
        "/bridge_help - Show this help message\n"
        "/bridge_add <tg_chat_id> <mx_room_id> - Add mapping (admin)\n"
        "/bridge_remove <tg_chat_id> - Remove mapping (admin)\n"
        "/bridge_list - List all mappings (admin)\n"
        "/reload_plugins - Reload plugins (admin)\n"
    )
    await update.message.reply_text(help_text)
    await analytics_log_event('command', {'command': 'bridge_help', 'user': update.effective_user.id})
    log_event(f"/bridge_help by {update.effective_user.id}")

rate_limits = {}
RATE_LIMIT_SECONDS = 10

def is_rate_limited(user_id, command):
    now = time.time()
    key = f"{user_id}:{command}"
    last = rate_limits.get(key, 0)
    if now - last < RATE_LIMIT_SECONDS:
        return True
    rate_limits[key] = now
    return False

# RBAC roles
if os.path.exists('roles.yaml'):
    with open('roles.yaml') as f:
        roles_config = yaml.safe_load(f)
else:
    roles_config = {'users': {}, 'roles': {}}

def get_user_role(user_id):
    return roles_config['users'].get(user_id, 'user')

def check_permission(user_id, command):
    role = get_user_role(user_id)
    allowed = roles_config['roles'].get(role, [])
    return command in allowed

async def bridge_add(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_id = update.effective_user.id
    if not check_permission(user_id, 'bridge_add'):
        await update.message.reply_text('Not authorized.')
        log_event(f"Unauthorized /bridge_add by {user_id}")
        return
    if is_rate_limited(user_id, 'bridge_add'):
        await update.message.reply_text('Rate limited. Try again later.')
        return
    args = context.args
    if len(args) != 2:
        await update.message.reply_text('Usage: /bridge_add <tg_chat_id> <mx_room_id>')
        return
    tg_chat_id, mx_room_id = args
    dynamic_mappings[tg_chat_id] = mx_room_id
    save_mappings()
    await update.message.reply_text(f'Added mapping: {tg_chat_id} <-> {mx_room_id}')
    await analytics_log_event('command', {'command': 'bridge_add', 'user': user_id, 'tg_chat_id': tg_chat_id, 'mx_room_id': mx_room_id})
    log_event(f"/bridge_add by {user_id}: {tg_chat_id} <-> {mx_room_id}")

async def bridge_remove(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_id = update.effective_user.id
    if not check_permission(user_id, 'bridge_remove'):
        await update.message.reply_text('Not authorized.')
        log_event(f"Unauthorized /bridge_remove by {user_id}")
        return
    args = context.args
    if len(args) != 1:
        await update.message.reply_text('Usage: /bridge_remove <tg_chat_id>')
        return
    tg_chat_id = args[0]
    if tg_chat_id in dynamic_mappings:
        del dynamic_mappings[tg_chat_id]
        save_mappings()
        await update.message.reply_text(f'Removed mapping for {tg_chat_id}')
        await analytics_log_event('command', {'command': 'bridge_remove', 'user': user_id, 'tg_chat_id': tg_chat_id})
        log_event(f"/bridge_remove by {user_id}: {tg_chat_id}")
    else:
        await update.message.reply_text('Mapping not found.')

async def bridge_list(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_id = update.effective_user.id
    if not check_permission(user_id, 'bridge_list'):
        await update.message.reply_text('Not authorized.')
        log_event(f"Unauthorized /bridge_list by {user_id}")
        return
    if not dynamic_mappings:
        await update.message.reply_text('No mappings set.')
        return
    msg = '\n'.join([f'{tg} <-> {mx}' for tg, mx in dynamic_mappings.items()])
    await update.message.reply_text(f'Current mappings:\n{msg}')
    log_event(f"/bridge_list by {user_id}")

async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE):
    chat_id = str(update.effective_chat.id)
    if chat_id in dynamic_mappings:
        room_id = dynamic_mappings[chat_id]
        # Handle text
        if update.message.text:
            # AI moderation before forwarding
            is_clean = await ai_moderate(update.message.text)
            if is_clean:
                await matrix_bridge.send_message(room_id, update.message.text)
                print(f"[Telegram->Matrix] {chat_id} -> {room_id}: {update.message.text}")
                await analytics_log_event('tg_to_matrix', {'from': chat_id, 'to': room_id, 'text': update.message.text})
                log_event(f"[Telegram->Matrix] {chat_id} -> {room_id}: {update.message.text}")
                if USE_REDIS:
                    redis_client.incr('messages_tg_to_matrix')
                else:
                    inc_metric('messages_tg_to_matrix')
            else:
                await update.message.reply_text('Message blocked by AI moderation.')
                await analytics_log_event('tg_to_matrix_blocked', {'from': chat_id, 'to': room_id, 'text': update.message.text})
                log_event(f"[AI Moderation Blocked] {chat_id} -> {room_id}: {update.message.text}")
        # Handle photo
        elif update.message.photo:
            file = await update.message.photo[-1].get_file()
            file_path = f"/tmp/tma_{file.file_id}.jpg"
            await file.download_to_drive(file_path)
            await matrix_bridge.send_media(room_id, file_path, mime_type="image/jpeg")
            os.remove(file_path)
            print(f"[Telegram->Matrix] {chat_id} -> {room_id}: [Photo]")
            await analytics_log_event('tg_to_matrix', {'from': chat_id, 'to': room_id, 'photo': True})
            log_event(f"[Telegram->Matrix] {chat_id} -> {room_id}: [Photo]")
        # Handle document
        elif update.message.document:
            file = await update.message.document.get_file()
            file_path = f"/tmp/tma_{file.file_id}_{update.message.document.file_name}"
            await file.download_to_drive(file_path)
            await matrix_bridge.send_media(room_id, file_path, mime_type=update.message.document.mime_type)
            os.remove(file_path)
            print(f"[Telegram->Matrix] {chat_id} -> {room_id}: [Document]")
            await analytics_log_event('tg_to_matrix', {'from': chat_id, 'to': room_id, 'document': True})
            log_event(f"[Telegram->Matrix] {chat_id} -> {room_id}: [Document]")

async def send_to_telegram(chat_id, text, file_path=None):
    try:
        if file_path and os.path.exists(file_path):
            # Guess if it's a photo or document
            if file_path.lower().endswith(('.jpg', '.jpeg', '.png', '.gif')):
                with open(file_path, 'rb') as f:
                    await app.bot.send_photo(chat_id=int(chat_id), photo=f)
            else:
                with open(file_path, 'rb') as f:
                    await app.bot.send_document(chat_id=int(chat_id), document=f)
            print(f"[Matrix->Telegram] {chat_id}: [File sent] {file_path}")
            await analytics_log_event('matrix_to_tg', {'to': chat_id, 'file': file_path})
            log_event(f"[Matrix->Telegram] {chat_id}: [File sent] {file_path}")
            if USE_REDIS:
                redis_client.incr('messages_matrix_to_tg')
            else:
                inc_metric('messages_matrix_to_tg')
        else:
            await app.bot.send_message(chat_id=int(chat_id), text=text)
            print(f"[Matrix->Telegram] {chat_id}: {text}")
            await analytics_log_event('matrix_to_tg', {'to': chat_id, 'text': text})
            log_event(f"[Matrix->Telegram] {chat_id}: {text}")
            if USE_REDIS:
                redis_client.incr('messages_matrix_to_tg')
            else:
                inc_metric('messages_matrix_to_tg')
    except Exception as e:
        print(f"[Matrix->Telegram] Failed to send to {chat_id}: {e}")
        await analytics_log_event('matrix_to_tg_error', {'to': chat_id, 'error': str(e)})
        log_error(f"[Matrix->Telegram] Failed to send to {chat_id}: {e}")
        if USE_REDIS:
            redis_client.incr('errors')
        else:
            inc_metric('errors')
    finally:
        if file_path and os.path.exists(file_path):
            os.remove(file_path)

async def reload_plugins_cmd(update: Update, context: ContextTypes.DEFAULT_TYPE):
    user_id = update.effective_user.id
    if not check_permission(user_id, 'reload_plugins'):
        await update.message.reply_text('Not authorized.')
        log_event(f"Unauthorized /reload_plugins by {user_id}")
        return
    if is_rate_limited(user_id, 'reload_plugins'):
        await update.message.reply_text('Rate limited. Try again later.')
        return
    reload_plugins(app)
    await update.message.reply_text('Plugins reloaded.')
    log_event(f"/reload_plugins by {user_id}")

async def main():
    global app
    app = ApplicationBuilder().token(TELEGRAM_TOKEN).build()
    app.add_handler(CommandHandler('start', start))
    app.add_handler(CommandHandler('bridge_status', bridge_status))
    app.add_handler(CommandHandler('bridge_help', bridge_help))
    app.add_handler(CommandHandler('bridge_add', bridge_add))
    app.add_handler(CommandHandler('bridge_remove', bridge_remove))
    app.add_handler(CommandHandler('bridge_list', bridge_list))
    app.add_handler(CommandHandler('reload_plugins', reload_plugins_cmd))
    app.add_handler(MessageHandler(filters.ALL, handle_message))
    # Pass the Telegram callback to the Matrix bridge
    global matrix_bridge
    matrix_bridge = MatrixBridge(telegram_callback=send_to_telegram)
    print('Starting Telegram Super TMA bot...')
    log_event('Bot started')
    load_plugins(app)
    await asyncio.gather(
        app.run_polling(),
        matrix_bridge.run()
    )

if __name__ == '__main__':
    asyncio.run(main()) 