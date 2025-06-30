# Plugin Development Guide

## Structure
- Place plugins in `plugins/` directory (Python)
- Each plugin should define a `register(app)` function to register command handlers

## Example
```python
from telegram.ext import CommandHandler
async def mycmd(update, context):
    await update.message.reply_text('Hello from plugin!')
def register(app):
    app.add_handler(CommandHandler('mycmd', mycmd))
```

## Testing
- Test plugins locally with the bot and dashboard
- Use `/reload_plugins` to hot-reload plugins

## Publishing
- Document your plugin and open a PR to share with the community

--- 