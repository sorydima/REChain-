# REChain AppImage

REChain is provided as AppImage too. To Download, visit rechain.online 

## Building

- Ensure you install `appimagetool`

```shell
flutter build linux

# copy binaries to appimage dir
cp -r build/linux/{x64,arm64}/release/bundle appimage/REChain.AppDir
cd appimage

# prepare AppImage files
cp REChain.desktop REChain.AppDir/
mkdir -p REChain.AppDir/usr/share/icons
cp ../assets/logo.svg REChain.AppDir/rechain.svg
cp AppRun REChain.AppDir

# build the AppImage
appimagetool REChain.AppDir
```
