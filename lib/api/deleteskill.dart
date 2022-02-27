import 'package:dio/dio.dart';

class DeleteSkill {
  static Future delete(var skill, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'skills': skill,
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/user/deleteSkill',
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
        print('del skillllll..... : ${response.data}');

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

class Deletelanguage {
  static Future delete(var lang, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'languages': lang,
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/user/deleteLanguage',
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
        print('del lang..... : ${response.data}');

        return response.data;
      } else if (response.statusCode == 400) {
        print('del lang Error code : ${response.statusCode}');
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
