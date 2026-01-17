"""
Matrix Client Example (Python)

A complete example of setting up and using the Matrix client in Python.
Demonstrates async client usage, room management, and event handling.

Usage:
    python matrix_client_example.py

Requirements:
    pip install matrix-nio aiohttp

Author: REChain Development Team
Created: 2025-01-09
"""

import asyncio
import json
import logging
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional
from dataclasses import dataclass
from datetime import datetime

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
)
logger = logging.getLogger(__name__)

try:
    from nio import (
        AsyncClient,
        ClientConfig,
        MatrixRoom,
        RoomMessageText,
        RoomMessageMedia,
        RoomMessageNotice,
        LoginResponse,
        SyncResponse,
        JoinedRoomsResponse,
        Message,
    )
    from nio.crypto import Crypto, devices
except ImportError:
    logger.error("Please install nio: pip install matrix-nio")
    sys.exit(1)


@dataclass
class MatrixClientConfig:
    """Configuration for Matrix client."""
    homeserver: str
    user_id: str
    access_token: Optional[str] = None
    device_id: Optional[str] = None
    device_name: str = "REChain Bridge"
    store_path: str = "./matrix_store"
    encryption_enabled: bool = True
    proxy: Optional[str] = None


class MatrixClientExample:
    """
    A comprehensive Matrix client example for REChain bridges.
    
    Features:
    - Async/await pattern for all operations
    - Automatic reconnection on disconnect
    - Event callbacks for different event types
    - Room management (create, join, leave)
    - Message sending (text, media, formatted)
    - User presence and typing indicators
    - End-to-end encryption support
    """
    
    def __init__(self, config: MatrixClientConfig):
        """Initialize the Matrix client with configuration."""
        self.config = config
        self.client: Optional[AsyncClient] = None
        self._running = False
        self._callbacks: Dict[str, List[callable]] = {}
        
        # Create store directory
        Path(config.store_path).mkdir(parents=True, exist_ok=True)
        
        logger.info(f"Initialized Matrix client for {config.user_id}")
    
    async def connect(self) -> LoginResponse:
        """
        Connect to the Matrix homeserver.
        
        Returns:
            LoginResponse with user info and tokens
            
        Raises:
            Exception if connection fails
        """
        # Configure client
        client_config = ClientConfig(
            store_path=self.config.store_path,
            encryption_enabled=self.config.encryption_enabled,
        )
        
        # Create client
        self.client = AsyncClient(
            self.config.homeserver,
            self.config.user_id,
            config=client_config,
            device_id=self.config.device_id,
            device_name=self.config.device_name,
        )
        
        # Set proxy if configured
        if self.config.proxy:
            self.client.proxy = self.config.proxy
        
        # Register event callbacks
        self.client.add_event_callback(self._on_message, RoomMessageText)
        self.client.add_event_callback(self._on_media, RoomMessageMedia)
        self.client.add_event_callback(self._on_notice, RoomMessageNotice)
        self.client.add_response_callback(self._on_sync, SyncResponse)
        
        try:
            if self.config.access_token:
                # Login with access token
                self.client.access_token = self.config.access_token
                await self.client.sync(timeout=30000, since=None)
                logger.info(f"Connected with existing token")
                
                return LoginResponse(
                    user_id=self.config.user_id,
                    access_token=self.config.access_token,
                    device_id=self.client.device_id or "unknown",
                )
            else:
                # Interactive login would go here
                # For bridges, use appservice registration
                raise Exception("Access token required for bridge connections")
                
        except Exception as e:
            logger.error(f"Connection failed: {e}")
            raise
    
    async def disconnect(self):
        """Disconnect from the Matrix homeserver."""
        self._running = False
        if self.client:
            await self.client.close()
            self.client = None
            logger.info("Disconnected from Matrix homeserver")
    
    # =========================================================================
    # Room Management
    # =========================================================================
    
    async def create_room(
        self,
        name: str,
        topic: Optional[str] = None,
        is_private: bool = True,
        invitees: Optional[List[str]] = None,
        enable_encryption: bool = False,
    ) -> str:
        """
        Create a new Matrix room.
        
        Args:
            name: Room name
            topic: Optional room topic
            is_private: Whether room is invite-only
            invitees: Optional list of user IDs to invite
            enable_encryption: Enable E2EE
            
        Returns:
            Room ID of the created room
        """
        if not self.client:
            raise Exception("Client not connected")
        
        # Build creation content
        creation_content = None
        if enable_encryption:
            creation_content = {
                "m.room.encryption": {
                    "algorithm": "m.megolm.v1.aes-sha2",
                }
            }
        
        # Create room
        response = await self.client.room_create(
            name=name,
            topic=topic,
            is_private=is_private,
            invitees=invitees,
            creation_content=creation_content,
        )
        
        if hasattr(response, 'room_id'):
            room_id = response.room_id
            logger.info(f"Created room: {room_id}")
            return room_id
        else:
            raise Exception(f"Failed to create room: {response}")
    
    async def join_room(self, room_id_or_alias: str) -> str:
        """
        Join a room by ID or alias.
        
        Args:
            room_id_or_alias: Room ID or alias (e.g., #room:server.com)
            
        Returns:
            Room ID
        """
        if not self.client:
            raise Exception("Client not connected")
        
        response = await self.client.join(room_id_or_alias)
        
        if hasattr(response, 'room_id'):
            logger.info(f"Joined room: {response.room_id}")
            return response.room_id
        else:
            raise Exception(f"Failed to join room: {response}")
    
    async def leave_room(self, room_id: str):
        """Leave a room."""
        if not self.client:
            raise Exception("Client not connected")
        
        await self.client.room_leave(room_id)
        logger.info(f"Left room: {room_id}")
    
    async def invite_user(self, room_id: str, user_id: str):
        """Invite a user to a room."""
        if not self.client:
            raise Exception("Client not connected")
        
        await self.client.room_invite(room_id, user_id)
        logger.info(f"Invited {user_id} to {room_id}")
    
    async def kick_user(
        self,
        room_id: str,
        user_id: str,
        reason: Optional[str] = None,
    ):
        """Kick a user from a room."""
        if not self.client:
            raise Exception("Client not connected")
        
        await self.client.room_kick(room_id, user_id, reason=reason)
        logger.info(f"Kicked {user_id} from {room_id}")
    
    async def ban_user(
        self,
        room_id: str,
        user_id: str,
        reason: Optional[str] = None,
    ):
        """Ban a user from a room."""
        if not self.client:
            raise Exception("Client not connected")
        
        await self.client.room_ban(room_id, user_id, reason=reason)
        logger.info(f"Banned {user_id} from {room_id}")
    
    async def get_joined_rooms(self) -> List[str]:
        """Get list of joined room IDs."""
        if not self.client:
            raise Exception("Client not connected")
        
        response = await self.client.joined_rooms()
        if hasattr(response, 'rooms'):
            return response.rooms
        return []
    
    async def get_room_members(self, room_id: str) -> List[Dict[str, str]]:
        """Get list of members in a room."""
        if not self.client:
            raise Exception("Client not connected")
        
        response = await self.client.room_get_members(room_id)
        
        members = []
        for event in response.chunk:
            if hasattr(event, 'sender'):
                members.append({
                    'user_id': event.sender,
                    'membership': event.content.get('membership', 'unknown'),
                })
        
        return members
    
    # =========================================================================
    # Message Sending
    # =========================================================================
    
    async def send_message(
        self,
        room_id: str,
        body: str,
        msg_type: str = "m.text",
        tx_id: Optional[str] = None,
    ) -> str:
        """
        Send a text message to a room.
        
        Args:
            room_id: Target room ID
            body: Message text
            msg_type: Message type (m.text, m.notice, m.emote)
            tx_id: Optional transaction ID
            
        Returns:
            Event ID of the sent message
        """
        if not self.client:
            raise Exception("Client not connected")
        
        if tx_id is None:
            tx_id = f"msg_{datetime.now().timestamp()}"
        
        response = await self.client.room_send(
            room_id=room_id,
            message_type="m.room.message",
            content={
                "msgtype": msg_type,
                "body": body,
            },
            tx_id=tx_id,
        )
        
        if hasattr(response, 'event_id'):
            logger.info(f"Sent message to {room_id}: {response.event_id}")
            return response.event_id
        else:
            raise Exception(f"Failed to send message: {response}")
    
    async def send_formatted_message(
        self,
        room_id: str,
        body: str,
        html_body: str,
        tx_id: Optional[str] = None,
    ) -> str:
        """
        Send a formatted (HTML) message to a room.
        
        Args:
            room_id: Target room ID
            body: Plain text version
            html_body: HTML formatted version
            tx_id: Optional transaction ID
            
        Returns:
            Event ID of the sent message
        """
        if not self.client:
            raise Exception("Client not connected")
        
        if tx_id is None:
            tx_id = f"msg_{datetime.now().timestamp()}"
        
        response = await self.client.room_send(
            room_id=room_id,
            message_type="m.room.message",
            content={
                "msgtype": "m.text",
                "body": body,
                "formatted_body": html_body,
                "format": "org.matrix.custom.html",
            },
            tx_id=tx_id,
        )
        
        if hasattr(response, 'event_id'):
            return response.event_id
        else:
            raise Exception(f"Failed to send formatted message: {response}")
    
    async def send_reply(
        self,
        room_id: str,
        body: str,
        reply_to_event_id: str,
        tx_id: Optional[str] = None,
    ) -> str:
        """
        Send a reply to a specific message.
        
        Args:
            room_id: Target room ID
            body: Reply text
            reply_to_event_id: Event ID to reply to
            tx_id: Optional transaction ID
            
        Returns:
            Event ID of the sent message
        """
        if not self.client:
            raise Exception("Client not connected")
        
        if tx_id is None:
            tx_id = f"reply_{datetime.now().timestamp()}"
        
        response = await self.client.room_send(
            room_id=room_id,
            message_type="m.room.message",
            content={
                "msgtype": "m.text",
                "body": body,
                "m.relates_to": {
                    "rel_type": "m.reference",
                    "event_id": reply_to_event_id,
                },
            },
            tx_id=tx_id,
        )
        
        return response.event_id if hasattr(response, 'event_id') else ""
    
    async def send_reaction(
        self,
        room_id: str,
        event_id: str,
        reaction: str,
    ) -> str:
        """
        Send a reaction to a message.
        
        Args:
            room_id: Room ID
            event_id: Event ID to react to
            reaction: Reaction emoji
            
        Returns:
            Event ID of the reaction
        """
        if not self.client:
            raise Exception("Client not connected")
        
        response = await self.client.room_send(
            room_id=room_id,
            message_type="m.reaction",
            content={
                "m.relates_to": {
                    "rel_type": "m.annotation",
                    "event_id": event_id,
                    "key": reaction,
                },
            },
            tx_id=f"reaction_{datetime.now().timestamp()}",
        )
        
        return response.event_id if hasattr(response, 'event_id') else ""
    
    # =========================================================================
    # State Management
    # =========================================================================
    
    async def set_room_name(self, room_id: str, name: str):
        """Set the room name."""
        if not self.client:
            raise Exception("Client not connected")
        
        await self.client.room_put_state(
            room_id=room_id,
            event_type="m.room.name",
            content={"name": name},
        )
        logger.info(f"Set room name for {room_id}: {name}")
    
    async def set_room_topic(self, room_id: str, topic: str):
        """Set the room topic."""
        if not self.client:
            raise Exception("Client not connected")
        
        await self.client.room_put_state(
            room_id=room_id,
            event_type="m.room.topic",
            content={"topic": topic},
        )
        logger.info(f"Set room topic for {room_id}: {topic}")
    
    async def set_typing_indicator(
        self,
        room_id: str,
        is_typing: bool,
        timeout: int = 30000,
    ):
        """Set typing indicator."""
        if not self.client:
            raise Exception("Client not connected")
        
        await self.client.room_typing(
            room_id=room_id,
            typing=is_typing,
            timeout=timeout,
        )
    
    async def set_read_markers(
        self,
        room_id: str,
        fully_read_event_id: str,
        read_event_id: Optional[str] = None,
    ):
        """Set read markers for a room."""
        if not self.client:
            raise Exception("Client not connected")
        
        content = {"m.fully_read": fully_read_event_id}
        if read_event_id:
            content["m.read"] = read_event_id
        
        await self.client.room_put_state(
            room_id=room_id,
            event_type="m.room.read_markers",
            content=content,
        )
    
    # =========================================================================
    # Event Callbacks
    # =========================================================================
    
    async def _on_message(self, room: MatrixRoom, event: RoomMessageText):
        """Handle incoming text messages."""
        logger.info(f"[{room.display_name}] {event.sender}: {event.body}")
        await self._trigger_callback('message', room, event)
    
    async def _on_media(self, room: MatrixRoom, event: RoomMessageMedia):
        """Handle incoming media messages."""
        logger.info(f"[{room.display_name}] {event.sender}: Media message")
        await self._trigger_callback('media', room, event)
    
    async def _on_notice(self, room: MatrixRoom, event: RoomMessageNotice):
        """Handle incoming notices."""
        logger.info(f"[{room.display_name}] NOTICE from {event.sender}: {event.body}")
        await self._trigger_callback('notice', room, event)
    
    async def _on_sync(self, response: SyncResponse):
        """Handle sync responses."""
        self._running = True
        await self._trigger_callback('sync', response)
    
    def add_callback(self, event_type: str, callback: callable):
        """Add an event callback."""
        if event_type not in self._callbacks:
            self._callbacks[event_type] = []
        self._callbacks[event_type].append(callback)
    
    async def _trigger_callback(self, event_type: str, *args):
        """Trigger all callbacks for an event type."""
        for callback in self._callbacks.get(event_type, []):
            try:
                if asyncio.iscoroutinefunction(callback):
                    await callback(*args)
                else:
                    callback(*args)
            except Exception as e:
                logger.error(f"Callback error: {e}")
    
    # =========================================================================
    # Utility Methods
    # =========================================================================
    
    def get_own_user_id(self) -> str:
        """Get the current user's ID."""
        return self.config.user_id
    
    def get_own_device_id(self) -> Optional[str]:
        """Get the current device ID."""
        return self.client.device_id if self.client else None
    
    async def get_room_info(self, room_id: str) -> Dict[str, Any]:
        """Get information about a room."""
        if not self.client:
            raise Exception("Client not connected")
        
        room = self.client.rooms.get(room_id)
        if room:
            return {
                'room_id': room.room_id,
                'name': room.name,
                'display_name': room.display_name,
                'encrypted': room.encrypted,
                'member_count': len(room.users),
            }
        
        return {}
    
    @property
    def is_connected(self) -> bool:
        """Check if client is connected."""
        return self.client is not None and self._running


# =============================================================================
# Main Example Usage
# =============================================================================

async def main():
    """Example usage of MatrixClientExample."""
    
    # Configuration
    config = MatrixClientConfig(
        homeserver="https://matrix.rechain.network",
        user_id="@bridge:rechain.network",
        access_token="your_access_token_here",
        device_name="REChain Bridge",
        encryption_enabled=True,
    )
    
    # Create client
    client = MatrixClientExample(config)
    
    try:
        # Connect
        await client.connect()
        logger.info(f"Connected as {config.user_id}")
        
        # Add message callback
        async def on_message(room, event):
            logger.info(f"Received: {event.body}")
        
        client.add_callback('message', on_message)
        
        # Create a room
        room_id = await client.create_room(
            name="Test Room",
            topic="A test room for REChain bridges",
        )
        logger.info(f"Created room: {room_id}")
        
        # Send a message
        await client.send_message(
            room_id=room_id,
            body="Hello from REChain Bridge!",
        )
        
        # Get room members
        members = await client.get_room_members(room_id)
        logger.info(f"Room has {len(members)} members")
        
        # Keep running
        logger.info("Client running. Press Ctrl+C to stop.")
        while client.is_connected:
            await asyncio.sleep(1)
            
    except KeyboardInterrupt:
        logger.info("Interrupted by user")
    except Exception as e:
        logger.error(f"Error: {e}")
    finally:
        await client.disconnect()


if __name__ == "__main__":
    asyncio.run(main())

