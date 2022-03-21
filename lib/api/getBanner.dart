import 'dart:convert';

import 'package:heybuddy/api/banner_object.dart';
import 'package:http/http.dart' as http;

// var tokens = tokenProfile?.token;

getBanner() async {
  http.Response res = await http.get(
    Uri.parse('https://heybuddybackend.herokuapp.com/api/admin/getBanner'),
  );
  var share1 = json.decode(res.body);

  Banner banner = Banner.fromJson(share1);

  if (res.statusCode == 200) {
    print("getdata.............");
    print('Banner' + share1['banner']['imgUrl'].toString());
    print(res);
    return banner;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
