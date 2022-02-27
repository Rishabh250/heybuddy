import 'package:shared_preferences/shared_preferences.dart';

DarkMode? darkk;

class DarkMode {
  static const _dark_mode = 'Dark';

  setLogin(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_dark_mode, status);
    print("is printing or not");
  }

  Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_dark_mode) ?? false;
    } catch (e) {
      print('Error in login preference : $e');
      return false;
    }
  }

  cleartTokenPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.remove(_dark_mode);
    } catch (e) {
      print('inside userPref clear error: $e');
    }
  }
}
