import 'package:dio/dio.dart';

class PaymentRfund {
  static Future paymentrefund(var orderId, var aspphone, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'orderId': orderId,
      'aspirantphone': aspphone,
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/refund',
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
        print('Refund..... : ${response.data}');

        return response.data;
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
