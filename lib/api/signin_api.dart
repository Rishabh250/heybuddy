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

// var token ;
// setToken() {
//   token = userData['token'];
// }
final storage = new FlutterSecureStorage();
final UserSecureStorage secure = UserSecureStorage();
var tokenProfile;
final datam = GetStorage();

class SignIn {
  static Future signIn(var email, var password, var tknn) async {
    print('SignUp');
    var dio = Dio();

    print("FCMTOKEN" + "$tknn");

    FormData formData = FormData.fromMap({
      'email': email,
      'password': password,
      'fcmtoken': tknn,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/signin',
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
      print('Response data : ${response.data}');
      // print('..psdf${response.data['token']}');
      tokenProfile =
          TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
      datam.write('f', response.data['token']);
      print('dptokencheck11  ${response.data['token']}');
      //  setModelData(response.data['token']);
      // print('..${response.data['data']['name']}');
      //tokenProfile = TokenProfile.fromJson(response.data['data']);
      print('123');
      //response.data['token'];
      //secure.setToken("token", ff);
      // var pp = await secure.setToken("token", ff);
      // print("ffdpm$pp");
      // await storage.write(key: "token", value: response.data['token']);
      print(
          "abcd  ${storage.write(key: "token", value: response.data['token'])}");
      print('${(response.data)}');
      // loginPreference!.setLoginStatus(false);
      return response.data['status'];
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      return response.data['error'];
      // return response.data['message'];
      //  print('message of signup - ${json.decode(response.data)['error']}');
      // return json.decode(response.data);
    } else {
      return null;
    }
  }
}
