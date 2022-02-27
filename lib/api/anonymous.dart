import 'package:dio/dio.dart';

class Anonynmous {
  static Future choice(var ano, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
     'anonymous':ano,
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/user/profile/updateAnonymous',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {"x-access-token": tokeen},
        ),
      );

      // print('${response.toString()}');

      if (response.statusCode == 200) {
        print('Anonymous..... : ${response.data}');

        return response.data;
      } else if (response.statusCode == 400) {
        print('Error code : ${response.statusCode}');
        print('Error code : ${response.toString()}');
        return response.data;
      } else {
        return response;
      }
    } catch (err) {
      print("betee");
      print(err);
    }
  }
}
