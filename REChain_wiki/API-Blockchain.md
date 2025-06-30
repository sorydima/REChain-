# Blockchain API Reference

## Get Wallet Info
- **REST:** `GET /api/v1/blockchain/wallet/{address}`
- **gRPC:** `BlockchainService.GetWallet`
- **Auth:** Bearer token required

### Response
```json
{
  "address": "0x123...",
  "balance": "100.0",
  "network": "TON"
}
```

## Send Transaction
- **REST:** `POST /api/v1/blockchain/transaction`
- **gRPC:** `BlockchainService.SendTransaction`

### Request
```json
{
  "from": "0x123...",
  "to": "0x456...",
  "amount": "10.0"
}
```

### Response
```json
{
  "tx_hash": "0xabc..."
}
```

## Mint NFT
- **REST:** `POST /api/v1/blockchain/nft/mint`
- **gRPC:** `BlockchainService.MintNFT`

### Request
```json
{
  "owner": "0x123...",
  "metadata": { "name": "My NFT" }
}
```

### Response
```json
{
  "nft_id": "nft_001"
}
```

## Identity Verification
- **REST:** `POST /api/v1/blockchain/identity/verify`
- **gRPC:** `BlockchainService.VerifyIdentity`

---

For more, see [docs/](../docs/). 