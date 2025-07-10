# REChain AppImage

REChain is provided as AppImage too. To Download, visit online.rechain.network

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
cp ../assets/logo.svg REChain.AppDir/REChain.svg
cp AppRun REChain.AppDir

# build the AppImage
appimagetool REChain.AppDir
```

# REChain AppImage

REChain также распространяется в формате AppImage для Linux.

## 📥 Скачать

Готовые сборки доступны на сайте: [online.rechain.network](https://online.rechain.network)

## ⚙️ Сборка AppImage

### 1. Установите необходимые инструменты:
- [Flutter](https://docs.flutter.dev/get-started/install)
- [appimagetool](https://github.com/AppImage/AppImageKit/releases)

### 2. Соберите приложение:
```bash
flutter build linux
```

### 3. Подготовьте структуру AppImage:
```bash
# Скопируйте собранные файлы в директорию AppImage
cp -r build/linux/{x64,arm64}/release/bundle appimage/REChain.AppDir

# Перейдите в директорию appimage
cd appimage

# Скопируйте файл desktop
cp REChain.desktop REChain.AppDir/

# Добавьте иконку приложения
mkdir -p REChain.AppDir/usr/share/icons
cp ../assets/logo.svg REChain.AppDir/REChain.svg

# Скопируйте AppRun (скрипт запуска AppImage)
cp AppRun REChain.AppDir/
```

### 4. Соберите AppImage:
```bash
appimagetool REChain.AppDir
```

После этого будет создан файл AppImage для вашего приложения.

---

### 📝 Структура AppImage:
```
appimage/
🌟 AppRun                # Скрипт запуска
🌟 REChain.desktop       # Desktop-файл для интеграции
🌟 REChain.AppDir/
    🌟 usr/
        🌟 share/
            🌟 icons/
                🌟 REChain.svg
    🌟 другие файлы сборки Flutter
```

---

### ℹ️ Замечания:
- **AppRun** должен быть исполняемым (`chmod +x AppRun`).
- Убедитесь, что `REChain.desktop` корректно указывает на иконку и бинарный файл приложения.
- Иконку лучше использовать в формате SVG или PNG.
