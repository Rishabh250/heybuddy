import 'package:dio/dio.dart';

class UniqueUser {
  static Future uniqueUser(var phone) async {
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'phone': phone,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/user/profileByPhone',
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
      print('Uniqu : ${response.data}');

      return response.data;
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
    } else {
      return null;
    }
  }
}
