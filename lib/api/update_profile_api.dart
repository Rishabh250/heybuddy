import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/user.dart';
import 'package:heybuddy/shared_preference/userdata.dart';
import 'package:heybuddy/widgets/token_profile.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// var token ;
// setToken() {
//   token = userData['token'];
// }
final storage = new FlutterSecureStorage();
final UserSecureStorage secure = UserSecureStorage();
var tokenProfile;

class UpdateProfile {
  static Future updateProfile(var name, var tokeen, File pic) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'name': name,
      'profilePic': await MultipartFile.fromFile(
        pic.path,
        // filename: pic.path.split("/").last,
      ),
      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('Reddd : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfilephoto {
  static Future updateProfile(var tokeen, File pic) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      // 'name': name,
      'profilePic': await MultipartFile.fromFile(
        pic.path,
        // filename: pic.path.split("/").last,
      ),
      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('Reddd : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfilename {
  static Future updateProfile(var name, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'name': name,

      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('Reddd : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfileLanguages {
  static Future updatelanguage(name, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'languages': name,

      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('language : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('language add${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfileskills {
  static Future updateProfile(name, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'skills': name,

      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('Redddsss : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('skills add${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfilebio {
  static Future updateProfile(bio, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'bio': bio,

      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('Reddd : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('skills add${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfileimgandbio {
  static Future updateProfile(bio, var tokeen, File img) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'bio': bio,
      'profilePic': await MultipartFile.fromFile(
        img.path,
      ),

      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('Reddd : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('skills add${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfileimg {
  static Future updateProfile(var tokeen, File img) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'profilePic': await MultipartFile.fromFile(
        img.path,
      ),
      // 'bio': bio,

      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'http://heybuddybackend.herokuapp.com/api/user/profile/update',
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
        print('Reddd : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('skills add${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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

class UpdateProfileuniversity {
  static Future updateProfile(university, var course, var tokeen) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'uni_name': university,
      'course_name': course,

      //  'profilePic' :MultipartFile.fromBytes(
      //    (await rootBundle.load(pic)).buffer.asUint8List(),

      //  ),
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/user/profile/addUniversity',
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
        print('Reddd : ${response.data}');
        print('..nnnnnnn${response.data['token']}');
        tokenProfile =
            TokenProfile.fromJson(json.decode('"${response.data['token']}"'));
        print('123');

        print('skills add${(response.data)}');
        // loginPreference!.setLoginStatus(false);
        return response.data['status'];
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
