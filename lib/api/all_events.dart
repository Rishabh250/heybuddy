import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

// var tokens = tokenProfile?.token;

getallevents() async {
  http.Response res = await http.get(
    Uri.parse('https://heybuddybackend.herokuapp.com/api/allOpenEvents'),
    // headers: {"x-access-token": tokeen},
  );
  var share1 = json.decode(res.body);

  if (res.statusCode == 200) {
    print("getevents.............");
    print('anon$share1');
    print(res);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

class NewEventTransaction {
  static Future newevent(var aspphone, var eventid) async {
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'aspirantphone': aspphone,
      "eventID": eventid,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/newEventTransaction',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    print('${response.toString()}');

    if (response.statusCode == 200) {
      print('New Event : ${response.data}');

      return response.data;
    } else if (response.statusCode == 400) {
      print('New Event Error code : ${response.statusCode}');
    } else {
      return null;
    }
  }
}
// https://heybuddybackend.herokuapp.com/api/VerifyEventPayment

class VerifyEventPayment {
  static Future newevent(var txntkn) async {
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'txnToken': txntkn,
    });

    var response = await dio.post(
      'https://heybuddybackend.herokuapp.com/api/VerifyEventPayment',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    print('${response.toString()}');

    if (response.statusCode == 200) {
      print('New Event : ${response.data}');

      return response.data;
    } else if (response.statusCode == 400) {
      print('New Event Error code : ${response.statusCode}');
    } else {
      return null;
    }
  }
}
