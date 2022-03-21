import 'dart:convert';

import 'package:http/http.dart' as http;

// var tokens = tokenProfile?.token;

getProfessionalData(page) async {
  http.Response res = await http.get(
    Uri.parse(
        'https://heybuddybackend.herokuapp.com/api/getAllUsers?page=$page'),
    //headers: {"x-access-token":tokeen},
  );
  var share1 = json.decode(res.body)['data'];

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
