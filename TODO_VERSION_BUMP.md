# Scripts Version Upgrade TODO
# Target version: 4.1.10+1160

## Phase 1: Core Scripts - COMPLETED
- [x] Update scripts/deploy_aurora.sh - Replace all hardcoded 4.1.10 with 4.1.10+1160
- [x] Update scripts/test_aurora.sh - Update test configuration version

## Phase 2: Supporting Scripts - COMPLETED  
- [x] Check and update build scripts with version references (build_linux.sh uses dynamic versioning from pubspec.yaml)
- [x] Update packaging scripts (package_linux.sh uses dynamic versioning from pubspec.yaml)

## Phase 3: Verification
- [x] Verify pubspec.yaml version is 4.1.10+1160
- [x] Check for any remaining hardcoded version references
- [ ] Test that scripts run correctly with new version

## Changes Applied to deploy_aurora.sh:
1. DEPLOY_VERSION: 4.1.10 → 4.1.10+1160
2. RPM Release: 1 → 1160  
3. Changelog version: 4.1.10-1 → 4.1.10-1160
4. Source tarball: rechain-4.1.10.tar.gz → rechain-4.1.10+1160.tar.gz
5. DEB package dir: rechain_4.1.10-1 → rechain_4.1.10+1160
6. DEB version: 4.1.10-1 → 4.1.10+1160
7. Aurora Store metadata: 4.1.10 → 4.1.10+1160

## Changes Applied to test_aurora.sh:
1. Test version: 4.1.10-test → 4.1.10+1160-test

## Status: Completed
Last updated: $(date)

