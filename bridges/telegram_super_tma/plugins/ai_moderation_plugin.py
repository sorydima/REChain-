from telegram.ext import CommandHandler
import aiohttp

AI_API_URL = 'https://api.example.com/moderate'  # Replace with real endpoint
AI_API_KEY = 'demo-key'

async def mod_command(update, context):
    if context.args:
        text = ' '.join(context.args)
        # Call AI moderation API
        async with aiohttp.ClientSession() as session:
            try:
                resp = await session.post(AI_API_URL, json={'text': text, 'api_key': AI_API_KEY})
                if resp.status == 200:
                    result = await resp.json()
                    verdict = result.get('result', 'clean')
                else:
                    verdict = 'error'
            except Exception as e:
                verdict = f'error: {e}'
        await update.message.reply_text(f'Moderation result for: {text}\n[{verdict}]')
    else:
        await update.message.reply_text('Usage: /mod <text>')

def register(app):
    app.add_handler(CommandHandler('mod', mod_command)) 