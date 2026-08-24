import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _keyUsername = 'ls_username';

  Future<void> saveData(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
  }

  Future<String> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername) ?? '';
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
  }
}
