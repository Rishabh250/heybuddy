import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

final datam = GetStorage();

class SignInByPhone {
  static Future phone(var phone,var tkn) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'phone': phone,
      'fcmtoken':tkn
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/signinbyphone',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          // headers: {"x-access-token": tokeen},
        ),
      );

      print('${response.toString()}');

      if (response.statusCode == 200) {
        print('User Exist or Not: ${response.data}');
        datam.write('f', response.data['token']);
        return response.data['status'];
      } else if (response.statusCode == 400) {
        print('Error code : ${response.statusCode}');
      } else {
        return null;
      }
    } catch (err) {
      print("betee");
      print(err);
    }
  }
}
