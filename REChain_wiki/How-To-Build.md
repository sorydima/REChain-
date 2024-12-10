1. [Install flutter](https://flutter.dev)

2. Clone the repo:
```
git clone https://github.com/sorydima/REChain-.git
cd REChain-
```

3. Choose your target platform below and enable support for it.

3.1 If you want, enable Googles Firebase Cloud Messaging:

`git apply ./scripts/enable-android-google-services.patch`

4. Debug with: `flutter run`

### Android

* Install CMake from the SDK Manager

* Build with: `flutter build apk`

### iOS / iPadOS

* Have a Mac with Xcode installed, and set up for Xcode-managed app signing
* If you want automatic app installation to connected devices, make sure you have Apple Configurator installed, with the Automation Tools (`cfgutil`) enabled
* Set a few environment variables
    * REChain_NEW_TEAM: the Apple Developer team that your certificates should live under
    * REChain_NEW_GROUP: the group you want App IDs and such to live under (ie: com.example.rechainonline)
    * REChain_INSTALL_IPA: set to `1` if you want the IPA to be deployed to connected devices after building, otherwise unset
* Run `./scripts/build-ios.sh`

### Web

* Enable web support in Flutter: https://flutter.dev/docs/get-started/web

* Build with:
```bash
./scripts/prepare-web.sh # To install libolm
flutter build web --release
```

* Optionally configure by serving a `config.json` at the same path as REChain.
  An example can be found at `config.sample.json`. None of these
  values have to exist, the ones stated here are the default ones. If you e.g. only want
  to change the default homeserver, then only modify the `default_homeserver` key.

### Desktop (Linux, Windows, macOS)

* Enable Desktop support in Flutter: https://flutter.dev/desktop

#### Install custom dependencies (Linux)

```bash
sudo apt install libjsoncpp-dev libsecret-1-dev libsecret-1-0 librhash0 libwebkit2gtk-4.0-dev libolm3
```

* Build with one of these:
```bash
flutter build linux --release
flutter build windows --release
flutter build macos --release
```

For encryption support you have to install [libolm](https://gitlab.matrix.org/matrix-org/olm) on your system.
