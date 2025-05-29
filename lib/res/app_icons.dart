part of 'app_res.dart';

class AppIcons {
  AppIcons._();

  static final String icHistory = 'history.svg'.asAsset;
  static final String icBack = 'back.svg'.asAsset;
  static final String icClose = 'close.svg'.asAsset;
  static final String icEdit = 'edit.svg'.asAsset;
  static final String icMinus = 'minus.svg'.asAsset;
  static final String icPause = 'Pause.svg'.asAsset;
  static final String icPlay = 'Play.svg'.asAsset;
  static final String icPlus = 'plus.svg'.asAsset;
  static final String icSettings = 'settings.svg'.asAsset;
}

extension on String {
  String get asAsset => 'assets/icons/$this';
}
