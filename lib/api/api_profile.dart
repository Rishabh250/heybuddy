import 'dart:convert';
import 'package:http/http.dart' as http;

// var tokens = tokenProfile?.token;

getdata(var tokeen) async {
  http.Response res = await http.get(
    Uri.parse('https://heybuddybackend.herokuapp.com/api/user/profile'),
    headers: {"x-access-token": tokeen},
  );
  var share1 = json.decode(res.body);

  if (res.statusCode == 200) {
    print("getdata.............");
    print('share$share1');
    print(res);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
