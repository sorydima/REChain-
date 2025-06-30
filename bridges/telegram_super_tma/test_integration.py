import pytest
from unittest.mock import AsyncMock, patch, MagicMock
import yaml
import os
from bot import handle_message, bridge_add, bridge_remove, bridge_list

class DummyUpdate:
    def __init__(self, chat_id, text=None, photo=None, document=None, user_id=1):
        self.effective_chat = MagicMock(id=chat_id)
        self.effective_user = MagicMock(id=user_id)
        self.message = MagicMock(text=text, photo=photo, document=document)
        self.message.reply_text = AsyncMock()

class DummyContext:
    def __init__(self, args=None):
        self.args = args or []

@pytest.mark.asyncio
async def test_handle_message_text():
    update = DummyUpdate(chat_id='123', text='Hello')
    context = DummyContext()
    with patch('bot.matrix_bridge') as mock_bridge:
        mock_bridge.send_message = AsyncMock()
        with patch('bot.ai_moderate', AsyncMock(return_value=True)):
            await handle_message(update, context)
            mock_bridge.send_message.assert_awaited()
            update.message.reply_text.assert_not_awaited()

@pytest.mark.asyncio
async def test_handle_message_blocked():
    update = DummyUpdate(chat_id='123', text='badword')
    context = DummyContext()
    with patch('bot.matrix_bridge') as mock_bridge:
        mock_bridge.send_message = AsyncMock()
        with patch('bot.ai_moderate', AsyncMock(return_value=False)):
            await handle_message(update, context)
            mock_bridge.send_message.assert_not_awaited()
            update.message.reply_text.assert_awaited()

@pytest.mark.asyncio
async def test_bridge_add_remove_list():
    update = DummyUpdate(chat_id='123', user_id=42)
    context = DummyContext(args=['123', '!room:matrix.org'])
    # Patch admin check and mappings
    with patch('bot.ADMIN_IDS', [42]):
        with patch('bot.dynamic_mappings', {}):
            with patch('bot.save_mappings'):
                await bridge_add(update, context)
                context2 = DummyContext(args=['123'])
                await bridge_remove(update, context2)
                await bridge_list(update, DummyContext())
                # Should call reply_text for each
                assert update.message.reply_text.await_count >= 1 