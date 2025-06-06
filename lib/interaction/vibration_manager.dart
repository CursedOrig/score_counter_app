import 'package:shared_preferences/shared_preferences.dart';

class VibrationManager {
  static const String vibrationKey = 'isVibrationEnabled';

  Future<bool> loadVibrationSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(vibrationKey) ?? false;
  }

  Future<void> saveVibration(bool value) async {
     final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(vibrationKey, value);
  }
}
