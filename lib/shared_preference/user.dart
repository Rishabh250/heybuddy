// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// var userData = {};
// // String key = 'user';

// getShared() async {
//   print("getshare");
//   return await SharedPreferences.getInstance();
// }

// setModelData(data) async {
//   print("predata...............0");
//   print('ghg ${userData}');
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   final SharedPreferences prefs = await _prefs;
//   // data['user_type'] = 'model';
//   print("User data to save to local");
//   prefs.setString(userData['token'], json.encode(data));
//   print(data);
//   await getUserDataFromShared();
// }

// // setCompanyData(data) async {
// //   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
// //   final SharedPreferences prefs = await _prefs;
// //   data['user_type'] = 'company';
// //   print("User data to save to local");
// //   prefs.setString(key, json.encode(data));
// //   print(data);
// //   await getUserDataFromShared();
// // }

// getUserDataFromShared() async {
//   final prefs = await getShared();
//   var a = prefs.getString(userData);
//   if (a != null) {
//     print(a);
//     print('a');
//     userData = json.decode(a);
//     print('userData');
//     print(userData);
//   } else {
//     print(userData);
//     print("mila nahi");
//   }
//   print("data");
//   print(a);
//   print(userData);
//   return a;
// }

// // logout() async {
// //   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
// //   final SharedPreferences prefs = await _prefs;
// //   prefs.remove(key);
// //   userData = {};
// //   ioDisconnect();
// //   print("check");
// //   print(prefs.getString(key));
// //   print(userData);
// // }

// isUserData() {
//   if (userData.containsKey('token')) {
//     return true;
//   } else {
//     return false;
//   }
// }
