# Harmony OS Flavor Resources

This directory contains platform-specific resources and source code for the Harmony OS build flavor.

Please add Harmony OS specific launcher icons and other resources in the appropriate `res/mipmap-*` directories.

This flavor is configured in `android/app/build.gradle` with the `harmonyos` product flavor.

To build the app for Harmony OS, use the following Gradle command:

```
./gradlew assembleHarmonyosRelease
```

or from Flutter:

```
flutter build apk --flavor harmonyos
