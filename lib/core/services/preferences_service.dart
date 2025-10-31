import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLastUpdated(String key, DateTime date) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, date.toIso8601String());
}

Future<DateTime?> getLastUpdated(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getString(key);
  return value != null ? DateTime.parse(value) : null;
}