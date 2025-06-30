# Troubleshooting REChain

## Common Issues

### 1. Flutter/Dart SDK Not Found
- Ensure Flutter and Dart are installed and in your PATH
- Run `flutter doctor` for diagnostics

### 2. Dependency Errors
- Run `flutter pub get` to fetch dependencies
- Delete `.pub-cache` if issues persist

### 3. Build Fails (Android/iOS)
- Ensure Android/iOS SDKs are installed
- Run `flutter clean` then `flutter pub get`
- Check for missing config files (e.g., `google-services.json`)

### 4. API/Service Errors
- Check API keys and config in `lib/config/`
- Ensure network access and correct endpoints

### 5. UI/UX Bugs
- File an issue with screenshots and logs

---

For more help, see the [wiki home](Home.md) or open an issue on GitHub. 