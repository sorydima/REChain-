import asyncio
import yaml
from nio import AsyncClient, MatrixRoom, RoomMessageText, RoomMessageMedia, UploadResponse
import mimetypes
import aiohttp
import os

# Load config
with open('config.yaml') as f:
    config = yaml.safe_load(f)
MATRIX_HOMESERVER = config['matrix']['homeserver']
MATRIX_USER_ID = config['matrix']['user_id']
MATRIX_ACCESS_TOKEN = config['matrix']['access_token']
ALLOWED_ROOMS = config['matrix'].get('allowed_rooms', [])
CHAT_ROOM_MAPPING = config['bridge']['chat_room_mapping']

class MatrixBridge:
    def __init__(self, telegram_callback=None):
        self.client = AsyncClient(MATRIX_HOMESERVER, MATRIX_USER_ID, device_id="TMA_DEVICE")
        self.client.access_token = MATRIX_ACCESS_TOKEN
        self.client.add_event_callback(self.on_message, RoomMessageText)
        self.client.add_event_callback(self.on_media, RoomMessageMedia)
        self.telegram_callback = telegram_callback

    async def on_message(self, room: MatrixRoom, event: RoomMessageText):
        if room.room_id in ALLOWED_ROOMS:
            print(f"[Matrix] {room.display_name}: {event.body}")
            # Forward to Telegram if mapping exists
            for tg_chat, mx_room in CHAT_ROOM_MAPPING.items():
                if mx_room == room.room_id and self.telegram_callback:
                    await self.telegram_callback(tg_chat, event.body)

    async def on_media(self, room: MatrixRoom, event: RoomMessageMedia):
        if room.room_id in ALLOWED_ROOMS:
            url = getattr(event, 'url', None)
            filename = getattr(event, 'body', 'matrix_media')
            if url and url.startswith('mxc://'):
                # Download from Matrix content repo
                mxc_url = url
                http_url = self.client.mxc_to_http(mxc_url)
                tmp_path = f"/tmp/tma_{filename}"
                async with aiohttp.ClientSession() as session:
                    async with session.get(http_url) as resp:
                        if resp.status == 200:
                            with open(tmp_path, 'wb') as f:
                                f.write(await resp.read())
                            for tg_chat, mx_room in CHAT_ROOM_MAPPING.items():
                                if mx_room == room.room_id and self.telegram_callback:
                                    await self.telegram_callback(tg_chat, None, file_path=tmp_path)
                            os.remove(tmp_path)
                        else:
                            print(f"[Matrix->Telegram] Failed to download media: {resp.status}")
            else:
                # Fallback: send as text link
                for tg_chat, mx_room in CHAT_ROOM_MAPPING.items():
                    if mx_room == room.room_id and self.telegram_callback:
                        await self.telegram_callback(tg_chat, f"[Matrix Media] {url}")

    async def send_message(self, room_id, message):
        await self.client.room_send(
            room_id=room_id,
            message_type="m.room.message",
            content={"msgtype": "m.text", "body": message}
        )

    async def send_media(self, room_id, file_path, mime_type=None):
        if not mime_type:
            mime_type, _ = mimetypes.guess_type(file_path)
        with open(file_path, "rb") as f:
            resp = await self.client.upload(f, content_type=mime_type)
        if isinstance(resp, UploadResponse):
            content = {
                "msgtype": "m.file",
                "body": file_path.split("/")[-1],
                "url": resp.content_uri,
                "info": {"mimetype": mime_type}
            }
            await self.client.room_send(
                room_id=room_id,
                message_type="m.room.message",
                content=content
            )

    async def run(self):
        await self.client.sync_forever(timeout=30000)

# For testing
if __name__ == "__main__":
    bridge = MatrixBridge()
    asyncio.get_event_loop().run_until_complete(bridge.run()) 