import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/widgets/token_profile.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Skills {
  static Future userSkills(var skill) async {
    print('Skills');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'skillname': skill,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/getUserBySkills',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    // print(role);
    // print(password);

    print('${response.toString()}');

    if (response.statusCode == 200) {
      print("fffff");
      print('userCheckData : ${response.data}');
      print("ggggg");
      // print('..${response.data['status']}');
      return response.data;
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      print("notWroking");
    } else {
      return null;
    }
  }
}



// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:heybuddy/Screens/dummy1.dart';
// import 'package:heybuddy/api/signin_api.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// // var tokens = tokenProfile?.token;

// getSkillsData() async {
//   http.Response res = await http.get(
//     Uri.parse('https://heybuddybackend.herokuapp.com/api/getUserBySkills'),
//     //headers: {"x-access-token":tokeen},
//   );
//   var share1 = json.decode(res.body);
 
//   if (res.statusCode == 200) {
//     print("getdata.............");
//     print('share$share1');
//     print(res);
//     return share1;
//   } else {
//     return 'pp';
//   }
//   //return {"statusCode": res.statusCode, "response": share1};
// }

