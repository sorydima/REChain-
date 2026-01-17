// Matrix Client Example (JavaScript)
// Demonstrates Matrix client usage in Node.js

const { MatrixClient } = require('matrix-js-sdk');

class MatrixBotExample {
    constructor(homeserverUrl, userId, accessToken) {
        this.client = MatrixClient.createClient({
            baseUrl: homeserverUrl,
            userId: userId,
            accessToken: accessToken
        });
    }

    async start() {
        // Start syncing
        await this.client.startClient({ pollTimeout: 30000 });

        // Set up event handlers
        this.client.on('room.message', this.handleMessage.bind(this));
        this.client.on('room.join', this.handleJoin.bind(this));

        console.log('Bot started');
    }

    handleMessage(roomId, event) {
        if (event.sender === this.client.getUserId()) return;

        const content = event.content;
        console.log(`[${roomId}] ${event.sender}: ${content.body}`);

        // Respond to commands
        if (content.body === '!ping') {
            this.sendMessage(roomId, 'Pong!');
        }
    }

    handleJoin(roomId) {
        console.log(`Joined room: ${roomId}`);
    }

    async sendMessage(roomId, message) {
        return this.client.sendTextMessage(roomId, message);
    }

    async sendHtmlMessage(roomId, body, html) {
        return this.client.sendHtmlMessage(roomId, body, html);
    }

    async joinRoom(roomId) {
        return this.client.joinRoom(roomId);
    }

    async createRoom(name, isPrivate = true) {
        return this.client.createRoom({
            name: name,
            visibility: isPrivate ? 'private' : 'public',
            preset: isPrivate ? 'private_chat' : 'public_chat'
        });
    }
}

module.exports = MatrixBotExample;

// Usage
// const bot = new MatrixBotExample(
//     'https://matrix.rechain.network',
//     '@bot:rechain.network',
//     'your_access_token'
// );
// bot.start();


