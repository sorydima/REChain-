class TelegramWebApp {
  static TelegramWebApp get instance => TelegramWebApp();

  String? get backgroundColor => null;
  String? get version => null;
  String? get platform => null;
  String? get colorScheme => null;
  bool get isActive => false;
  bool get isExpanded => false;
  double get viewportHeight => 0.0;
  double get viewportStableHeight => 0.0;
  dynamic get safeAreaInset => null;
  dynamic get contentSafeAreaInset => null;
  dynamic get initData => null;
  dynamic get initDataUnsafe => null;
  bool get isVerticalSwipesEnabled => false;

  void expand() {}
  void enableVerticalSwipes() {}
  void disableVerticalSwipes() {}
}
