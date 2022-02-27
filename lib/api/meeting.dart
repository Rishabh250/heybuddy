import 'package:dio/dio.dart';

class Meeting {
  static Future meeting(var orderId) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'orderId': orderId,
     // 'approved': approve,
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/createMeeting',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          // headers: {"x-access-token": tokeen},
        ),
      );

      // print('${response.toString()}');

      if (response.statusCode == 200) {
        print('Choice..... : ${response.data}');

        return response.data;
      } else if (response.statusCode == 400) {
        print('Error code : ${response.statusCode}');
        return response;
      } else {
        return response;
      }
    } catch (err) {
      print("betee");
      print(err);
    }
  }
}
