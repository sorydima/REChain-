# Auth API Reference

## Login
- **REST:** `POST /api/v1/auth/login`
- **gRPC:** `AuthService.Login`
- **Auth:** None (returns token)

### Request
```json
{
  "username": "alice",
  "password": "password123"
}
```

### Response
```json
{
  "token": "eyJ..."
}
```

## OAuth
- **REST:** `POST /api/v1/auth/oauth`
- **gRPC:** `AuthService.OAuth`

### Request
```json
{
  "provider": "github",
  "code": "oauth_code"
}
```

### Response
```json
{
  "token": "eyJ...",
  "profile": { "id": "123", "name": "Alice" }
}
```

## Web3 Auth
- **REST:** `POST /api/v1/auth/web3`
- **gRPC:** `AuthService.Web3Auth`

### Request
```json
{
  "address": "0x123...",
  "signature": "0xabc..."
}
```

### Response
```json
{
  "token": "eyJ..."
}
```

## Identity Verification
- **REST:** `POST /api/v1/auth/identity/verify`
- **gRPC:** `AuthService.VerifyIdentity`

---

For more, see [docs/](../docs/). 