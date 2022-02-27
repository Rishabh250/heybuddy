import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:heybuddy/Screens/dummy1.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// var tokens = tokenProfile?.token;

getanonymous(var tokeen) async {
  http.Response res = await http.get(
    Uri.parse(
        'https://heybuddybackend.herokuapp.com/api/user/profile/getAnonymous'),
    headers: {"x-access-token": tokeen},
  );
  var share1 = json.decode(res.body)['data'];

  if (res.statusCode == 200) {
    print("getdata.............");
    print('anon$share1');
    print(res);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
