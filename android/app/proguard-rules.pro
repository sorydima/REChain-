# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.BuildConfig { *; }
-keep class io.flutter.embedding.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.** { *; }

# SQLCipher
-keep class net.sqlcipher.** { *; }
-keep class net.sqlcipher.database.** { *; }

# AndroidX
-keep class androidx.** { *; }
-keep class com.google.android.material.** { *; }
-keep class com.google.gson.** { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Huawei
-keep class com.huawei.** { *; }
-dontwarn com.huawei.**

# WebRTC
-keep class org.webrtc.** { *; }

# Other
-dontwarn sun.misc.**
-keep class * extends java.util.List
-keep class * implements java.io.Serializable