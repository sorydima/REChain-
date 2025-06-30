from telegram.ext import CommandHandler
from rechain_services import verify_identity

async def verify_identity_command(update, context):
    user_id = update.effective_user.id
    result = await verify_identity(user_id)
    await update.message.reply_text(f"Identity status: {result['status']}")

def register(app):
    app.add_handler(CommandHandler('verify_identity', verify_identity_command)) 