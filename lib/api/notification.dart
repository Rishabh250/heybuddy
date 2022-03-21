import 'dart:convert';
import 'package:http/http.dart' as http;

notification(var token) async {
  http.Response res = await http.get(
    Uri.parse('https://heybuddybackend.herokuapp.com/api/notification'),
    headers: {"x-access-token": token},
  );
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
    print("verified payments$share1");
    return share1;
  } else if (res.statusCode == 400) {
    print("rescode${res.statusCode}");
    print("resbody${res.body}");
    print("sssssssssssssss");
    return res.body;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
