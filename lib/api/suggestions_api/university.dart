// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:heybuddy/api/suggestions_api/uniModel.dart';
import 'package:http/http.dart' as https;

class UnviversityListAPI {
  getUniList(search) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      final response = await https.post(
          Uri.parse('https://heybuddybackend.herokuapp.com/api/suggest/uni'),
          headers: headers,
          body: jsonEncode({"msg": "$search"}));

      var result = jsonDecode(response.body) as Map<String, dynamic>;
      UniversityObjectModel objects = UniversityObjectModel.fromJson(result);

      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.body);
        return objects;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
