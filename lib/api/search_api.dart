import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:heybuddy/Screens/dummy1.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';



getSearchUsers(var page, var name) async {
  http.Response res = await http.get(
    Uri.parse(
        'http://heybuddybackend.herokuapp.com/api/search_bar?page=$page&msg=$name'),
  );
  var share1 = json.decode(res.body)['data'];
  if (res.statusCode == 200) {
    print("getdata.............");
    print('sharesssss$share1');
    print(res);
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


getSearchUserss(var page, var name) async {
  http.Response res = await http.get(
    Uri.parse(
        'http://heybuddybackend.herokuapp.com/api/search_bar?page=$page&msg=$name'),
  );
  var share1 = json.decode(res.body)['data'];
  if (res.statusCode == 200) {
    print("getdata.............");
    print('sharesssss$share1');
    print(res);
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
