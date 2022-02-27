import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:heybuddy/Screens/dummy1.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// var tokens = tokenProfile?.token;
var t =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYxYmRiMzE4YTE5ZDU5NWZmZWIxZDM3MCIsInJvbGUiOiJwcm9mZXNzaW9uYWwiLCJuYW1lIjoicHBwcnMiLCJwYXNzd29yZCI6IiQyYiQxMiR1T3Nvd245YTlHTFA0R2pSbHdKSS5lWlIyUkVqdHUzTHQ4bmpaQWowSGxYeXV5d0xIWnloVyIsImVtYWlsIjoiZ2JAZ21haWwuY29tIiwicGhvbmUiOiI0NTY2NTYiLCJwcm9maWxlUGljIjoiIiwiYmlvIjpudWxsLCJzdWNjZXNzZnVsX3N1Y2Nlc3MiOjAsIl9fdiI6MH0sImlhdCI6MTYzOTgyMjExNCwiZXhwIjoxNjQyNDE0MTE0fQ.Fbi2rqZsGSWL2gZkZ-Pqp8NjglhPToQBKbgvkz69mNU';
var tt =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InN1Y2Nlc3NmdWxfc3VjY2VzcyI6MCwiX2lkIjoiNjFiYjBkMmY5ZjZkZjZkYzMwMDk4ZGEzIiwicm9sZSI6ImFzcGlyYW50IiwibmFtZSI6ImRmc2ZzIiwicGFzc3dvcmQiOiIkMmIkMTIkcmFTSnZXUHd1d1A3TmtSemVGdzVzdVMyUXovUHNHamIwTkdJU1JicE9hZTlkZU9NNTlIWmkiLCJlbWFpbCI6ImFiY2RAZ21haWwuY29tIiwicGhvbmUiOiI0NjM1NDY0NDEiLCJwcm9maWxlUGljIjoiIiwiYmlvIjpudWxsLCJfX3YiOjB9LCJpYXQiOjE2Mzk4ODY1NTksImV4cCI6MTY0MjQ3ODU1OX0.B1NVYsGstzlXJZF2jaodBoTEACe2h_ukA458U74q43M';
Future getdetails(var tokeen) async {
  http.Response res = await http.get(
    Uri.parse('https://heybuddybackend.herokuapp.com/api/user/profile'),
    headers: {"x-access-token":tokeen},
  );
  var share1 = json.decode(res.body)['role'];
 
  if (res.statusCode == 200) {
    print("resdata.............");
    print('mmm$share1');
    print(res);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

