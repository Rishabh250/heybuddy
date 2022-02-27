import 'package:dio/dio.dart';

class PaymentUpdate {
  static Future paymentupdate(
      var aspphone, var prophone, var topic, var amt, var date,var skill) async {
    print('Sigggggggggggg');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'aspirantphone': aspphone,
      'professionalphone': prophone,
      'topic': topic,
      'amount': amt,
      'date': date,
      'skill':skill
    });
    var response;
    try {
      response = await dio.post(
        'https://heybuddybackend.herokuapp.com/api/paytmInitiatePayment',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          // headers: {"x-access-token": tokeen},
        ),
      );

      // print('${response.toString()}');

      if (response.statusCode == 200) {
        print('Api...... : ${response.data}');

        return response.data;
      } else if (response.statusCode == 400) {
        print('Error code : ${response.statusCode}');
      } else {
        return null;
      }
    } catch (err) {
      print("betee");
      print(err);
    }
  }
}
