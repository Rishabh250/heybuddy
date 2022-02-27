import 'package:dio/dio.dart';

class Upi {
  static Future choice(var upiId, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'upiid': upiId,
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/user/profile/updateUpiId',
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
        print('Idddddddd..... : ${response.data}');

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
