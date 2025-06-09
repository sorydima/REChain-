# TON Integration

This module provides integration with the TON blockchain, including wallet management, NFT marketplace, and investment features.

## Features

- TON Wallet Management
  - Create/import wallets
  - Send/receive TON
  - Transaction history
  - Balance tracking

- NFT Marketplace
  - Browse NFT collections
  - Buy/sell NFTs
  - View owned NFTs
  - Favorite NFTs

- Investment Features
  - Multiple investment pools
  - Risk-based investment options
  - Return tracking
  - Staking capabilities

## Integration Steps

1. Add TON feature to your app's navigation:

```dart
// In your app's main navigation
import 'package:rechainonline/features/ton/navigation/ton_navigation.dart';

// Add TON button to app bar
AppBar(
  actions: [
    const TonFeatureButton(),
    // ... other actions
  ],
)

// Or add to navigation rail
NavigationRail(
  destinations: [
    const TonNavigationDestination(),
    // ... other destinations
  ],
)

// Or add to navigation bar
NavigationBar(
  destinations: [
    const TonNavigationItem(),
    // ... other items
  ],
)

// Or add to drawer
Drawer(
  child: ListView(
    children: [
      const TonDrawerItem(),
      // ... other items
    ],
  ),
)
```

2. Initialize TON services in your app:

```dart
// In your app's initialization
import 'package:rechainonline/features/ton/ton_service_manager.dart';

Future<void> initializeApp() async {
  // Initialize other services...
  
  // Initialize TON services
  await TonServiceManager.instance.initialize();
}
```

3. Configure TON bridge:

- Copy `ton_bridge_config.yaml` and `ton_bridge_registration.yaml` to your Matrix homeserver configuration directory
- Update the configuration files with your domain and security tokens
- Register the bridge with your homeserver:
```bash
# On your Matrix homeserver
register-ton-bridge -c config.yaml -r registration.yaml
```

4. Update your app's configuration:

```yaml
# In your app's config
features:
  ton:
    enabled: true
    bridge_enabled: true
    nft_marketplace: true
    investments: true
```

## Architecture

The TON integration follows a modular architecture:

```
lib/features/ton/
├── core/                 # Core TON functionality
│   ├── ton_client.dart  # TON blockchain client
│   └── ton_config.dart  # Configuration
├── wallet/              # Wallet management
├── nft/                 # NFT marketplace
├── hyip/               # Investment features
├── bridge/             # Matrix bridge
├── screens/            # UI screens
└── navigation/         # Navigation helpers
```

## Usage Examples

1. Access TON wallet:

```dart
final walletService = TonWalletService.instance;
final wallet = await walletService.createWallet(name: 'My Wallet');
```

2. Work with NFTs:

```dart
final nftService = TonNftService.instance;
final nfts = await nftService.getNftsForAddress(wallet.address);
```

3. Manage investments:

```dart
final investmentService = TonInvestmentService.instance;
final pools = await investmentService.getAvailablePools();
```

## Security Considerations

1. Private Keys
- Private keys are stored securely using Flutter Secure Storage
- Keys are never exposed in plaintext
- Biometric authentication is recommended

2. Smart Contracts
- All contracts are verified and audited
- Risk warnings are displayed for investments
- Transaction limits are enforced

3. Bridge Security
- Secure token generation
- Rate limiting
- Input validation

## Error Handling

The integration includes comprehensive error handling:

```dart
try {
  await TonServiceManager.instance.initialize();
} catch (e) {
  // Handle initialization error
}
```

Common error scenarios:
- Network connectivity issues
- Insufficient balance
- Invalid addresses
- Smart contract errors

## Monitoring

Service health can be monitored:

```dart
final status = await TonServiceManager.instance.performHealthCheck();
final stats = await TonServiceManager.instance.getServiceStatistics();
```

## Testing

Run the tests:

```bash
flutter test lib/features/ton/
```

## Contributing

1. Follow the existing architecture
2. Add tests for new features
3. Update documentation
4. Submit a pull request

## License

This TON integration is part of REChain and is licensed under the same terms.
