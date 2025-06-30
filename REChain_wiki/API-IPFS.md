# IPFS API Reference

## Upload File
- **REST:** `POST /api/v1/ipfs/upload`
- **gRPC:** `IPFSService.UploadFile`
- **Auth:** Bearer token required

### Request (multipart/form-data)
- `file`: The file to upload

### Response
```json
{
  "cid": "Qm...",
  "provider": "Pinata"
}
```

## Download File
- **REST:** `GET /api/v1/ipfs/download/{cid}`
- **gRPC:** `IPFSService.DownloadFile`

## Pin File
- **REST:** `POST /api/v1/ipfs/pin`
- **gRPC:** `IPFSService.PinFile`

### Request
```json
{
  "cid": "Qm..."
}
```

### Response
```json
{
  "status": "pinned"
}
```

## Analytics
- **REST:** `GET /api/v1/ipfs/analytics`
- **gRPC:** `IPFSService.GetAnalytics`

---

For more, see [IPFS Integration](../docs/IPFS_INTEGRATION.md). 