import 'package:dio/dio.dart';

class ResetPassword {
  static Future verify(var email,var password) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'email': email,
      'password':password,
     
 
       
    });
    var response;
    try{
    response = await dio.post(
     'https://heybuddybackend.herokuapp.com/api/user/resetVerifyForgotPassword',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        // headers: {"x-access-token": tokeen},
      ),
    );
    
    print('${response.toString()}');

    if (response.statusCode == 200) {
      print('Updates: ${response.data}');
  print('Updated: ${response.data}');
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