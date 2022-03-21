import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:heybuddy/Screens/dummy1.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

secondTabPayment(var token, page) async {
  http.Response res = await http.get(
    Uri.parse(
        'https://heybuddybackend.herokuapp.com/api/getTransactions?page=$page'),
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
    return 'ss';
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

secondTabPaymentmadeaspirant(var token, page) async {
  print("RRRRRRRRRRRRRRRRR " + token.toString());
  print("RRRRRRRRRRRRRRRRR " + page.toString());
  http.Response res = await http.get(
    Uri.parse(
        'https://heybuddybackend.herokuapp.com/api/getTransactionsPaymentMade?page=$page'),
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
    return 'ss';
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

secondTabPaymentsprofessional(var token, page, chooseValue) async {
// https://heybuddybackend.herokuapp.com/api/getTransactionsPaymentReceived
// https://heybuddybackend.herokuapp.com/api/getTransactionsPaymentMade
  var mode;
  if (chooseValue == 'Bookings Made') {
    mode = 'getTransactionsPaymentMade';
  } else {
    mode = 'getTransactionsPaymentReceived';
  }
  print("QQQQQQQQ" + "$page");
  print("QQQQQQQQ" + "$mode");
  http.Response res = await http.get(
    Uri.parse('https://heybuddybackend.herokuapp.com/api/$mode?page=$page'),
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
    return 'ss';
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
