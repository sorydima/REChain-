from telegram.ext import CommandHandler
from dashboard_api import metrics
import aiohttp

EXTERNAL_ANALYTICS_URL = 'https://analytics.example.com/ingest'  # Replace with real endpoint

async def stats_command(update, context):
    msg = (
        f"Messages Telegram→Matrix: {metrics['messages_tg_to_matrix']}\n"
        f"Messages Matrix→Telegram: {metrics['messages_matrix_to_tg']}\n"
        f"Errors: {metrics['errors']}\n"
        f"Uptime (s): {metrics['uptime_seconds']}"
    )
    await update.message.reply_text(msg)
    # Push metrics to external service (stub)
    async with aiohttp.ClientSession() as session:
        try:
            await session.post(EXTERNAL_ANALYTICS_URL, json=metrics)
        except Exception:
            pass

def register(app):
    app.add_handler(CommandHandler('stats', stats_command)) 