# Matrix API Reference

## Send Message
- **REST:** `POST /api/v1/matrix/sendMessage`
- **gRPC:** `MatrixService.SendMessage`
- **Auth:** Bearer token required

### Request (REST)
```json
{
  "room_id": "!abc123:matrix.org",
  "content": "Hello, world!"
}
```

### Response
```json
{
  "event_id": "$event123"
}
```

## Create Room
- **REST:** `POST /api/v1/matrix/createRoom`
- **gRPC:** `MatrixService.CreateRoom`

### Request
```json
{
  "name": "Test Room",
  "is_public": true
}
```

### Response
```json
{
  "room_id": "!def456:matrix.org"
}
```

## List Users
- **REST:** `GET /api/v1/matrix/users`
- **gRPC:** `MatrixService.ListUsers`

### Response
```json
[
  { "user_id": "@alice:matrix.org" },
  { "user_id": "@bob:matrix.org" }
]
```

## Bridge Management
- **REST:** `POST /api/v1/matrix/bridge`
- **gRPC:** `MatrixService.ManageBridge`

---

For more, see [Matrix Backend Extensions](../docs/MATRIX_BACKEND_EXTENSIONS.md). 