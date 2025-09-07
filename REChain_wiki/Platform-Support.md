# Aurora OS (Sailfish/Aurora) Platform Support

REChain supports Aurora OS via the [flutter-aurora](https://github.com/auroraos/flutaurora) toolchain.

## Toolchain Setup
- Clone flutter-aurora and run the setup script:
  ```sh
  git clone https://github.com/auroraos/flutaurora.git
  cd flutaurora
  ./setup.sh
  export PATH="$PWD/bin:$PATH" # Or add to your shell profile
  ```

## Building for Aurora OS
- In your REChain project root:
  ```sh
  flutter-aurora pub get
  flutter-aurora build aurora
  ```

## Project Structure
- `aurora/` — CMake, main.cpp, icons, desktop files, RPM spec
- `REChainPWAForAuroraOS/` — PWA and QML integration (if needed)

## Troubleshooting
- Some plugins may require extra permissions or tweaks for Aurora OS
- Test on a real device or emulator
- For packaging, see `aurora/rpm/com.rechain.dapp.spec`
- If you encounter build errors, check the flutter-aurora documentation and ensure all dependencies are compatible

---

For more, see the [README](../README.md) and [Integration Setup](../docs/INTEGRATION_SETUP.md). 