# IPFS Integration for REChain Ecosystem

## Overview
The REChain Ecosystem integrates IPFS (InterPlanetary File System) to provide decentralized, censorship-resistant, and permanent file storage and sharing. This integration supports multiple providers, a modern UI, and seamless access from both the main dashboard and navigation rail.

---

## Features
- **Multi-provider support:** Pinata, Web3.Storage, (extensible to Infura, NFT.Storage, Filebase, etc.)
- **Unified API:** Upload, download, pin/unpin, list, and provider status
- **Modern UI:** Tabs for each provider, file manager, quick actions, logs, and real-time status
- **Provider switching:** Change between providers at runtime
- **Integration points:** Available as a dashboard tab, standalone page, and navigation rail item
- **Extensible:** Add new providers with minimal code

---

## Supported Providers
- **Pinata**: https://pinata.cloud/
- **Web3.Storage**: https://web3.storage/
- *(Pluggable: Infura, NFT.Storage, Filebase, Fleek, Crust, etc.)*

---

## Usage
### 1. Accessing the IPFS Dashboard
- **Main Dashboard Tab:** Go to the Integration Dashboard and select the "IPFS" tab.
- **Navigation Rail:** Click the cloud upload icon for direct access.
- **Standalone Page:** Deep link or route directly to `/ipfs` (if configured).

### 2. Uploading Files
- Click "Quick Actions" → "Upload File"
- Select a file to upload (file picker integration required)
- The file is uploaded to the selected provider and pinned

### 3. Managing Files
- View all pinned files in the file manager
- Download, pin/unpin, or remove files with one click
- See file metadata, CID, and status

### 4. Switching Providers
- Use the provider tabs to switch between Pinata, Web3.Storage, etc.
- Each provider maintains its own file list and status

### 5. Provider Status & Logs
- See real-time health, storage usage, and error logs
- Quick actions for refresh, upload, and configuration

---

## Configuration
### Environment Variables / API Keys
- **Pinata:**
  - `PINATA_API_KEY`
  - `PINATA_SECRET_API_KEY`
- **Web3.Storage:**
  - `WEB3STORAGE_API_TOKEN`
- *(Add other providers as needed)*

### Example Provider Config
```dart
{
  'pinata': {
    'apiKey': 'your-pinata-api-key',
    'secretApiKey': 'your-pinata-secret',
  },
  'web3storage': {
    'apiToken': 'your-web3storage-token',
  },
}
```

---

## UI/UX
- **Tabs:** One per provider (Pinata, Web3.Storage, ...)
- **File Manager:** List, download, pin/unpin, remove
- **Status Card:** Provider health, storage used, limits
- **Quick Actions:** Upload, refresh, configure
- **Logs Panel:** Real-time logs and error messages

---

## Integration Points
- **Integration Dashboard:** IPFS tab for unified management
- **Navigation Rail:** Quick access icon
- **API:** Exposed via IntegrationManager for use by other modules (Matrix, Blockchain, etc.)

---

## Troubleshooting
- **Upload fails:** Check API keys, provider status, and network connection
- **File not found:** Ensure correct CID and provider
- **Provider unavailable:** Switch to another provider or check service status
- **Logs:** Review the logs panel for error details

---

## Extending Providers
To add a new provider:
1. Implement `IpfsService` for the new provider
2. Register it in `IpfsProviderRegistry`
3. Add config and UI tab as needed

---

## Future Enhancements
- **File picker integration** for uploads
- **Directory and batch uploads**
- **Content encryption** before upload
- **Preview for images, text, and media**
- **More providers:** Infura, NFT.Storage, Filebase, Fleek, Crust, etc.
- **User quotas and usage analytics**
- **Integration with Matrix, Blockchain, and Auth modules**

---

## Example: Uploading a File
```dart
final cid = await integrationManager.uploadToIpfs(
  fileBytes: myFileBytes,
  fileName: 'mydoc.pdf',
);
print('File uploaded to IPFS with CID: $cid');
```

---

## Security
- API keys are stored securely and never exposed to the client
- All uploads are pinned for permanence
- Download links use secure, provider-specific gateways

---

## References
- [IPFS Project](https://ipfs.tech/)
- [Pinata Docs](https://docs.pinata.cloud/)
- [Web3.Storage Docs](https://docs.web3.storage/)

---

*For more details, see the code in `lib/features/ipfs/` and the IntegrationManager.* 