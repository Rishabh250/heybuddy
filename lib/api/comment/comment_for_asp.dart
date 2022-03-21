import 'package:http/http.dart' as https;

sendNotes(id, comment) async {
  print("NOTES SEND" + "$id");
  try {
    var response = await https.post(
        Uri.parse(
            'https://heybuddybackend.herokuapp.com/api/booking/addComment'),
        body: {"id": id, "commentforaspirant": "$comment"});

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("NOTES SEND" + "${response.body}");
    } else {
      print("NOTES SEND" + "${response.body}");
    }
  } catch (e) {
    print("NOTES SEND" + e.toString());
  }
}
