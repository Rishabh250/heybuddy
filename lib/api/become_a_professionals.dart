import 'package:dio/dio.dart';

class BecomeaProfessionals {
  static Future professional(var skillname,var languagename,var title,var companyname,var startdate,var enddate,var uniname,var coursename,var tokeen) async {
    print('vvvvvvvvvvvvvvvvvvvvv');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'skills': skillname,
      'languages':languagename,
      'title':title,
      'company_name':companyname,
      'start_date':startdate,
      'end_date':enddate,
      'uni_name':uniname,
      'course_name':coursename,
     
 
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
      print('Become a professional...... : ${response.data}');
     
      return response.data;
    } else if (response.statusCode == 400) {
      print('Become a professional Error code : ${response.statusCode}');
       } else {
      return null;
    }}catch (err) {
    print("betee");
    print(err);
  }
  }
}
