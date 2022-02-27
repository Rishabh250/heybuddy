import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/mypayments.dart';
import 'package:heybuddy/api/signup_api.dart';
// import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/color&font/colors.dart';

class MyPayments extends StatefulWidget {
  const MyPayments({Key? key}) : super(key: key);

  @override
  _MyPaymentsState createState() => _MyPaymentsState();
}

class _MyPaymentsState extends State<MyPayments> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var tkn = datam.read('f');
  var response;
  var res;
  // List res = [];
  getData() async {
    res = await mypayment(tkn);
    // res = response;
    return res;
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );

    Widget spacevert1 = SizedBox(
      height: size.height * 0.08,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white(context),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: text9,
          ),
        ),
        title: Text(
          "My Earnings",
          style: GoogleFonts.poppins(
              color: whitebox(context), fontSize: _widthScale * 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapShot) {
                return Column(
                  children: [
                    SizedBox(
                      height: _heightScale * 0,
                    ),
                    res == null
                        ? Container(
                            height: _heightScale * 600,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ))
                        : res['data'].isEmpty
                            ? Container(
                                height: _heightScale * 550,
                                width: double.infinity,
                                child: Center(
                                  child: Text("No Payments till Now!"),
                                ),
                              )
                            : Container(
                                height: _heightScale * 700,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: res.isEmpty ? 0 : res.length,
                                  itemBuilder: (context, index) {
                                    return paymentDetails(
                                      res['data'][index]['topic'],
                                      res['data'][index]['Date']
                                          .toString()
                                          .replaceRange(10, 24, ""),
                                      "Professional Commision : ",
                                      // "Rs ${res[index]['amount']}/-",
                                      res['data'][index]
                                              ['professionalCommission']
                                          .toString(),
                                      index,
                                    );
                                    // res[index]['paymentstatus'] == "SUCCESS"
                                    //     ? "assets/success.png"
                                    //     : "assets/failure.png");
                                  },
                                ),
                              ),
                    // paymentDetails("December", "Amount Credited  ", "Rs 2000/-"),
                    // paymentDetails("January", "Amount Credited  ", "Rs 2000/-"),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget paymentDetails(
      String topic, String title, String data, String amount, int i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        Row(
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.07,
            // ),
            Text(
              "Topic is :  ",
              style: GoogleFonts.poppins(
                  color: black(context),
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              topic,
              style: GoogleFonts.poppins(
                color: text11,
                fontSize: _widthScale * 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 8,
        ),
        Row(
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.07,
            // ),
            Text(
              "Name :  ",
              style: GoogleFonts.poppins(
                  color: black(context),
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              res['data'][i]['aspirantname'] != null
                  ? getCapitalizeStringaa(res['data'][i]['aspirantname'])
                  : "",
              style: GoogleFonts.poppins(
                color: text11,
                fontSize: _widthScale * 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 8,
        ),
        Row(
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.07,
            // ),
            Text(
              "Date : ",
              style: GoogleFonts.poppins(
                  color: black(context),
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: text11,
                fontSize: _widthScale * 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 8,
        ),
        Row(
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.07,
            // ),
            Text(
              data,
              style: GoogleFonts.poppins(
                  color: black(context),
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              amount,
              style: GoogleFonts.poppins(
                  color: text11,
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: _widthScale * 100,
            ),
            // Image.asset(
            //   img,
            //   height: _heightScale * 25,
            //   width: _widthScale * 25,
            // ),
          ],
        ),
        SizedBox(
          height: _heightScale * 32,
        ),
        Container(
          width: double.infinity,
          height: _heightScale * 8,
          color: backgroundColor,
        ),
        SizedBox(
          height: _heightScale * 20,
        ),
      ],
    );
  }
}
