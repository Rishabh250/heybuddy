import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:heybuddy/Screens/dummy1.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

mypayment(var token) async {
  http.Response res = await http.get(
    // Uri.parse('https://heybuddybackend.herokuapp.com/api/getTransactions'),
    Uri.parse('https://heybuddybackend.herokuapp.com/api/myEarnings'),
    headers: {"x-access-token": token},
  );
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
    print("mypayments$share1");
    return share1;
  } else if (res.statusCode == 400) {
    print("rescode${res.statusCode}");
    print("resbody${res.body}");
    print("sssssssssssssss");
    return 'ss';
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
