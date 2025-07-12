# Building Flutter App for Aurora OS

## Prerequisites
- Flutter SDK installed and configured.
- Aurora OS SDK and toolchain installed.
- Access to Aurora OS device or emulator for testing.

## Build Steps

1. Configure Flutter for Linux target (Aurora OS is Linux-based):
   ```bash
   flutter config --enable-linux-desktop
   ```

2. Build the Flutter app for Linux:
   ```bash
   flutter build linux
   ```

3. Package the app for Aurora OS:
   - Use Aurora OS packaging tools to create an installable package.
   - Refer to Aurora OS documentation for packaging guidelines.

4. Deploy and test on Aurora OS device or emulator.

## Notes
- Ensure platform-specific code (input handling, plugins) is properly integrated.
- Use conditional imports to separate Aurora OS and other platform code.
- Test thoroughly on Aurora OS to verify input and plugin functionality.

## References
- Aurora OS Flutter GitLab: https://gitlab.com/omprussia/flutter
- Aurora OS Packaging Documentation: [Add link if available]
