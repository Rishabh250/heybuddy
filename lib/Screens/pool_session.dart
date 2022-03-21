import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/bank_details.dart';
import 'package:heybuddy/api/all_events.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

class PoolSession extends StatefulWidget {
  var index;
  var id;
  PoolSession({required this.index, required this.id});
  // const PoolSession({Key? key}) : super(key: key);

  @override
  _PoolSessionState createState() => _PoolSessionState();
}

class _PoolSessionState extends State<PoolSession> {
  bool isSwitch = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  var tkn = datam.read('f');
  var response;
  getData() async {
    response = await getdata(tkn);
    print('ffddss${response['phone']}');
  }

  var values;
  onVerify() async {
    print("Orddr id is${result['orderId']}");
    values = await VerifyEventPayment.newevent(
      result['txnToken'],
    );
    return values;
  }

  var result;

  var events;
  List event = [];
  getAllEvents() async {
    events = await getallevents();
    event = events;
    return event;
  }

  var newevent;
  newEvent() async {
    result = await NewEventTransaction.newevent(response['phone'], widget.id);
    print("newEvent is $result");
    return result;
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
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
                      selectedIndex: 0,
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

  bool isLoading1 = false;
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
        backgroundColor: appbar(context), // white(context),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Styles.isDark ? whites.withOpacity(0.8) : text9,
          ),
        ),
        title: Text(
          "Events",
          style: GoogleFonts.poppins(
              color: black(context), fontSize: _widthScale * 18),
        ),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: getAllEvents(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                var time = event[widget.index]["meetingTime"];
                time = time.split(':');
                var hours = int.parse(time[0]);
                if (hours > 12) {
                  if (hours == 13) {
                    hours = 1;
                  }
                  if (hours == 14) {
                    hours = 2;
                  }
                  if (hours == 15) {
                    hours = 3;
                  }
                  if (hours == 16) {
                    hours = 4;
                  }
                  if (hours == 17) {
                    hours = 5;
                  }
                  if (hours == 18) {
                    hours = 6;
                  }
                  if (hours == 19) {
                    hours = 7;
                  }
                  if (hours == 20) {
                    hours = 8;
                  }
                  if (hours == 21) {
                    hours = 9;
                  }
                  if (hours == 22) {
                    hours = 10;
                  }
                  if (hours == 23) {
                    hours = 11;
                  }
                  if (hours == 24) {
                    hours = 0;
                  }
                }
                var noon;
                if (int.parse(time[0]) > 12) {
                  noon = "PM";
                }
                if (int.parse(time[0]) == 12) {
                  noon = "PM";
                }
                if (int.parse(time[0]) < 12) {
                  noon = "AM";
                }

                var finalTime = hours.toString() + ":" + time[1] + " " + noon;

                var date = event[widget.index]["Date"];
                date = date.split('/');

                var mon = int.parse(date[1]);

                var finalDate =
                    date[2] + " " + months[mon - 1] + ', ' + date[0];

                return events == null
                    ? Container(
                        height: _heightScale * 700,
                        width: double.infinity,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        children: [
                          event[widget.index]['eventPic'] == ''
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: _widthScale * 30),
                                  height: _heightScale * 197,
                                  width: _widthScale * 315,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/pool.png'),
                                    fit: BoxFit.fill,
                                  )),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: _widthScale * 30),
                                  height: _heightScale * 197,
                                  width: _widthScale * 315,
                                  decoration: BoxDecoration(
                                      color: white(context).withOpacity(0.39),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            event[widget.index]['eventPic'],
                                          ),
                                          fit: BoxFit.cover)),
                                  //  BoxDecoration(
                                  //     image: DecorationImage(
                                  //   image:
                                  //       AssetImage('assets/pool.png'),
                                  //   fit: BoxFit.fill,
                                  // )),
                                ),
                          // Image.asset(
                          //   "assets/Rectangle 555.png",
                          //   height: _heightScale * 217,
                          //   width: _widthScale * 375,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: _widthScale * 24.0,
                                top: _heightScale * 20),
                            child: Row(
                              children: [
                                Text(
                                  getCapitalizeStringaa(
                                      "${event[widget.index]['title']}"),
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: _widthScale * 16,
                                          decoration: TextDecoration.underline,
                                          color: black(context))),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: _widthScale * 24.0,
                                top: _heightScale * 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    event[widget.index]['profs'].length == 1
                                        ? Text(getCapitalizeStringaa(
                                            "Professional Name : " +
                                                event[widget.index]['profs'][0]
                                                        ['name']
                                                    .toString()
                                                    .toUpperCase()))
                                        : event[widget.index]['profs'].length ==
                                                2
                                            ? Text(
                                                getCapitalizeStringaa(
                                                    "Professional Name : " +
                                                        event[widget.index]
                                                                    ['profs'][0]
                                                                ['name']
                                                            .toString()
                                                            .toUpperCase() +
                                                        " and  " +
                                                        event[widget.index]
                                                                    ['profs'][1]
                                                                ['name']
                                                            .toString()
                                                            .toUpperCase()),
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            _widthScale * 16,
                                                        color: black(context))),
                                              )
                                            : event[widget.index]['profs']
                                                        .length ==
                                                    2
                                                ? Text(
                                                    getCapitalizeStringaa(
                                                        "Professional Name : " +
                                                            event[widget.index][
                                                                        'profs']
                                                                    [0]['name']
                                                                .toString()
                                                                .toUpperCase() +
                                                            ", " +
                                                            event[widget.index][
                                                                        'profs']
                                                                    [1]['name']
                                                                .toString()
                                                                .toUpperCase() +
                                                            ", " +
                                                            event[widget.index][
                                                                        'profs']
                                                                    [2]['name']
                                                                .toString()
                                                                .toUpperCase()),
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                _widthScale *
                                                                    16,
                                                            color: black(
                                                                context))),
                                                  )
                                                : Text("Anonymous",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                _widthScale *
                                                                    16,
                                                            color:
                                                                black(context))))
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: _heightScale * 20,
                          ),
                          content(
                              "assets/cal.png",
                              "$finalDate , "
                                  "$finalTime"),
                          SizedBox(
                            height: _heightScale * 8,
                          ),
                          content("assets/video.png", "Online"),
                          SizedBox(
                            height: _heightScale * 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: _widthScale * 24.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  getCapitalizeStringaa("Duration : "
                                      "${event[widget.index]['duration']}"),
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: _widthScale * 12,
                                          color: black(context))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _heightScale * 20,
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                left: _widthScale * 24.0,
                                top: _heightScale * 20),
                            child: Row(
                              children: [
                                Text(
                                  "About",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: _widthScale * 16,
                                          fontWeight: FontWeight.w500,
                                          color: black(context))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _heightScale * 14,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _widthScale * 24.0),
                            child: Text(
                                event[widget.index]['eventdescription'] != null
                                    ? getCapitalizeStringaa(
                                        "${event[widget.index]['eventdescription']}")
                                    : "No Description",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Styles.isDark
                                      ? whites.withOpacity(0.8)
                                      : text9,
                                )),
                          ),
                          SizedBox(
                            height: _heightScale * 47,
                          ),
                          Container(
                            height: _heightScale * 56,
                            width: _widthScale * 328,
                            child: ElevatedButton(
                                onPressed: () async {
                                  // newEvent();
                                  if (isLoading1) return;
                                  setState(() {
                                    isLoading1 = true;
                                  });
                                  var resd = await newEvent();
                                  print(resd['txnToken']);
                                  print(resd['mid']);
                                  print(resd['orderId']);

                                  await _startTransaction(resd['txnToken'],
                                      resd['mid'], resd['orderId']);
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
                                        new BorderRadius.circular(10.0),
                                    side: BorderSide(color: text6),
                                  ),
                                ),
                                child: isLoading1 == true
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
                                            child: CircularProgressIndicator(
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
                                        "Attend for Rs ${event[widget.index]['amount']}",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: _widthScale * 18,
                                              color: white(context)),
                                        ),
                                      )),
                          ),
                        ],
                      );
              })),
    );
  }

  Widget content(String img, String text) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: _widthScale * 24.0),
              child: Image.asset(
                img,
                color: black(context),
                height: _heightScale * 18,
                width: _widthScale * 16.53,
              ),
            ),
            SizedBox(width: _widthScale * 7.43),
            Text(
              text,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: _widthScale * 12,
                      fontWeight: FontWeight.w300,
                      color: black(context))),
            ),
          ],
        )
      ],
    );
  }
}
