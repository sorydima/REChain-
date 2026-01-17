/**
 * Bot Example for REChain
 * Demonstrates creating a Matrix bot with command handling
 */

const { MatrixClient } = require('matrix-js-sdk');

class MatrixBot {
    constructor(config) {
        this.config = config;
        this.commands = new Map();
        this.aliases = new Map();
        
        this.client = MatrixClient.createClient({
            baseUrl: config.homeserverUrl,
            userId: config.userId,
            accessToken: config.accessToken
        });
    }

    start() {
        this.client.startClient({ pollTimeout: 30000 });
        
        this.client.on('room.message', this.handleMessage.bind(this));
        this.client.on('room.invite', this.handleInvite.bind(this));
        
        console.log('Bot started as', this.config.userId);
        
        // Register default commands
        this.registerDefaultCommands();
    }

    handleMessage(roomId, event) {
        if (event.sender === this.client.getUserId()) return;
        
        const content = event.content;
        if (content.msgtype !== 'm.text') return;
        
        const body = content.body;
        
        // Check for command prefix
        const commandPrefix = this.config.commandPrefix || '!';
        if (!body.startsWith(commandPrefix)) return;
        
        const args = body.slice(commandPrefix.length).split(' ');
        const command = args.shift().toLowerCase();
        
        console.log(`Command in ${roomId}: ${command}`);
        
        this.executeCommand(roomId, command, args, event);
    }

    handleInvite(roomId, event) {
        console.log(`Invited to ${roomId}`);
        this.client.joinRoom(roomId).then(() => {
            this.sendMessage(roomId, 'Thanks for the invite! Use !help for commands.');
        });
    }

    executeCommand(roomId, command, args, event) {
        // Check aliases
        const actualCommand = this.aliases.get(command) || command;
        
        const handler = this.commands.get(actualCommand);
        if (!handler) {
            this.sendMessage(roomId, `Unknown command: ${command}`);
            return;
        }
        
        try {
            const context = {
                roomId,
                sender: event.sender,
                args,
                reply: (msg) => this.sendReply(roomId, event.event_id, msg),
                sendHtml: (body, html) => this.sendHtmlMessage(roomId, body, html)
            };
            
            handler(context);
        } catch (e) {
            console.error('Command error:', e);
            this.sendMessage(roomId, `Error: ${e.message}`);
        }
    }

    registerCommand(name, handler, options = {}) {
        this.commands.set(name, handler);
        
        if (options.alias) {
            for (const alias of options.alias) {
                this.aliases.set(alias, name);
            }
        }
        
        return this;
    }

    registerDefaultCommands() {
        this.registerCommand('help', (ctx) => {
            const commands = Array.from(this.commands.keys());
            ctx.reply(`Available commands: ${commands.join(', ')}`);
        });

        this.registerCommand('ping', (ctx) => {
            ctx.reply('Pong! 🏓');
        });

        this.registerCommand('echo', (ctx) => {
            ctx.reply(ctx.args.join(' ') || 'Echo what?');
        });

        this.registerCommand('info', (ctx) => {
            ctx.sendHtml(
                '<b>REChain Bot</b>',
                '<b>REChain Bot</b><br/>Version: 4.2.0<br/>A Matrix bridge bot'
            );
        });

        this.registerCommand('source', (ctx) => {
            ctx.reply('https://github.com/sorydima/REChain-');
        });
    }

    async sendMessage(roomId, message) {
        return this.client.sendTextMessage(roomId, message);
    }

    async sendReply(roomId, replyToEventId, message) {
        const content = {
            body: message,
            msgtype: 'm.text',
            'm.relates_to': {
                rel_type: 'm.reference',
                event_id: replyToEventId
            }
        };
        return this.client.sendMessage(roomId, content);
    }

    async sendHtmlMessage(roomId, body, html) {
        return this.client.sendHtmlMessage(roomId, body, html);
    }

    async joinRoom(roomIdOrAlias) {
        return this.client.joinRoom(roomIdOrAlias);
    }

    async leaveRoom(roomId) {
        return this.client.leaveRoom(roomId);
    }

    async getRooms() {
        return this.client.getJoinedRooms();
    }

    async getRoomMembers(roomId) {
        return this.client.getRoomMembers(roomId);
    }

    stop() {
        this.client.stopClient();
        console.log('Bot stopped');
    }
}

module.exports = MatrixBot;

// Usage Example
// const bot = new MatrixBot({
//     homeserverUrl: 'https://matrix.rechain.network',
//     userId: '@bot:rechain.network',
//     accessToken: 'your_access_token',
//     commandPrefix: '!'
// });
// 
// bot.registerCommand('hello', (ctx) => {
//     ctx.reply('Hello! 👋');
// });
// 
// bot.start();


