import 'package:dio/dio.dart';

class UniqueUserCalendar {
  static Future uniqueUser(var orderId, var tokeen) async {
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'orderId': orderId,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/getTransactionByOrderId',
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
      print('Uniqu Calendar: ${response.data}');

      return response.data;
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
    } else {
      return null;
    }
  }
}
