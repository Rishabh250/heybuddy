import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/user.dart';
import 'package:heybuddy/shared_preference/userdata.dart';
import 'package:heybuddy/widgets/token_profile.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final datam = GetStorage();

class EmailVerification {
  static Future verification(var email) async {
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'email': email,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/user/emailVerification',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    print('${response.toString()}');

    if (response.statusCode == 200) {
      print('Email Verification.....: ${response.data}');
      // print('..psdf${response.data['token']}');
      // datam.write('f', response.data['token']);
      // print('forgotpassword  ${response.data['token']}');
      return response.data;
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      return response.data['error'];
    } else {
      return null;
    }
  }
}

class VerifyEmailVerification {
  static Future verification(var email, var otp, var tokeen) async {
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'email': email,
      'otp': otp,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/user/verifyEmailVerification',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {"x-access-token": tokeen},
      ),
    );

    print('${response.toString()}');

    if (response.statusCode == 200) {
      print('Verify Email Verification.....: ${response.data}');
      // print('..psdf${response.data['token']}');
      // datam.write('f', response.data['token']);
      // print('forgotpassword  ${response.data['token']}');
      return response.data['status'];
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      return response.data['error'];
    } else {
      return null;
    }
  }
}
