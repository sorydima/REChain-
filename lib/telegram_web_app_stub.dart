class TelegramWebApp {
  static TelegramWebApp get instance => TelegramWebApp();

  String? get backgroundColor => null;
  String? get version => null;
  String? get platform => null;
  _ColorScheme? get colorScheme => null;
  bool get isActive => false;
  bool get isExpanded => false;
  double get viewportHeight => 0.0;
  double get viewportStableHeight => 0.0;
  dynamic get safeAreaInset => null;
  dynamic get contentSafeAreaInset => null;
  dynamic get initData => null;
  dynamic get initDataUnsafe => null;
  bool get isVerticalSwipesEnabled => false;
  dynamic get themeParams => null;
  dynamic get headerColor => null;
  dynamic get bottomBarColor => null;

  void expand() {}
  void enableVerticalSwipes() {}
  void disableVerticalSwipes() {}
}

class _ColorScheme {
  final String name = '';
}

class TelegramThemeUtil {
  static dynamic getTheme(TelegramWebApp app) {
    return null;
  }
}
