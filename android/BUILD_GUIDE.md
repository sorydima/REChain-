# REChain Android Build Configuration
# Version: 4.1.10+1160

## Build Variants
### Standard Flavors
- `debug` - Development build with debugging enabled
- `profile` - Performance profiling build
- `release` - Production release build

### Product Flavors (if needed)
- `standard` - Standard configuration
- `fdroid` - F-Droid compatible build (without Google Play services)

## Build Types
1. **debug**
   - Debugging enabled
   - Minification disabled
   - Logcat enabled
   - Slow JIT enabled

2. **profile**
   - Debugging disabled
   - Minification enabled
   - Performance profiling enabled
   - Optimized for performance

3. **release**
   - Debugging disabled
   - Full minification (R8/ProGuard)
   - Resource shrinking enabled
   - Signing required
   - App Bundle generation

## Version Management
- **versionCode**: Incremented for each release
- **versionName**: Semantic versioning (e.g., 4.1.10+1160)
- **versionName displayed**: User-facing version (e.g., 4.1.10)

## SDK Configuration
- **compileSdk**: 35 (latest stable)
- **targetSdk**: 35
- **minSdk**: 24 (Android 7.0+)

## Build Commands

### Standard Build
```bash
./gradlew assembleDebug        # Debug APK
./gradlew assembleRelease      # Release APK
./gradlew bundleRelease        # App Bundle for Play Store
```

### F-Droid Build
```bash
./gradlew assembleFdroidRelease
```

### Performance Profiling
```bash
./gradlew assembleProfile
flutter run --profile
```

### Testing
```bash
./gradlew test                 # Unit tests
./gradlew connectedAndroidTest # Integration tests
./gradlew lint                 # Run lint checks
```

## Signing Configuration

### Debug Keystore
- Default Android debug keystore is used automatically
- Location: `~/.android/debug.keystore`

### Release Keystore
1. Create `android/key.properties`:
   ```properties
   storePassword=your_store_password
   keyPassword=your_key_password
   keyAlias=your_key_alias
   storeFile=/path/to/your/keystore.jks
   ```

2. Keep `key.properties` out of version control
3. Add to `.gitignore`:
   ```
   key.properties
   *.jks
   *.keystore
   ```

## Performance Optimization

### Build Speed
- Enable Gradle daemon: `org.gradle.daemon=true`
- Use Gradle wrapper with JDK 17+
- Enable parallel builds: `org.gradle.parallel=true`

### APK Size
- Enable R8 minification
- Enable resource shrinking
- Use App Bundle for Play Store
- Remove unused resources

## Dependencies Management

### Version Catalog
All dependencies are managed through:
- `pubspec.yaml` (Flutter)
- `build.gradle.kts` (Android)

### Dependency Updates
```bash
./gradlew dependencyUpdates
```

## CI/CD Integration

### GitHub Actions
See `.github/workflows/android.yml`

### CodeMagic
Configured in `codemagic.yaml`

### Fastlane
- `fastlane/Fastfile` - Lane definitions
- `fastlane/Appfile` - App configuration
- `fastlane/metadata/` - Store metadata

## Testing Strategy

### Unit Tests
- Location: `app/src/test/`
- Framework: JUnit 4 + Mockito

### Integration Tests
- Location: `app/src/androidTest/`
- Framework: Espresso + Flutter integration tests

### Performance Tests
- Frame timing benchmarks
- Memory usage profiling
- Startup time measurement

## Security Best Practices

1. **Obfuscation**
   - R8/ProGuard enabled for release builds
   - Stack trace deobfuscation mapping files

2. **Certificate Pinning**
   - Configured in network layer
   - Certificate transparency logging

3. **Root Detection**
   - Anti-tampering measures
   - Runtime integrity checks

4. **Data Encryption**
   - Encrypted SharedPreferences
   - SQLCipher for database
   - Secure key storage (Android Keystore)

## Compliance

### Google Play Policies
- Data safety declaration completed
- Privacy policy URL configured
- AdMob/Play Services policies followed

### F-Droid Requirements
- No proprietary dependencies
- Reproducible builds
- Clean source code

## Troubleshooting

### Build Errors
```bash
# Clean build
./gradlew clean

# Clear Gradle cache
rm -rf ~/.gradle/caches/

# Flutter clean
flutter clean

# Rebuild
flutter pub get
./gradlew build
```

### Performance Issues
- Increase Gradle JVM memory
- Use SSD for build directory
- Disable unnecessary plugins
- Use incremental builds

## Documentation
- Android Developer Guides: https://developer.android.com/
- Flutter Android Platform: https://docs.flutter.dev/deployment/android
- Gradle Documentation: https://docs.gradle.org/

## Support
- Issues: https://github.com/sorydima/REChain-/issues
- Matrix Community: #chatting:matrix.katya.wtf
- Email: support@rechain.network

