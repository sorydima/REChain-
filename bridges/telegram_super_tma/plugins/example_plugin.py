from telegram.ext import CommandHandler

async def echo_command(update, context):
    if context.args:
        await update.message.reply_text(' '.join(context.args))
    else:
        await update.message.reply_text('Usage: /echo <text>')

def register(app):
    app.add_handler(CommandHandler('echo', echo_command)) 