

import 'package:dio/dio.dart';

class PaymentVerify {
  static Future paymentverify(var orderId) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'orderId': orderId,
     
 
    });
    var response;
    try{
    response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/VerifyPaymentt',
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
      print('Verify..... : ${response.data}');
     
      return response.data;
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
       } else {
      return null;
    }}catch (err) {
    print("betee");
    print(err);
  }
  }
}
