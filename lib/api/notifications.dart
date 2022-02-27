import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:heybuddy/Screens/dummy1.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

getNotifications(var tokeen) async {
  http.Response res = await http.get(
    Uri.parse('https://heybuddybackend.herokuapp.com/api/getNotifications'),
    headers: {"x-access-token": tokeen},
  );
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
    print("notif.............");
    print('notification$share1');
    print(res);
    return share1;
  } else if (res.statusCode == 400) {
    print("notif${res.statusCode}");
    print("notif${res.body}");
    print("sssssssssssssss");
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
