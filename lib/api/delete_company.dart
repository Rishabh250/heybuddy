import 'package:dio/dio.dart';

class DeleteCompany {
  static Future delete(var id, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'id': id,
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/user/deleteCompany',
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
        print('del companyyy=..... : ${response.data}');

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
