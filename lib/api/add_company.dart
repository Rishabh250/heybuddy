import 'package:dio/dio.dart';

class UpdateCompany {
  static Future updatecompany(var title,var companyname,var startdate,var enddate, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'title': title,
      'company_name':companyname,
      'start_date':startdate,
      'end_date':enddate,
 
       
    });
    var response;
    try{
    response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/user/profile/addCompany',
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
      print('company: ${response.data}');

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