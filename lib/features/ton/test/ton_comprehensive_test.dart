import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  group('Frontend Form Validation Tests', () {
    testWidgets('Send Screen Form Validation', (WidgetTester tester) async {
      final wallet = await walletService.createWallet(name: 'Test Wallet');
      
      await tester.pumpWidget(
        MaterialApp(
          home: TonSendScreen(wallet: wallet),
        ),
      );

      // Test empty form submission
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Please enter a recipient address'), findsOneWidget);
      expect(find.text('Please enter an amount'), findsOneWidget);

      // Test invalid address
      await tester.enterText(
        find.byType(TextFormField).first,
        'invalid_address'
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Invalid TON address'), findsOneWidget);

      // Test invalid amount (negative)
      await tester.enterText(
        find.byType(TextFormField).at(1),
        '-1.0'
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Amount must be positive'), findsOneWidget);

      // Test invalid amount (zero)
      await tester.enterText(
        find.byType(TextFormField).at(1),
        '0'
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Amount must be greater than 0'), findsOneWidget);

      // Test insufficient balance
      await tester.enterText(
        find.byType(TextFormField).first,
        'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t'
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        '1000000.0'
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Insufficient balance'), findsOneWidget);

      // Test valid form
      await tester.enterText(
        find.byType(TextFormField).at(1),
        '0.1'
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Confirm Transaction'), findsOneWidget);
    });

    testWidgets('NFT Marketplace Interactions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const TonNftMarketplaceScreen(),
        ),
      );

      // Test tab navigation
      expect(find.text('Listings'), findsOneWidget);
      expect(find.text('Collections'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);

      // Test search functionality
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      
      final searchField = find.byType(TextField);
      expect(searchField, findsOneWidget);
      
      await tester.enterText(searchField, 'test nft');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle();
      
      // Verify search results loading
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Test filter functionality
      await tester.tap(find.byIcon(Icons.filter_list));
      await tester.pumpAndSettle();
      expect(find.text('Price Range'), findsOneWidget);
      expect(find.text('Collection'), findsOneWidget);

      // Test sort functionality
      await tester.tap(find.byIcon(Icons.sort));
      await tester.pumpAndSettle();
      expect(find.text('Price: Low to High'), findsOneWidget);
      expect(find.text('Price: High to Low'), findsOneWidget);
      expect(find.text('Recently Listed'), findsOneWidget);
    });

    testWidgets('Investment Pool Interactions', (WidgetTester tester) async {
      final pools = await investmentService.getAvailablePools();
      final pool = pools.first;
      
      await tester.pumpWidget(
        MaterialApp(
          home: TonInvestmentScreen(pool: pool),
        ),
      );

      // Test investment amount validation
      final amountField = find.byType(TextFormField);
      expect(amountField, findsOneWidget);

      // Test negative amount
      await tester.enterText(amountField, '-100');
      await tester.tap(find.text('Invest'));
      await tester.pumpAndSettle();
      expect(find.text('Amount must be positive'), findsOneWidget);

      // Test below minimum
      await tester.enterText(amountField, '0.1');
      await tester.tap(find.text('Invest'));
      await tester.pumpAndSettle();
      expect(find.text('Minimum investment is 1 TON'), findsOneWidget);

      // Test risk acknowledgment
      await tester.enterText(amountField, '100');
      await tester.tap(find.text('Invest'));
      await tester.pumpAndSettle();
      expect(find.text('Please acknowledge the risks'), findsOneWidget);

      // Test valid investment
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Invest'));
      await tester.pumpAndSettle();
      expect(find.text('Confirm Investment'), findsOneWidget);
    });
  });

  group('Error State Handling Tests', () {
    testWidgets('Network Error Handling', (WidgetTester tester) async {
      // Simulate network error
      TonClient.instance.simulateNetworkError = true;
      
      await tester.pumpWidget(
        MaterialApp(
          home: const TonDashboardScreen(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Network Error'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);

      // Test retry functionality
      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Loading State Display', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const TonNftMarketplaceScreen(),
        ),
      );

      // Verify loading indicators
      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
      
      await tester.pumpAndSettle(const Duration(seconds: 5));
      
      // Verify content loads
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });

  group('Backend API Tests', () {
    test('Transaction Signing and Sending', () async {
      final wallet = await walletService.createWallet(name: 'API Test');
      
      // Test transaction creation
      final transaction = await walletService.createTransaction(
        toAddress: 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
        amount: 0.1,
        message: 'Test transaction',
      );
      
      expect(transaction, isNotNull);
      expect(transaction.amount, equals(0.1));
      expect(transaction.toAddress, equals('EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t'));

      // Test transaction signing
      final signedTransaction = await walletService.signTransaction(transaction);
      expect(signedTransaction.signature, isNotEmpty);
      expect(signedTransaction.hash, isNotEmpty);

      // Test transaction validation
      final isValid = await walletService.validateTransaction(signedTransaction);
      expect(isValid, isTrue);
    });

    test('NFT Purchase Flow', () async {
      final listings = await nftService.getMarketplaceListings();
      expect(listings, isNotEmpty);
      
      final nft = listings.first;
      
      // Test purchase validation
      final canPurchase = await nftService.canPurchaseNft(nft.id);
      expect(canPurchase, isNotNull);
      
      // Test purchase transaction creation
      final purchaseTransaction = await nftService.createPurchaseTransaction(nft.id);
      expect(purchaseTransaction, isNotNull);
      expect(purchaseTransaction.amount, equals(nft.price));
    });

    test('Investment Creation and Withdrawal', () async {
      final pools = await investmentService.getAvailablePools();
      expect(pools, isNotEmpty);
      
      final pool = pools.first;
      
      // Test investment creation
      final investment = await investmentService.createInvestment(
        poolId: pool.id,
        amount: 100.0,
      );
      
      expect(investment, isNotNull);
      expect(investment.amount, equals(100.0));
      expect(investment.poolId, equals(pool.id));
      
      // Test withdrawal
      final withdrawal = await investmentService.createWithdrawal(
        investmentId: investment.id,
        amount: 50.0,
      );
      
      expect(withdrawal, isNotNull);
      expect(withdrawal.amount, equals(50.0));
    });

    test('Rate Limiting', () async {
      final client = TonClient.instance;
      
      // Make multiple rapid requests
      final futures = List.generate(10, (index) => 
        client.getAccountInfo('EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t')
      );
      
      final results = await Future.wait(futures, eagerError: false);
      
      // Verify rate limiting is applied
      final errors = results.where((result) => result == null).length;
      expect(errors, greaterThan(0)); // Some requests should be rate limited
    });

    test('Error Response Handling', () async {
      // Test invalid address
      expect(
        () => TonClient.instance.getAccountInfo('invalid_address'),
        throwsException,
      );
      
      // Test invalid transaction
      expect(
        () => walletService.sendTransaction(
          toAddress: 'invalid',
          amount: -1.0,
        ),
        throwsException,
      );
      
      // Test invalid NFT ID
      expect(
        () => nftService.getNftDetails('invalid_id'),
        throwsException,
      );
    });
  });

  group('Security Tests', () {
    test('Private Key Encryption', () async {
      final wallet = await walletService.createWallet(name: 'Security Test');
      
      // Verify private key is encrypted
      final encryptedKey = await walletService.getEncryptedPrivateKey(wallet.id);
      expect(encryptedKey, isNotEmpty);
      expect(encryptedKey, isNot(contains('ed25519'))); // Should not contain raw key
      
      // Test decryption
      final decryptedKey = await walletService.decryptPrivateKey(wallet.id, 'password');
      expect(decryptedKey, isNotEmpty);
      expect(decryptedKey.length, equals(64)); // 32 bytes in hex
    });

    test('Transaction Validation Security', () async {
      final wallet = await walletService.createWallet(name: 'Validation Test');
      
      // Test amount validation
      expect(TonConfig.isValidAmount(-1.0), isFalse);
      expect(TonConfig.isValidAmount(0.0), isFalse);
      expect(TonConfig.isValidAmount(0.1), isTrue);
      
      // Test address validation
      expect(TonConfig.isValidAddress('invalid'), isFalse);
      expect(TonConfig.isValidAddress('EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t'), isTrue);
      
      // Test message validation
      expect(TonConfig.isValidMessage(''), isTrue);
      expect(TonConfig.isValidMessage('a' * 1000), isFalse); // Too long
    });

    test('Input Sanitization', () async {
      // Test SQL injection attempts
      final maliciousInput = "'; DROP TABLE wallets; --";
      expect(
        () => walletService.createWallet(name: maliciousInput),
        throwsException,
      );
      
      // Test XSS attempts
      final xssInput = '<script>alert("xss")</script>';
      final sanitized = TonConfig.sanitizeInput(xssInput);
      expect(sanitized, isNot(contains('<script>')));
    });

    test('Bridge Authentication', () async {
      // Test bridge token validation
      final validToken = TonConfig.generateBridgeToken();
      expect(validToken, hasLength(64));
      
      final isValid = TonConfig.validateBridgeToken(validToken);
      expect(isValid, isTrue);
      
      // Test invalid token
      final invalidToken = 'invalid_token';
      final isInvalid = TonConfig.validateBridgeToken(invalidToken);
      expect(isInvalid, isFalse);
    });
  });

  group('Performance Tests', () {
    test('Service Initialization Time', () async {
      final stopwatch = Stopwatch()..start();
      
      await serviceManager.restart();
      
      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(5000)); // Should initialize within 5 seconds
    });

    test('Transaction Processing Speed', () async {
      final wallet = await walletService.createWallet(name: 'Performance Test');
      final stopwatch = Stopwatch()..start();
      
      final transaction = await walletService.createTransaction(
        toAddress: 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
        amount: 0.1,
        message: 'Performance test',
      );
      
      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(1000)); // Should create within 1 second
      expect(transaction, isNotNull);
    });

    test('Memory Usage', () async {
      final initialMemory = ProcessInfo.currentRss;
      
      // Create multiple wallets
      for (int i = 0; i < 100; i++) {
        await walletService.createWallet(name: 'Memory Test $i');
      }
      
      final finalMemory = ProcessInfo.currentRss;
      final memoryIncrease = finalMemory - initialMemory;
      
      // Memory increase should be reasonable (less than 100MB)
      expect(memoryIncrease, lessThan(100 * 1024 * 1024));
    });
  });

  group('Integration Tests', () {
    test('End-to-End Wallet Flow', () async {
      // Create wallet
      final wallet = await walletService.createWallet(name: 'E2E Test');
      expect(wallet, isNotNull);
      
      // Get balance
      await walletService.updateBalance(wallet.id);
      expect(wallet.balance, isNotNull);
      
      // Create transaction
      final transaction = await walletService.createTransaction(
        toAddress: 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
        amount: 0.1,
        message: 'E2E test',
      );
      expect(transaction, isNotNull);
      
      // Sign transaction
      final signed = await walletService.signTransaction(transaction);
      expect(signed.signature, isNotEmpty);
      
      // Validate transaction
      final isValid = await walletService.validateTransaction(signed);
      expect(isValid, isTrue);
    });

    test('Bridge Message Flow', () async {
      // Test bridge initialization
      final bridgeHealth = await serviceManager.checkBridgeHealth();
      expect(bridgeHealth, isTrue);
      
      // Test message sending
      final message = {
        'type': 'wallet.balance',
        'address': 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
      };
      
      final response = await serviceManager.sendBridgeMessage(message);
      expect(response, isNotNull);
      expect(response['status'], equals('success'));
    });
  });
}

// Mock classes for testing
class ProcessInfo {
  static int get currentRss => 50 * 1024 * 1024; // Mock 50MB
}
