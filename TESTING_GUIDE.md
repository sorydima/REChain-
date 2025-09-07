# Testing Guide for REChain

This guide provides comprehensive information on testing strategies and tools for REChain.

## Testing Types

### Unit Testing
```dart
import 'package:test/test.dart';

void main() {
  group('Authentication', () {
    test('should authenticate valid user', () {
      final auth = AuthenticationService();
      final result = auth.login('user', 'pass');
      expect(result, isTrue);
    });

    test('should reject invalid credentials', () {
      final auth = AuthenticationService();
      final result = auth.login('user', 'wrong');
      expect(result, isFalse);
    });
  });
}
```

### Widget Testing
```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login form displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(LoginForm());

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Login button tap triggers authentication', (WidgetTester tester) async {
    await tester.pumpWidget(LoginForm());

    await tester.enterText(find.byType(TextField).first, 'user');
    await tester.enterText(find.byType(TextField).last, 'pass');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Login successful'), findsOneWidget);
  });
}
```

### Integration Testing
```dart
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Full user flow', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Navigate to login
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Enter credentials
    await tester.enterText(find.byType(TextField).first, 'user');
    await tester.enterText(find.byType(TextField).last, 'pass');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify successful login
    expect(find.text('Welcome'), findsOneWidget);
  });
}
```

## Testing Tools

### Flutter Testing Framework
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/auth_test.dart

# Run tests in watch mode
flutter test --watch
```

### Mocking
```dart
import 'package:mockito/mockito.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  test('should call auth service', () {
    final mockAuth = MockAuthService();
    final loginBloc = LoginBloc(mockAuth);

    when(mockAuth.login('user', 'pass')).thenAnswer((_) async => true);

    loginBloc.login('user', 'pass');

    verify(mockAuth.login('user', 'pass')).called(1);
  });
}
```

## Test Organization

### Directory Structure
```
test/
├── unit/
│   ├── auth_test.dart
│   └── user_test.dart
├── widget/
│   ├── login_form_test.dart
│   └── home_screen_test.dart
├── integration/
│   ├── user_flow_test.dart
└── utils/
    └── test_helpers.dart
```

### Test Naming Conventions
- `unit/auth_service_test.dart`
- `widget/login_button_test.dart`
- `integration/user_registration_test.dart`

## Best Practices

### Test Structure
```dart
void main() {
  group('Feature', () {
    setUp(() {
      // Setup code
    });

    tearDown(() {
      // Cleanup code
    });

    test('should do something', () {
      // Test code
    });
  });
}
```

### Assertions
```dart
// Basic assertions
expect(result, equals(expected));
expect(list, hasLength(3));
expect(value, isNull);
expect(error, throwsA(isA<Exception>()));

// Custom matchers
expect(user.age, greaterThan(18));
expect(email, matches(r'^[^@]+@[^@]+\.[^@]+$'));
```

### Test Data
```dart
// Test data factories
User createTestUser({
  String name = 'Test User',
  int age = 25,
}) {
  return User(name: name, age: age);
}

// Test fixtures
class TestFixtures {
  static final validUser = User(name: 'John', email: 'john@test.com');
  static final invalidUser = User(name: '', email: 'invalid');
}
```

## CI/CD Integration

### GitHub Actions
```yaml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter test --coverage
      - uses: codecov/codecov-action@v2
```

### Code Coverage
```bash
# Generate coverage report
flutter test --coverage

# View HTML report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Performance Testing

### Benchmarking
```dart
import 'package:benchmark_harness/benchmark_harness.dart';

class AuthBenchmark extends BenchmarkBase {
  AuthBenchmark() : super('Authentication');

  @override
  void run() {
    // Code to benchmark
    authService.authenticate(user, password);
  }
}
```

## Accessibility Testing

### Screen Reader Testing
```dart
testWidgets('Button is accessible', (tester) async {
  await tester.pumpWidget(Button());

  final semantics = tester.getSemantics(find.byType(ElevatedButton));
  expect(semantics.label, 'Login');
  expect(semantics.hint, isNotNull);
});
```

## Debugging Tests

### Test Debugging
```bash
# Run test with verbose output
flutter test --verbose

# Run single test
flutter test --plain-name "should authenticate user"

# Debug test
flutter test --debug
```

## Contributing

- Write tests for new features
- Maintain test coverage above 80%
- Follow testing best practices
- Review test code in PRs

---

*This testing guide is part of the REChain documentation suite.*
