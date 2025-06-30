from telegram.ext import CommandHandler
from rechain_services import process_payment

async def pay_command(update, context):
    user_id = update.effective_user.id
    if context.args:
        try:
            amount = float(context.args[0])
        except Exception:
            await update.message.reply_text('Usage: /pay <amount>')
            return
        result = await process_payment(user_id, amount)
        await update.message.reply_text(f"Payment status: {result['status']} for {amount}")
    else:
        await update.message.reply_text('Usage: /pay <amount>')

def register(app):
    app.add_handler(CommandHandler('pay', pay_command)) 