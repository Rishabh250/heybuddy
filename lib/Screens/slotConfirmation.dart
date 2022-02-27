import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/mypayments.dart';
import 'package:heybuddy/api/api_payment.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/api/verify_payment.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
// import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

class SlotConfirm extends StatefulWidget {
  var i;
  var topics;
  var date;
  var lang;
  SlotConfirm(
      {required this.i,
      required this.topics,
      required this.date,
      required this.lang});
  // const SlotConfirm({Key? key}) : super(key: key);
  // var date;
  // SlotConfirm(@required this.date);

  @override
  _SlotConfirmState createState() => _SlotConfirmState();
}

class _SlotConfirmState extends State<SlotConfirm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("lang is ${widget.lang}");
    onTap();
    getData();
  }

  var output;
  onTap() async {
    output = await UniqueUser.uniqueUser(widget.i);
    return output;
  }

  bool isLoading1 = false;
  var amtt;
//  amtt=widget.lang;
  var tkn = datam.read('f');
  var response;
  getData() async {
    response = await getdata(tkn);
    print('ffddss${response['phone']}');
  }

  var values;
  onVerify() async {
    print("Orddr id is${result['orderId']}");
    values = await PaymentVerify.paymentverify(
      result['orderId'],
    );
    return values;
  }

  var result;
  onResult() async {
    result = await PaymentUpdate.paymentupdate(
        response['phone'],
        output['user'][0]['phone'],
        widget.topics,
        1, //widget.lang=="General Conversation"?1:1,
        widget.date,
        widget.lang);
    return result;
  }

  String mid = "", orderId = "", amount = "", txnToken = "";
  String resultt = "";
  bool isStaging = true;
  bool isApiCallInprogress = false;
  String callbackUrl = "";
  bool restrictAppInvoke = false;
  bool enableAssist = true;
  Future<void> _startTransaction(t, m, o) async {
    if (t.isEmpty) {
      print('hjvh');
      return;
    }
    var sendMap = <String, dynamic>{
      "mid": m,
      "orderId": o,
      "amount": 1,
      "txnToken": t,
      "callbackUrl": callbackUrl,
      "isStaging": isStaging,
      "restrictAppInvoke": restrictAppInvoke,
      "enableAssist": enableAssist
    };
    print('kk$sendMap');
    try {
      var responses = AllInOneSdk.startTransaction(
          m, o, '1', t, " ", isStaging, restrictAppInvoke, enableAssist);
      responses.then((value) {
        // _verifysdk(value);
        onVerify();
        print('testing$value');
        setState(() {
          resultt = value.toString();
        });

        print('ttyy$resultt');
        print('res1$responses');
        Future.delayed(Duration(seconds: 3));
        // Navigator.pop(context);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => MyPayments()));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Nav1(
                      selectedIndex: 1,
                    )),
            (route) => false);
      }).catchError((onError) {
        if (onError is PlatformException) {
          print('llkvv');
          // _verifysdk(onError.details);
          onVerify();
          setState(() {
            resultt = onError.message.toString() +
                " \n  " +
                onError.details.toString();
          });

          print('yuyu${onError.details}');
          print('ttyyy$resultt');
          print('res2$responses');
          print('ressss%result');
        } else {
          // _verifysdk(onError.details);
          onVerify();
          print('iio');
          setState(() {
            resultt = onError.toString();
          });

          print('ttyyyy$resultt');
          print('res3$responses');
        }
      });
      Future.delayed(Duration(seconds: 3));
      // Navigator.pop(context);
    } catch (err) {
      resultt = err.toString();
      // _verifysdk(err);
    }
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
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

    Widget spacehort1 = SizedBox(
      width: size.width * 0.1,
    );

    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbar(context), // backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Styles.isDark ? whites.withOpacity(0.8) : text9,
          ),
        ),
        title: Text(
          "Book Slot",
          style: GoogleFonts.poppins(
              color: black(context),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
        child: FutureBuilder(
            future: onTap(),
            builder: (context, snapShot) {
              return SingleChildScrollView(
                child: output == null
                    ? Container(
                        height: _heightScale * 700,
                        width: double.infinity,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        children: [
                          spacevert,
                          Container(
                            height: MediaQuery.of(context).size.height * 0.69,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      // CircleAvatar(
                                      //   radius: _widthScale * 50,
                                      //   backgroundImage: AssetImage("assets/Ellipse 9.png"),
                                      // ),
                                      output['user'][0]['anonymous'] == "false"
                                          ? output['user'][0]['profilePic'] !=
                                                  ""
                                              ? Container(
                                                  height: _heightScale * 90,
                                                  width: _widthScale * 90,
                                                  decoration: BoxDecoration(
                                                      color: white(context)
                                                          .withOpacity(0.39),
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            output['user'][0]
                                                                ['profilePic'],
                                                          ),
                                                          fit: BoxFit.cover)),
                                                )
                                              : (output['user'][0]['gender'] ==
                                                          "Male" ||
                                                      output['user'][0]
                                                              ['gender'] ==
                                                          "Other")
                                                  ? Image.asset(
                                                      'assets/Men Professional.png',
                                                      height: _heightScale * 90,
                                                      width: _widthScale * 90,
                                                    )
                                                  : Image.asset(
                                                      'assets/Female Professional.png',
                                                      height: _heightScale * 90,
                                                      width: _widthScale * 90,
                                                    )
                                          : (output['user'][0]['gender'] ==
                                                      "Male" ||
                                                  output['user'][0]['gender'] ==
                                                      "Other")
                                              ? Image.asset(
                                                  'assets/Men Professional.png',
                                                  height: _heightScale * 90,
                                                  width: _widthScale * 90,
                                                )
                                              : Image.asset(
                                                  'assets/Female Professional.png',
                                                  height: _heightScale * 90,
                                                  width: _widthScale * 90,
                                                ),
                                      // Container(
                                      //   height: _heightScale * 90,
                                      //   width: _widthScale * 90,
                                      //   decoration: BoxDecoration(
                                      //       color: white.withOpacity(0.39),
                                      //       shape: BoxShape.circle,
                                      //       // image: response['profilePic'] == ""
                                      //       image:

                                      // output['user'][0]
                                      //             ['profilePic'] ==
                                      //         ""
                                      //     ? DecorationImage(
                                      //         image: NetworkImage(imggg))
                                      //     : DecorationImage(
                                      //         image: NetworkImage(
                                      //           output['user'][0]
                                      //               ['profilePic'],
                                      //         ),
                                      //         fit: BoxFit.cover)
                                      // : DecorationImage(
                                      //     image: NetworkImage(
                                      //         response['profilePic']),
                                      //     fit: BoxFit.fill),
                                      //       ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  data(
                                      "Professional's Name:",
                                      output['user'][0]['name'] == ''
                                          ? "Not Known"
                                          : output['user'][0]['name']),
                                  SizedBox(
                                    height: _heightScale * 35,
                                  ),
                                  data("Date:", widget.date),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  data("Conversation Topics:", widget.topics),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Skills",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _heightScale * 17,
                                  ),
                                  Row(
                                    children: [
                                      button(getCapitalizeStringaa(widget.lang),
                                          text6, white(context)),
                                      // spacehort,
                                      // button("Java", text6, white),
                                      // spacehort,
                                      // button("Flutter", text6, white),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            // color:Colors.yellow,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: _heightScale * 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total Amount",
                                      style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 16),
                                    ),
                                    SizedBox(
                                      width: _widthScale * 129,
                                    ),
                                    Text(
                                      widget.lang == "general conversation"
                                          ? "Rs 249/-"
                                          : "Rs 999/-",
                                      style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: _heightScale * 32,
                                ),
                                Container(
                                  //margin: EdgeInsets.only(left: 16, right: 16),
                                  height: _widthScale * 56,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (isLoading1) return;
                                        setState(() {
                                          isLoading1 = true;
                                        });
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => SlotConfirm()));
                                        var resd = await onResult();
                                        print(resd['txnToken']);
                                        print(resd['mid']);
                                        print(resd['orderId']);

                                        await _startTransaction(
                                            resd['txnToken'],
                                            resd['mid'],
                                            resd['orderId']);
                                        setState(() {
                                          isLoading1 = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: isLoading1
                                            ? text6.withOpacity(0.4)
                                            : text6,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(
                                                  _widthScale * 10.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          isLoading1
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: _widthScale * 50,
                                                    ),
                                                    SizedBox(
                                                      height: _heightScale * 20,
                                                      width: _widthScale * 20,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: white(context),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: _widthScale * 20,
                                                    ),
                                                    Text("Please Wait...")
                                                  ],
                                                )
                                              : Text(
                                                  'Proceed To CheckOut',
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              _widthScale *
                                                                  18)),
                                                ),
                                          SizedBox(
                                            width: _widthScale * 82,
                                          ),
                                          Text(
                                            '>',
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        _widthScale * 18)),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              );
            }),
      ),
    );
  }

  Widget button(String time, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: col,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(_widthScale * 50.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(_widthScale * 10.0),
          child: Text(
            time,
            style: GoogleFonts.poppins(fontSize: _widthScale * 14, color: col2),
          ),
        ));
  }

  Widget data(String title, String title2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        Row(
          children: [
            // SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 6,
        ),
        Row(
          children: [
            // SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Text(
              title2,
              style: GoogleFonts.poppins(
                fontSize: _widthScale * 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
