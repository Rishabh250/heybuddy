import 'dart:convert';
import 'package:http/http.dart' as https;

sendRate(id, rate) async {
  print("Rate SEND" + "$id");
  try {
    var response = await https.post(
        Uri.parse(
            'https://heybuddybackend.herokuapp.com/api/booking/addRating'),
        body: {"id": id, "rating": rate.toString()});

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Rate SEND" + "${response.body}");
    } else {
      print("Rate SEND" + "${response.body}");
    }
  } catch (e) {
    print("Rate SEND" + e.toString());
  }
}
