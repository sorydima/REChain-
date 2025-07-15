import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../core/ton_client.dart';
import '../core/ton_config.dart';
import '../wallet/ton_wallet_service.dart';
import '../nft/ton_nft_service.dart';
import '../hyip/ton_investment_service.dart';
import '../ton_service_manager.dart';
import '../screens/ton_dashboard_screen.dart';
import '../screens/ton_send_screen.dart';
import '../screens/ton_nft_marketplace_screen.dart';
import '../screens/ton_investment_screen.dart';

void main() {
  late TonServiceManager serviceManager;
  late TonWalletService walletService;
  late TonNftService nftService;
  late TonInvestmentService investmentService;

  setUp(() async {
    serviceManager = TonServiceManager.instance;
    walletService = TonWalletService.instance;
    nftService = TonNftService.instance;
    investmentService = TonInvestmentService.instance;
    
    await serviceManager.initialize();
  });

  tearDown(() async {
    await serviceManager.dispose();
  });

  group('Core Services Tests', () {
    test('TON Client Initialization', () async {
      expect(TonClient.instance, isNotNull);
      
      // Test connection to TON network
      final result = await TonClient.instance.getAccountInfo(
        'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t'
      );
      expect(result, isNotNull);
    });

    test('Service Manager Health Check', () async {
      final health = await serviceManager.performHealthCheck();
      expect(health['overall'], isTrue);
      expect(health['ton_client'], isTrue);
      expect(health['wallet_service'], isTrue);
      expect(health['nft_service'], isTrue);
      expect(health['investment_service'], isTrue);
    });
  });

  group('Wallet Service Tests', () {
    test('Wallet Creation', () async {
      final wallet = await walletService.createWallet(name: 'Test Wallet');
      expect(wallet, isNotNull);
      expect(wallet.name, equals('Test Wallet'));
      expect(wallet.address, isNotEmpty);
      expect(wallet.balance, equals(0.0));
    });

    test('Balance Update', () async {
      final wallet = await walletService.createWallet(name: 'Balance Test');
      await walletService.updateBalance(wallet.id);
      expect(wallet.balance, isNotNull);
    });

    test('Transaction History', () async {
      final wallet = await walletService.createWallet(name: 'History Test');
      final transactions = await walletService.getTransactionHistory();
      expect(transactions, isList);
    });
  });

  group('NFT Service Tests', () {
    test('NFT Listing', () async {
      final listings = await nftService.getMarketplaceListings();
      expect(listings, isList);
    });

    test('NFT Collections', () async {
      final collections = await nftService.getCollections();
      expect(collections, isList);
    });

    test('NFT Search', () async {
      final results = await nftService.searchNfts('test');
      expect(results, isList);
    });
  });

  group('Investment Service Tests', () {
    test('Investment Pools', () async {
      final pools = await investmentService.getAvailablePools();
      expect(pools, isList);
      expect(pools.length, greaterThan(0));
    });

    test('Investment Stats', () async {
      final wallet = await walletService.createWallet(name: 'Investment Test');
      final stats = await investmentService.getInvestmentStats(wallet.address);
      expect(stats, isNotNull);
    });
  });

  group('UI Tests', () {
    testWidgets('Dashboard Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const TonDashboardScreen(),
        ),
      );

      // Verify tabs
      expect(find.text('Wallet'), findsOneWidget);
      expect(find.text('NFTs'), findsOneWidget);
      expect(find.text('Investments'), findsOneWidget);

      // Test tab navigation
      await tester.tap(find.text('NFTs'));
      await tester.pumpAndSettle();
      expect(find.text('No NFTs found'), findsOneWidget);

      await tester.tap(find.text('Investments'));
      await tester.pumpAndSettle();
      expect(find.text('Investment Overview'), findsOneWidget);
    });

    testWidgets('Send Screen', (WidgetTester tester) async {
      final wallet = await walletService.createWallet(name: 'Send Test');
      
      await tester.pumpWidget(
        MaterialApp(
          home: TonSendScreen(wallet: wallet),
        ),
      );

      // Test form validation
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Please enter a recipient address'), findsOneWidget);

      // Test address input
      await tester.enterText(
        find.byType(TextFormField).first,
        'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t'
      );
      await tester.pumpAndSettle();

      // Test amount input
      await tester.enterText(
        find.byType(TextFormField).at(1),
        '1.0'
      );
      await tester.pumpAndSettle();
    });

    testWidgets('NFT Marketplace Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const TonNftMarketplaceScreen(),
        ),
      );

      // Verify marketplace sections
      expect(find.text('Listings'), findsOneWidget);
      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);

      // Test search functionality
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byType(TextField),
        'test nft'
      );
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
    });

    testWidgets('Investment Screen', (WidgetTester tester) async {
      final pools = await investmentService.getAvailablePools();
      final pool = pools.first;
      
      await tester.pumpWidget(
        MaterialApp(
          home: TonInvestmentScreen(pool: pool),
        ),
      );

      // Verify investment form
      expect(find.text(pool.name), findsOneWidget);
      expect(find.text('Investment Amount'), findsOneWidget);
      expect(find.text('Risk Warning'), findsOneWidget);

      // Test amount input
      await tester.enterText(
        find.byType(TextFormField),
        '100.0'
      );
      await tester.pumpAndSettle();

      // Test risk acceptance
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();
    });
  });

  group('Security Tests', () {
    test('Private Key Storage', () async {
      final wallet = await walletService.createWallet(name: 'Security Test');
      final seedPhrase = await walletService.getSeedPhrase(wallet.id);
      expect(seedPhrase, hasLength(24));
    });

    test('Transaction Validation', () async {
      final wallet = await walletService.createWallet(name: 'Validation Test');
      
      // Test invalid amount
      expect(
        () => walletService.sendTransaction(
          toAddress: 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
          amount: -1.0,
        ),
        throwsException,
      );

      // Test invalid address
      expect(
        () => walletService.sendTransaction(
          toAddress: 'invalid_address',
          amount: 1.0,
        ),
        throwsException,
      );
    });
  });

  group('Bridge Tests', () {
    test('Bridge Configuration', () {
      expect(TonConfig.bridgeNamespace, equals('ton'));
      expect(TonConfig.bridgeUserId, isNotEmpty);
    });
  });

  group('Error Handling Tests', () {
    test('Invalid Wallet Creation', () {
      expect(
        () => walletService.createWallet(name: ''),
        throwsException,
      );
    });

    test('Invalid Investment Amount', () {
      expect(
        () => TonConfig.isValidInvestmentAmount(-1.0),
        equals(false),
      );
    });

    test('Service Restart', () async {
      await serviceManager.restart();
      final health = await serviceManager.performHealthCheck();
      expect(health['overall'], isTrue);
    });
  });
}
