import 'dart:convert';

import 'package:heybuddy/api/verify_object.dart';
import 'package:http/http.dart' as https;

sendNoti(fcm, body, topic) async {
  try {
    var response =
        await https.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: {
              "Content-Type": "application/json",
              "Authorization":
                  "key=AAAA7Nr4a8g:APA91bE2cy8X_SCILPeh-TRsUeNkDJEhwgQvExwGwOYPn9kMlQMm83G-O_WWSEbCSzBZCD5vZ7Xt3tEzlU90MPtcflxNi8yxsCUKjJX4NDhYZqrKPgY49xOATIkv4a5sQGo99bsg3x4U"
            },
            body: jsonEncode({
              "to": "$fcm",
              "notification": {
                "body": "$body",
                "title": "$topic",
                "android_channel_id": "pushnotificationapp",
                "sound": false
              }
            }));

    print("RRRRRRRRRRRRRRRRRR" "${response.statusCode}");
    print("RRRRRRRRRRRRRRRRRR" "${response.body}");

    if (response.statusCode == 200) {
    } else if (response.statusCode == 400) {
      print('RRRRRRRRRRRRRRRRRR : ${response.statusCode}');
    } else {
      return null;
    }
  } catch (e) {
    print("RRRRRRRRRRRRRRRRRR" + e.toString());
  }
}
