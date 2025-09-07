# REChain API Reference

This document provides a comprehensive reference for the REChain API endpoints, parameters, and responses.

## Authentication

All API requests require authentication using JWT tokens.

```bash
Authorization: Bearer <your-jwt-token>
```

## Base URL

```
https://api.rechain.network/v1
```

## Endpoints

### Users

#### GET /users
Retrieve a list of users.

**Parameters:**
- `limit` (optional): Number of users to return (default: 20)
- `offset` (optional): Offset for pagination (default: 0)

**Response:**
```json
{
  "users": [
    {
      "id": "string",
      "username": "string",
      "email": "string",
      "created_at": "2023-01-01T00:00:00Z"
    }
  ],
  "total": 100,
  "limit": 20,
  "offset": 0
}
```

#### POST /users
Create a new user.

**Request Body:**
```json
{
  "username": "string",
  "email": "string",
  "password": "string"
}
```

**Response:**
```json
{
  "id": "string",
  "username": "string",
  "email": "string",
  "created_at": "2023-01-01T00:00:00Z"
}
```

#### GET /users/{id}
Retrieve a specific user.

**Parameters:**
- `id`: User ID

**Response:**
```json
{
  "id": "string",
  "username": "string",
  "email": "string",
  "created_at": "2023-01-01T00:00:00Z"
}
```

#### PUT /users/{id}
Update a user.

**Parameters:**
- `id`: User ID

**Request Body:**
```json
{
  "username": "string",
  "email": "string"
}
```

**Response:**
```json
{
  "id": "string",
  "username": "string",
  "email": "string",
  "updated_at": "2023-01-01T00:00:00Z"
}
```

#### DELETE /users/{id}
Delete a user.

**Parameters:**
- `id`: User ID

**Response:**
```json
{
  "message": "User deleted successfully"
}
```

### Messages

#### GET /messages
Retrieve messages.

**Parameters:**
- `room_id` (optional): Room ID to filter messages
- `limit` (optional): Number of messages to return (default: 50)
- `before` (optional): Get messages before this timestamp

**Response:**
```json
{
  "messages": [
    {
      "id": "string",
      "room_id": "string",
      "sender_id": "string",
      "content": "string",
      "timestamp": "2023-01-01T00:00:00Z"
    }
  ],
  "end": "string"
}
```

#### POST /messages
Send a message.

**Request Body:**
```json
{
  "room_id": "string",
  "content": "string",
  "msgtype": "m.text"
}
```

**Response:**
```json
{
  "event_id": "string"
}
```

### Rooms

#### GET /rooms
Get user's rooms.

**Response:**
```json
{
  "rooms": [
    {
      "room_id": "string",
      "name": "string",
      "topic": "string",
      "members": 10
    }
  ]
}
```

#### POST /rooms
Create a room.

**Request Body:**
```json
{
  "name": "string",
  "topic": "string",
  "visibility": "private"
}
```

**Response:**
```json
{
  "room_id": "string"
}
```

### Blockchain

#### GET /blockchain/balance
Get wallet balance.

**Parameters:**
- `address`: Wallet address

**Response:**
```json
{
  "address": "string",
  "balance": "1000000000000000000",
  "symbol": "ETH"
}
```

#### POST /blockchain/transfer
Transfer tokens.

**Request Body:**
```json
{
  "from": "string",
  "to": "string",
  "amount": "1000000000000000000",
  "symbol": "ETH"
}
```

**Response:**
```json
{
  "tx_hash": "string"
}
```

### IPFS

#### POST /ipfs/upload
Upload file to IPFS.

**Request Body:** (multipart/form-data)
- `file`: File to upload

**Response:**
```json
{
  "hash": "Qm...",
  "url": "https://ipfs.io/ipfs/Qm..."
}
```

#### GET /ipfs/{hash}
Retrieve file from IPFS.

**Parameters:**
- `hash`: IPFS hash

**Response:** File content

### AI

#### POST /ai/generate
Generate AI response.

**Request Body:**
```json
{
  "prompt": "string",
  "model": "gpt-3.5-turbo",
  "max_tokens": 100
}
```

**Response:**
```json
{
  "response": "string",
  "usage": {
    "prompt_tokens": 10,
    "completion_tokens": 20,
    "total_tokens": 30
  }
}
```

## Error Responses

All errors follow this format:

```json
{
  "error": "Error message",
  "code": "ERROR_CODE",
  "details": {}
}
```

### Common Error Codes
- `INVALID_REQUEST`: Invalid request parameters
- `UNAUTHORIZED`: Authentication required
- `FORBIDDEN`: Insufficient permissions
- `NOT_FOUND`: Resource not found
- `INTERNAL_ERROR`: Server error

## Rate Limiting

API requests are rate limited:
- 1000 requests per hour for authenticated users
- 100 requests per hour for unauthenticated users

Rate limit headers:
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1638360000
```

## SDKs and Libraries

- [REChain JavaScript SDK](https://github.com/sorydima/REChain-js-sdk)
- [REChain Python SDK](https://github.com/sorydima/REChain-python-sdk)
- [REChain Flutter SDK](https://github.com/sorydima/REChain-flutter-sdk)

## Changelog

### v1.0.0
- Initial API release
- Basic user, message, and room endpoints

### v1.1.0
- Added blockchain integration
- Added IPFS file storage

### v1.2.0
- Added AI endpoints
- Improved error handling

---

*This API reference is part of the REChain documentation suite.*
