# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.kts.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

# REChain ProGuard Rules
# Version: 4.1.10+1160

## Flutter Rules
# Keep Flutter classes
-keep class io.flutter.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }

# Flutter Engine
-dontwarn io.flutter.embedding.engine.**
-keep class io.flutter.embedding.engine.** { *; }

# Keep generated Flutter files
-keep class GeneratedPluginRegistrant { *; }

## Matrix Protocol Libraries
# Matrix SDK
-keep class org.matrix.** { *; }
-dontwarn org.matrix.**

# Vodozemac (E2EE)
-keep class com.github.matrix出来后.** { *; }
-dontwarn com.github.matrix出来后.**

# OLM
-keep class org.fOlm.** { *; }
-dontwarn org.fOlm.**

## Cryptography
# Keep crypto classes
-keep class javax.crypto.** { *; }
-keep class java.security.** { *; }
-keep class javax.net.ssl.** { *; }

# SQLCipher
-keep class net.sqlcipher.** { *; }
-keep class net.sqlcipher.database.** { *; }
-dontwarn net.sqlcipher.**

## AI Services
# Keep AI model classes
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**

# Keep TensorFlow Lite
-keep class org.tensorflow.** { *; }
-dontwarn org.tensorflow.**

## Blockchain Libraries
# TON SDK
-keep class org.ton.** { *; }
-dontwarn org.ton.**

# Ethereum/Web3
-keep class org.web3j.** { *; }
-dontwarn org.web3j.**

# Keep crypto wallet classes
-keep class com.soralibs.** { *; }
-dontwarn com.soralibs.**

## IPFS Libraries
# Keep IPFS classes
-keep class io.ipfs.** { *; }
-dontwarn io.ipfs.**

## UI Libraries
# Keep Material Design components
-keep class com.google.android.material.** { *; }

# Keep AndroidX classes
-keep class androidx.** { *; }
-keep interface androidx.** { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Keep Google Play Services
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

## Kotlin Rules
# Keep Kotlin metadata
-keepattributes RuntimeVisibleAnnotations

# Keep Coroutines
-keepclassmembers class kotlinx.coroutines.** {
    volatile <fields>;
}

# Keep reflection for Kotlin
-keep class kotlin.Metadata { *; }
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}

## General Android Rules
# Keep Parcelable implementations
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep R classes
-keepclassmembers class **.R$* {
    public static <fields>;
}

# Keep View classes
-keep class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

## Security Rules
# Keep anti-tampering classes
-keep class com.rechain.online.security.** { *; }

# Keep certificate pinning classes
-keep class com.rechain.online.network.** { *; }

## Performance Rules
# Remove logging in release builds
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# Remove Timber in release
-assumenosideeffects class timber.log.Timber {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

## Bug Reporting
# Keep crashlytics symbols
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception

