import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FormStorage {
  static Future<void> saveFormValues(String key, Map<String, dynamic> values) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(values));
  }

  static Future<Map<String, dynamic>?> loadFormValues(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(key);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }
} 