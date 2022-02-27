import 'package:shared_preferences/shared_preferences.dart';

Login? login;

class Login {
  static const _LOGIN_STATUS = 'Login';

  setLogin(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STATUS, status);
    print("is printing or not");
  }

  Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_LOGIN_STATUS) ?? false;
    } catch (e) {
      print('Error in login preference : $e');
      return false;
    }
  }

  cleartTokenPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.remove(_LOGIN_STATUS);
    } catch (e) {
      print('inside userPref clear error: $e');
    }
  }
}
