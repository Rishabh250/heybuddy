import 'package:dio/dio.dart';

class VerifyForgotPassword {
  static Future verify(var email,var otp, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'email': email,
      'otp':otp,
     
 
       
    });
    var response;
    try{
    response = await dio.post(
     'https://heybuddybackend.herokuapp.com/api/user/verifyForgotPassword',
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
      print('Verifyyy: ${response.data}');
  print('Verifyyyy: ${response.data['status']}');
      return response.data['status'];
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