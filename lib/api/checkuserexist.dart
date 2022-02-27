import 'package:dio/dio.dart';

class CheckUserExist {
  static Future usercheck(var phone) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'phone': phone,
     
 
       
    });
    var response;
    try{
    response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/checkUserExist',
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
      print('User Exist or Not: ${response.data}');
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