import 'package:shared_preferences/shared_preferences.dart';

InnerCheck ?innerCheck;

class InnerCheck {
  static const _LOGIN_STATUS = 'Check2';
  static const _LOGIN_STATU = 'Check8';

  setLogin(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STATUS, status);
  }

   setLoginn(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STATU, status);
  }

   getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   try {
      return prefs.getBool(_LOGIN_STATUS);
    } catch (e) {
     print('Error in login preference : $e');
     return false;
    }
  }

    getLoginn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_LOGIN_STATU) ;
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
  cleartTokenPreferenceDataa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.remove(_LOGIN_STATU);
    } catch (e) {
      print('inside userPref clear error: $e');
    }
  }
}
