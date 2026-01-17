/// Integration test version constants for REChain 4.1.10+1160
/// This file contains version information used across integration tests

/// The current app version being tested
const String kAppVersion = '4.1.10+1160';

/// The build number for this version
const int kBuildNumber = 1160;

/// The app name for testing
const String kAppName = 'REChain';

/// Test environment configuration
const String kTestEnvironment = 'integration_test';

/// Default timeout for integration test operations
const Duration kDefaultTestTimeout = Duration(seconds: 30);

/// Long timeout for operations that may take longer
const Duration kLongTestTimeout = Duration(seconds: 60);
