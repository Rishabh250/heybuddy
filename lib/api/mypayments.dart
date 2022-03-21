import 'dart:convert';
import 'package:http/http.dart' as http;

mypayment(var token, currentYear) async {
  var res = await http.post(
      Uri.parse(
          'https://heybuddybackend.herokuapp.com/api/booking/myEarnings2'),
      headers: {"x-access-token": "$token"},
      body: {"year": "$currentYear"});
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
    print("RRRREEEE$share1");
    // print("RRRREEEE$token");

    return share1;
  } else if (res.statusCode == 400) {
    print("rescode${res.statusCode}");
    print("RRRREEEE${res.body}");
    print("sssssssssssssss");
    return 'ss';
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
