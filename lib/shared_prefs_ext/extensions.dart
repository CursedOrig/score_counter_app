import 'package:shared_preferences/shared_preferences.dart';

extension PrefsExt on SharedPreferences {
  static const String paletteKey = 'selected_palette_index';
}
