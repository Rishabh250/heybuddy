import 'package:dio/dio.dart';

class BecomeaProfessional {
  static Future professional(var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      // 'aspirantphone': professionalbecome,
     
 
    });
    var response;
    try{
    response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/user/profile/becomeProfessional',
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
      print('Api...... : ${response.data}');
     
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
