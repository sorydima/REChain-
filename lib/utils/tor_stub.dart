/// Stub class for [TorBrowserDetector]
///
/// Statically returns false as Tor **browser** can only be detected in a
/// **browser**.
abstract class TorBrowserDetector {
  static Future<bool> get isTorBrowser => Future.value(false);
}
