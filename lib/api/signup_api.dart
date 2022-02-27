import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/widgets/token_profile.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

final datam = GetStorage();

class SignUp {
  static Future signUp(var role, var email, var name, var gender, var password,
      var phone,var tkn) async {
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'role': role,
      'email': email,
      'password': password,
      'gender': gender,
      'name': name,
      'phone': phone,
      'fcmtoken':tkn
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/signup',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    // print(role);
    // print(password);

    print('${response.toString()}');

    if (response.statusCode == 200) {
      // print('Response data : ${response.data}');
      print('..signuppppp${response.data['status']}');
      tokenProfile =
          TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
      datam.write('f', response.data['token']);
      print('${(response.data)}');
      return response.data['status'];
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      return response.data['status'];
    } else {
      return response.statusCode;
    }
  }
}
