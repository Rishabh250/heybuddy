import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  final storage = FlutterSecureStorage();

  // static const _keyUsername = 'username';

  Future setToken(String key, String username) async {
    var writeData = await storage.write(key: key, value: username);
  }

  Future getToken(String key) async {
    var readData = await storage.read(key: key);
  }
}
