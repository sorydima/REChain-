// REChain Integration Test Users - Version 4.1.10+1160
// Test user definitions for REChain $kAppVersion integration testing

import 'version.dart';

// Test homeserver URL - configurable via environment variable
const String kHomeserverUrl = 'http://${String.fromEnvironment(
  'HOMESERVER',
  defaultValue: 'localhost',
)}';

// Version info for test reporting
const String kTestVersionInfo = 'REChain $kAppVersion (Build $kBuildNumber)';

abstract class Users {
  const Users._();

  static const user1 = User(
    String.fromEnvironment(
      'USER1_NAME',
      defaultValue: 'alice',
    ),
    String.fromEnvironment(
      'USER1_PW',
      defaultValue: 'AliceInWonderland',
    ),
  );
  static const user2 = User(
    String.fromEnvironment(
      'USER2_NAME',
      defaultValue: 'bob',
    ),
    String.fromEnvironment(
      'USER2_PW',
      defaultValue: 'JoWirSchaffenDas',
    ),
  );
}

class User {
  final String name;
  final String password;

  const User(this.name, this.password);
}

// Default homeserver URL using version-aware constant
const homeserver = kHomeserverUrl;
