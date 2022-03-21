import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

payOut(tkn) async {
  var headers = {"x-access-token": "$tkn"};

  try {
    var response = await https.get(
        Uri.parse('https://heybuddybackend.herokuapp.com/api/user/payoutRatio'),
        headers: headers);
    var result = json.decode(response.body);
    Payout payout = Payout.fromJson(result);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Rate SEND" + "${response.body}");
      return payout;
    } else {
      print("Rate SEND" + "${response.body}");
    }
  } catch (e) {
    print("Rate SEND" + e.toString());
  }
}

class Payout {
  Payout({
    required this.commission,
  });

  final int commission;

  factory Payout.fromJson(Map<String, dynamic> json) => Payout(
        commission: json["commission"],
      );

  Map<String, dynamic> toJson() => {
        "commission": commission,
      };
}
