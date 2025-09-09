# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

# Keep SQLCipher classes
-keep class net.sqlcipher.** { *; }

# Keep Flutter classes
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Firebase classes
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Keep Google Play Core classes (required for Flutter deferred components)
-keep class com.google.android.play.core.** { *; }
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }
-keep class com.google.android.play.core.common.** { *; }
-keep class com.google.android.play.core.feature.** { *; }
-keep class com.google.android.play.core.assetpacks.** { *; }

# Keep Flutter Play Store Split Application and related classes
-keep class io.flutter.embedding.android.FlutterPlayStoreSplitApplication { *; }
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-keep class * extends android.app.Application { *; }
-keep class * extends android.app.Activity { *; }
-keep class * extends android.app.Service { *; }
-keep class * extends android.content.BroadcastReceiver { *; }

# Prevent obfuscation of Play Core interfaces and exceptions
-keepclassmembers class com.google.android.play.core.** {
    public *;
}

# Keep Play Core listeners and callbacks
-keep interface com.google.android.play.core.** { *; }
-keep class * implements com.google.android.play.core.** { *; }
-keep class * extends com.google.android.play.core.tasks.Task { *; }
-keep class * extends com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener { *; }

# Keep Huawei AGConnect classes
-keep class com.huawei.agconnect.** { *; }

# Keep REChain specific classes
-keep class com.rechain.** { *; }

# Optimization settings
-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*
-optimizationpasses 5
-allowaccessmodification
-dontpreverify
-dontwarn com.google.android.play.core.**
-dontwarn com.google.android.play.**
-dontwarn com.google.android.gms.**

# Remove logging in release builds
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int i(...);
    public static int w(...);
    public static int d(...);
    public static int e(...);
}