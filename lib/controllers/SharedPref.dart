import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefs{
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs=await SharedPreferences.getInstance();
  }
}