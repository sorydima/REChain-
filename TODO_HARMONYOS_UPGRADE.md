# HarmonyOS Version 4.1.10+1160 Upgrade TODO List

## Files to Update:

1. [x] harmonyos/entry/src/main/ets/pages/Index.ets - Update version display
2. [x] harmonyos/entry/src/main/ets/entryability/EntryAbility.ets - Add build number
3. [x] harmonyos/entry/src/main/ets/config/REChainConfig.ets - Update version and build
4. [x] harmonyos/build-profile.json5 - Upgrade SDK versions
5. [x] harmonyos/entry/oh-package.json5 - Upgrade hvigor plugin version
6. [x] harmonyos/hvigorfile.ts - Update model version

## Changes Summary:
- App version: 4.1.10 → 4.1.10+1160
- Build number: 1160
- SDK versions: 12 → 13 (for HarmonyOS 4.1.10+ support)
- hvigor-ohos-plugin: 4.0.5 → 4.1.10
- modelVersion: 5.0.0 → 5.0.1

## Upgrade Status: ✅ COMPLETED

---

# Integration Test Version 4.1.10+1160 Upgrade

## Files Updated:
1. [x] integration_test/version.dart - Created with version constants
2. [x] integration_test/app_test.dart - Added version imports and headers
3. [x] integration_test/users.dart - Added version info and constants
4. [x] integration_test/extensions/default_flows.dart - Added version header
5. [x] integration_test/extensions/wait_for.dart - Added version header

## Integration Test Changes Summary:
- Created version.dart with kAppVersion, kBuildNumber, kAppName constants
- Added version headers to all test files
- Refactored homeserver constant to use version-aware kHomeserverUrl
- Added kTestVersionInfo for test reporting

## Integration Test Upgrade Status: ✅ COMPLETED

---

# Matrix Bridge Setup Bundle Version 4.1.10+1160 Upgrade

## Files Updated:
1. [x] matrix_bridge_setup_bundle/VERSION - Created with bundle version info
2. [x] matrix_bridge_setup_bundle/README.md - Added version info and compatibility
3. [x] matrix_bridge_setup_bundle/docker-compose.yml - Added version header
4. [x] matrix_bridge_setup_bundle/docker-compose.bridges.yaml - Added version header
5. [x] matrix_bridge_setup_bundle/install_bridges.sh - Added version header and messages
6. [x] matrix_bridge_setup_bundle/setup_certbot.sh - Added version header
7. [x] matrix_bridge_setup_bundle/matrix_ultimate_helm/Chart.yaml - Updated version to 4.1.10
8. [x] matrix_bridge_setup_bundle/matrix_ultimate_snap/snapcraft.yaml - Updated version to 4.1.10+1160

## Matrix Bridge Bundle Changes Summary:
- Created VERSION file with bundle information
- Updated README with version 4.1.10+1160, compatibility info, and bridge list
- Added version headers to docker-compose files
- Added version headers to shell installation scripts
- Updated Helm chart to version 4.1.10 with appVersion 4.1.10+1160
- Updated Snapcraft config to version 4.1.10+1160

## Matrix Bridge Bundle Upgrade Status: ✅ COMPLETED
