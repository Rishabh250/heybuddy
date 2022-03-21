import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/aspirant_appointment_schedule.dart';
import 'package:heybuddy/Screens/aspirant_booking_update.dart';
import 'package:heybuddy/Screens/aspirant_meeting_complete.dart';
import 'package:heybuddy/Screens/aspirant_refund.dart';
import 'package:heybuddy/Screens/aspirantappointment_booked.dart';
import 'package:heybuddy/Screens/cancel_appointment.dart';
import 'package:heybuddy/Screens/pro_cancel.dart';
import 'package:heybuddy/Screens/prof_booking_update.dart';
import 'package:heybuddy/Screens/profess_appointment_schedule.dart';
import 'package:heybuddy/Screens/professional_addComments.dart';
import 'package:heybuddy/Screens/professional_meeting_completed.dart';
import 'package:heybuddy/Screens/professionalappointment_booked.dart';
import 'package:heybuddy/Screens/proff_cancle_booking.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/mypayments.dart';
import 'package:heybuddy/api/profileget_api.dart';
import 'package:heybuddy/api/second_tab_api.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/singletransaction.dart';
import 'package:heybuddy/api/unique_calendar.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/token_preference.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:heybuddy/widgets/custom_drop_down_button.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'aspirant_booked.dart';
import 'professional_refund.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  var value;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loginPreference = LoginPreference();
  //   chooseLogin();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataProfile();
    loginPreference = LoginPreference();
    login = Login();
    tokenPreference = TokenPreference();
    innerCheck = InnerCheck();
    uperCheck = UpperCheck();
    // chooseLogin();
    uperCheck = UpperCheck();
    innerCheck = InnerCheck();
    // getData();
    chooseLogin();
    innerCheckLogin();
    innerCheckLoginn();
    upperCheckLogin();
    getData();
    // getProfile();
    // getData();
    // chooseLogin();
    // innerCheckLogin();
    // innerCheckLoginn();
    // upperCheckLogin();
    // getData();
    // get2ndtabapi(page);
    // getDataProfile();
    // isChg();
  }

  var val;
  chooseLogin() async {
    val = await loginPreference?.getLoginStatus();
  }

  var inCheck;
  var upCheck;
  var inCheckk;

  // chooseLogin() async {
  //   val = await loginPreference?.getLoginStatus();
  //   // await innerCheckLogin();
  // }

  innerCheckLogin() async {
    inCheck = await innerCheck?.getLogin();
    setState(() {
      print("incheckkkk$inCheck");
    });
  }

  innerCheckLoginn() async {
    inCheckk = await innerCheck?.getLoginn();
    print("incheckp$inCheckk");
  }

  upperCheckLogin() async {
    upCheck = await uperCheck?.getLoginStatus();
  }

  var response;
  Future getData() async {
    response = await getdetails(tkn);
    // Provider.of<Choose>(context, listen: false).changeFavs(response);
    print("resssssss$response");
    if (response == 'professional') {
      // loginPreference?.setLoginStatus(false);
      innerCheck?.setLoginn(true);
      innerCheck?.setLogin(false);
      print("beech1");
      return response;
    } else if (response == 'aspirant') {
      print("bee22");
      innerCheck?.setLogin(true);
      innerCheck?.setLoginn(false);
      // loginPreference?.setLoginStatus(true);
      return response;
    }
  }

  var tkn = datam.read('f');

  int page = 1;

  var valout;
  List resout = [];
  get2ndtabapi(page) async {
    valout = await secondTabPaymentmadeaspirant(tkn, page);
    if (mounted) {
      setState(() {
        //   data = response;
        if (page > 1) {
          print("me chla");
          // data.addAll(res);
          resout = [
            ...resout,
            ...valout,
          ];
          refreshController.loadComplete();
        } else {
          print("Done");
          resout = valout;
        }
        EasyLoading.dismiss();
      });
    }
    // resout = valout;
    // return resout;
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

  var valoutpro;
  var resoutpro;
  get2ndtabapiprofessional(page, valueChoose) async {
    valoutpro = await secondTabPaymentsprofessional(tkn, page, valueChoose);
    if (mounted) {
      setState(() {
        //   data = response;
        if (page > 1) {
          print("me chla");
          // data.addAll(res);
          resoutpro = [
            ...resoutpro,
            ...valoutpro,
          ];
          refreshController.loadComplete();
        } else {
          print("Done");
          resoutpro = valoutpro;
        }
        EasyLoading.dismiss();
      });
    }
    // resout = valout;
    // return resout;
  }

  // void _onRefresh() async {
  //   print("vjbdvjhdbvjif");
  //   page = 1;
  //   // get2ndtabapi(page);
  //   // await Future.delayed(Duration(milliseconds: 1000));
  //   refreshController.refreshCompleted();
  // }

  void _onLoading(context) async {
    print("loadedede");
    //getJobs(page, valueChoose);

    page += 1;
    // await get2ndtabapi(page);
  }

  void _onLoadingpro(context) async {
    print("loadedede");
    //getJobs(page, valueChoose);

    page += 1;
    // get2ndtabapiprofessional(page, valueChoose);
    // await get2ndtabapi(page);
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  var singlet;
  singleTrans(int i) async {
    print("QQQWWW");

    singlet = await SingleTransaction.transaction(resout[i]['orderId'], tkn);
    print("trans id$singlet");
    isChg();
    return singlet;
  }

  var singletpro;
  singleTranspro(int i) async {
    singletpro =
        await SingleTransaction.transaction(resoutpro[i]['orderId'], tkn);
    print("trans id$singlet");
    print("QQQWWW" + singletpro.toString());

    isChgpro();
    return singletpro;
  }

  var responseid;
  getDataProfile() async {
    responseid = await getdata(tkn); //61eff7e265af2b2bef40cde8
    print("//////$responseid");

    return responseid;
  }

  bool flagval = false;
  String isChg() {
    if (responseid['_id'] == singlet['Aspirant']) {
      print("QQQWWW : 2");

      // setState(() {
      //   flagval = true;
      //   print("flagval$flagval");
      // });
      return "Booking made";
    } else {
      return "Booking received";
      // setState(() {
      //   flagval = false;
      //   print("flagval$flagval");
      // });
    }
  }

  String isChgpro() {
    if (responseid['_id'] == singletpro['Aspirant']) {
      print("QQQWWW : 2");

      setState(() {
        flagval = true;
        print("flagval$flagval");
        print("QQQWWW : 2");
      });

      return "Booking made";
    } else {
      return "Booking received";
      // setState(() {
      //   flagval = false;
      //   print("flagval$flagval");
      // });
    }
  }

  List<String> _locations = ["Bookings Made", "Bookings Received"];
  var valueChoose = "Bookings Received";
  @override
  Widget build(BuildContext context) {
    // isChg();
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var word = Provider.of<Favourite>(context).fav;
    var size = MediaQuery.of(context).size;
    return inCheck == false
        ? Scaffold(
            // backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: FutureBuilder(
                  future: get2ndtabapiprofessional(page, valueChoose),
                  builder: (context, snapShot) {
                    // return FutureBuilder(
                    //     future: getDataProfile(),
                    //     builder: (context, snapShot) {
                    return Column(
                      children: [
                        SizedBox(
                          height: _heightScale * 30,
                        ), //_heightScale*102,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomDropDownButton(
                                widthScale: 1,
                                hintText: "",
                                items: _locations,
                                onChange: (newValue) {
                                  setState(() {
                                    valueChoose = newValue.toString();
                                    print(valueChoose);
                                    page = 1;
                                    get2ndtabapiprofessional(page, valueChoose);
                                    //  getData(page, valueChoose, name);
                                  });
                                },
                                value: valueChoose),
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton(
                            //     focusColor: text6,
                            //     // disabledHint: true,
                            //     isExpanded: false,
                            //     value: valueChoose,
                            //     onChanged: (newValue) {
                            //       setState(() {
                            //         valueChoose = newValue.toString();
                            //         print(valueChoose);
                            //         page = 1;
                            //         //  getData(page, valueChoose, name);
                            //       });
                            //     },
                            //     dropdownColor: text6,
                            //     icon: Icon(Icons.keyboard_arrow_down_sharp),
                            //     items: _locations.map((location) {
                            //       return new DropdownMenuItem<String>(
                            //         value: location,
                            //         child: new Text(location,
                            //             style: TextStyle(
                            //               fontSize: 16,
                            //               color: Colors.white,
                            //             )),
                            //       );
                            //     }).toList(),
                            //   ),
                            // ),
                            SizedBox(
                              width: _widthScale * 15,
                            )
                          ],
                        ),
                        SizedBox(
                          height: _heightScale * 20,
                        ),
                        InkWell(
                          onTap: () {
                            // word=="I am Aspirant"?Navigator.p
                          },
                          child: valoutpro == null
                              ? Container(
                                  height: _heightScale * 450,
                                  width: double.infinity,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ))
                              : resoutpro.isEmpty
                                  ? Container(
                                      height: _heightScale * 500,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                            "No Meeting arranged till Now!"),
                                      ),
                                    )
                                  : FutureBuilder(
                                      future: getDataProfile(),
                                      builder: (context, snapShot) {
                                        return responseid == null
                                            ? Container(
                                                height: _heightScale * 450,
                                                width: double.infinity,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ))
                                            : Container(
                                                height: _heightScale * 500,
                                                width: double.infinity,
                                                child: SmartRefresher(
                                                  controller: refreshController,
                                                  enablePullUp: true,
                                                  enablePullDown: false,
                                                  // onRefresh: _onRefresh,
                                                  onLoading: () =>
                                                      _onLoadingpro(context),
                                                  child: ListView.builder(
                                                      itemCount: resoutpro
                                                              .isEmpty
                                                          ? 0
                                                          : resoutpro.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return topicspro(
                                                          context,
                                                          "assets/Group 805.png",
                                                          "Skill: ",
                                                          resoutpro[index]
                                                                  ['skill']
                                                              .toString()
                                                              .toUpperCase(),
                                                          "Status: ",
                                                          resoutpro[index]
                                                              ['screenstatus'],
                                                          resoutpro[index][
                                                                      'screenstatus'] ==
                                                                  "11"
                                                              ? "Completed"
                                                              : resoutpro[index]
                                                                          [
                                                                          'screenstatus'] ==
                                                                      "14"
                                                                  ? "Cancelled"
                                                                  : resoutpro[index]
                                                                              [
                                                                              'screenstatus'] ==
                                                                          "13"
                                                                      ? "Refunded"
                                                                      : resoutpro[index]['screenstatus'] ==
                                                                              "0"
                                                                          ? "Completed"
                                                                          : resoutpro[index]['screenstatus'] == "10"
                                                                              ? "Confirmed"
                                                                              : resoutpro[index]['screenstatus'] == "1"
                                                                                  ? "Confirmed"
                                                                                  : resoutpro[index]['screenstatus'] == "2"
                                                                                      ? "Cancelled"
                                                                                      : resoutpro[index]['screenstatus'] == "3"
                                                                                          ? "Cancelled"
                                                                                          : resoutpro[index]['screenstatus'] == "4"
                                                                                              ? "Booked"
                                                                                              : resoutpro[index]['screenstatus'] == "5"
                                                                                                  ? "Action Required"
                                                                                                  : resoutpro[index]['screenstatus'] == "6"
                                                                                                      ? "Action Required"
                                                                                                      : resoutpro[index]['screenstatus'] == "7"
                                                                                                          ? "Booked"
                                                                                                          : "null",
                                                          resoutpro[index]
                                                                  ['Date']
                                                              .toString()
                                                              .replaceRange(
                                                                  10, 24, ""),
                                                          "",
                                                          index,
                                                        );
                                                        // });
                                                      }),
                                                ),
                                              );
                                      }),
                        ),
                      ],
                    );
                    // });
                  }),
            ),
          )
        : Scaffold(
            // backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: FutureBuilder(
                  future: get2ndtabapi(page),
                  builder: (context, snapShot) {
                    // return FutureBuilder(
                    //     future: getDataProfile(),
                    //     builder: (context, snapShot) {
                    return Column(
                      children: [
                        SizedBox(
                          height: _heightScale * 30,
                        ), //_heightScale*102,),

                        InkWell(
                          onTap: () {
                            // word=="I am Aspirant"?Navigator.p
                          },
                          child: valout == null
                              ? Container(
                                  height: _heightScale * 450,
                                  width: double.infinity,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ))
                              : resout.isEmpty
                                  ? Container(
                                      height: _heightScale * 500,
                                      width: double.infinity,
                                      child: Center(
                                        child: Text(
                                            "No Meeting arranged till Now!"),
                                      ),
                                    )
                                  : FutureBuilder(
                                      future: getDataProfile(),
                                      builder: (context, snapShot) {
                                        return responseid == null
                                            ? Container(
                                                height: _heightScale * 450,
                                                width: double.infinity,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ))
                                            : Container(
                                                height: _heightScale * 600,
                                                width: double.infinity,
                                                child: SmartRefresher(
                                                  controller: refreshController,
                                                  enablePullUp: true,
                                                  enablePullDown: false,
                                                  // onRefresh: _onRefresh,
                                                  onLoading: () =>
                                                      _onLoading(context),
                                                  child: ListView.builder(
                                                      itemCount: resout.isEmpty
                                                          ? 0
                                                          : resout.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        print("TTTTTTTTTT" +
                                                            resout[index][
                                                                    'screenstatus']
                                                                .toString());
                                                        print("TTTTTTTTTT" +
                                                            resout[index]
                                                                    ['status']
                                                                .toString());
                                                        return topics(
                                                          context,
                                                          "assets/Group 805.png",
                                                          "Skill: ",
                                                          resout[index]['skill']
                                                              .toString()
                                                              .toUpperCase(),
                                                          "Status: ",
                                                          resout[index]
                                                              ['screenstatus'],
                                                          resout[index][
                                                                      'screenstatus'] ==
                                                                  "0"
                                                              ? "Completed"
                                                              : resout[index][
                                                                          'screenstatus'] ==
                                                                      "1"
                                                                  ? "Confirmed"
                                                                  : resout[index]
                                                                              [
                                                                              'screenstatus'] ==
                                                                          "13"
                                                                      ? "Refunded"
                                                                      : resout[index]['screenstatus'] ==
                                                                              "14"
                                                                          ? "Refunded"
                                                                          : resout[index]['screenstatus'] == "2"
                                                                              ? "Cancelled"
                                                                              : resout[index]['screenstatus'] == "3"
                                                                                  ? "Cancelled"
                                                                                  : resout[index]['screenstatus'] == "4"
                                                                                      ? "Booked"
                                                                                      : resout[index]['screenstatus'] == "5"
                                                                                          ? "Action Required"
                                                                                          : resout[index]['screenstatus'] == "6"
                                                                                              ? "Action Required"
                                                                                              : resout[index]['screenstatus'] == "7"
                                                                                                  ? "Booked"
                                                                                                  : "null",
                                                          resout[index]['Date']
                                                              .toString()
                                                              .replaceRange(
                                                                  10, 24, ""),
                                                          "",
                                                          index,
                                                        );
                                                        // });
                                                      }),
                                                ),
                                              );
                                      }),
                        ),
                      ],
                    );
                    // });
                  }),
            ),
          );
  }

  Future showAlertDialog() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_widthScale * 12),
            ),
            title: Text(
              "Don't Worry Your Amount will be refunded in 7 days",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 15, color: black(context)),
              ),
            ),
            actions: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                  SizedBox(
                    height: _heightScale * 15,
                  ),
                ],
              ),
            ],
          );
        });
  }

  var output;
  Widget topics(
    BuildContext context,
    String img,
    String title,
    String title1,
    String title2,
    // String title3,
    // String title4,
    String title5,
    // String name,
    String title99,
    String subtitle,
    // Color col,
    String time,
    int i,
    // String whomade,
  ) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var word = Provider.of<Favourite>(context).fav;

    void navigatePage(String val) {
      if (val == "0") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantMeetingComplete(
                      index: resout[i]['orderId'],
                      getID: resout[i]['_id'],
                    )));
      }
      if (val == "1") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantAppointmentBooked(
                      index: resout[i]['orderId'],
                      getId: resout[i]['_id'],
                    )));
      } else if (val == "2") {
        // showAlertDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CancelAppointment(
                      index: resout[i]['orderId'],
                    )));
      } else if (val == "3") {
        return null;
      } else if (val == "4") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantBookingUpdate(
                      index: resout[i]['orderId'],
                    )));
      } else if (val == "5") {
        print("QQQWWW : 25");

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantAppointmentSchedule(
                      index: resout[i]['orderId'],
                    )));
      } else if (val == "6") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionalAppointmentSchedule(
                      index: resout[i]['orderId'],
                    )));
      } else if (val == "7") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantBookingUpdate(
                      index: resout[i]['orderId'],
                    )));
      } else if (val == "13") {
        // showAlertDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantRefund(
                      index: resout[i]['orderId'],
                    )));
      }
    }

    return InkWell(
      onTap: () async {
        output = await UniqueUserCalendar.uniqueUser(resout[i]['orderId'], tkn);
        singleTrans(i);
        navigatePage(title5);
      },
      child: FutureBuilder(
          future: getDataProfile(),
          builder: (context, snapShot) {
            var date = subtitle.split('-');

            var mon = int.parse(date[1]);

            var finalDate = date[2] + " " + months[mon - 1] + ', ' + date[0];

            return Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(_widthScale * 5.0)),
                      child: Padding(
                        padding: EdgeInsets.only(left: _widthScale * 10.0),
                        child: Image.asset(
                          img,
                          height: _heightScale * 40,
                          width: _widthScale * 40,
                          fit: BoxFit.fill,
                          //scale: 10,
                        ),
                      )),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 12.0),
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: black(context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 12.0),
                            child: Text(
                              title1,
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12, color: text9),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 10,
                      ),
                      Row(
                        children: [
                          Text(
                            title2,
                            style: GoogleFonts.poppins(
                                fontSize: _widthScale * 12,
                                color: black(context),
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                title99,
                                style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: title99 == "Completed"
                                      ? Colors.green
                                      : title99 == "Booked"
                                          ? Colors.orange
                                          : title99 == "Confirmed"
                                              ? Colors.green
                                              : title99 == "Action Required"
                                                  ? Colors.red
                                                  : title99 == "Cancelled"
                                                      ? Colors.red
                                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: _heightScale * 10,
                      // ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 10.0),
                            child: Text(
                              "Name : ",
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: black(context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 10.0),
                            child: Text(
                              resout[i]["Aspirant"] == responseid['_id']
                                  ? getCapitalizeStringaa(
                                      resout[i]['professionalname'] == null ||
                                              resout[i]
                                                      ['isAspirantAnonymous'] ==
                                                  "true"
                                          ? "Anonymous"
                                          : resout[i]['professionalname'])
                                  : getCapitalizeStringaa(
                                      resout[i]['aspirantname'] != null
                                          ? resout[i]['aspirantname']
                                          : ""),
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12, color: text9),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 10,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(finalDate,
                                  style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 12,
                                    color: text9,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 10,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       time,
                      //       style: GoogleFonts.poppins(
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: _widthScale * 12,
                      //           color: text9),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: _heightScale * 10,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       whomade,
                      //       style: GoogleFonts.poppins(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: _widthScale * 13,
                      //           color: text9),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _heightScale * 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: _heightScale * 1,
                  color: text13,
                ),
                // SizedBox(
                //   height: _heightScale * 25,
                // ),
              ],
            );
          }),
    );
  }

  var outputpro;
  Widget topicspro(
    BuildContext context,
    String img,
    String title,
    String title1,
    String title2,
    // String title3,
    // String title4,
    String title5,
    // String name,
    String title99,
    String subtitle,
    // Color col,
    String time,
    int i,
    // String whomade,
  ) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var word = Provider.of<Favourite>(context).fav;
    // upCheck == true
    //     ? (val == false
    //         ? Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => Setting()))
    //         : null)
    //     : inCheck == true
    //         //  : (inCheck == true||inCheckk == false)
    //         ? null
    //         : inCheck == null
    //             ? CircularProgressIndicator()
    //             : Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => Setting()));

    void navigatePagepro(String val) {
      if (val == "0") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantMeetingComplete(
                      index: resoutpro[i]['orderId'],
                      getID: resoutpro[i]['_id'],
                    )));
      }

      if (val == "11") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionalAppointmentCompleted(
                      index: resoutpro[i]['orderId'],
                      getId: resoutpro[i]['_id'],
                    )));
      } else if (val == "10") {
        // showAlertDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionalAppointmentBooked(
                      index: resoutpro[i]['orderId'],
                      getId: resoutpro[i]['_id'],
                    )));
      } else if (val == "1") {
        // showAlertDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantAppointmentBooked(
                      index: resoutpro[i]['orderId'],
                      getId: resout[i]['_id'],
                    )));
      } else if (val == "2") {
        // showAlertDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CancelAppointment(
                      index: resoutpro[i]['orderId'],
                    )));
      } else if (val == "14") {
        // showAlertDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProCancel(
                      index: resoutpro[i]['orderId'],
                    )));
      } else if (val == "3") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CancelAppointment(
                      index: resoutpro[i]['orderId'],
                    )));
      } else if (val == "4") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantBookingUpdate(
                      index: resoutpro[i]['orderId'],
                    )));
      }
      if (val == "13") {
        // showAlertDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantRefund(
                      index: resoutpro[i]['orderId'],
                    )));
      } else if (val == "5") {
        print("QQQWWW : 251");

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AspirantAppointmentSchedule(
                      index: resoutpro[i]['orderId'],
                    )));
      } else if (val == "6") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionalAppointmentSchedule(
                    index: resoutpro[i]['orderId'])));
      } else if (val == "7") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfessionalsBookingUpdate(
                      index: resoutpro[i]['orderId'],
                    )));
      }
    }

    return InkWell(
      onTap: () async {
        // print("QQQWWW" + resoutpro[i]['orderId'].toString());
        output =
            await UniqueUserCalendar.uniqueUser(resoutpro[i]['orderId'], tkn);
        singleTranspro(i);
        navigatePagepro(title5);
      },
      child: FutureBuilder(
          future: getDataProfile(),
          builder: (context, snapShot) {
            var date = subtitle.split('-');

            var mon = int.parse(date[1]);

            var finalDate = date[2] + " " + months[mon - 1] + ', ' + date[0];
            return Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(_widthScale * 5.0)),
                      child: Padding(
                        padding: EdgeInsets.only(left: _widthScale * 10.0),
                        child: Image.asset(
                          img,
                          height: _heightScale * 40,
                          width: _widthScale * 40,
                          fit: BoxFit.fill,
                          //scale: 10,
                        ),
                      )),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 12.0),
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: black(context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 12.0),
                            child: Text(
                              title1,
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: Styles.isDark
                                      ? whites.withOpacity(0.8)
                                      : text9),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 10,
                      ),
                      Row(
                        children: [
                          Text(
                            title2,
                            style: GoogleFonts.poppins(
                                fontSize: _widthScale * 12,
                                color: black(context),
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                title99,
                                style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: title99 == "Completed"
                                      ? Colors.green
                                      : title99 == "Booked"
                                          ? Colors.orange
                                          : title99 == "Confirmed"
                                              ? Colors.green
                                              : title99 == "Action Required"
                                                  ? Colors.red
                                                  : title99 == "Cancelled"
                                                      ? Colors.red
                                                      : title99 == "Refunded"
                                                          ? Color.fromARGB(
                                                              255, 169, 211, 18)
                                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: _heightScale * 10,
                      // ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 10.0),
                            child: Text(
                              "Name : ",
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: black(context),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: _heightScale * 10.0),
                            child: Text(
                              resoutpro[i]["Aspirant"] == responseid['_id']
                                  ? getCapitalizeStringaa(resoutpro[i]
                                              ['isAspirantAnonymous'] !=
                                          "false"
                                      ? "Anonymous"
                                      : resoutpro[i]['professionalname'])
                                  : getCapitalizeStringaa(resoutpro[i]
                                              ['isAspirantAnonymous'] ==
                                          "true"
                                      ? "Anonymous"
                                      : resoutpro[i]['aspirantname']),
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: Styles.isDark
                                      ? whites.withOpacity(0.8)
                                      : text9),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 10,
                      ),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(finalDate,
                                  style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 12,
                                    color: Styles.isDark
                                        ? whites.withOpacity(0.8)
                                        : text9,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 10,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       time,
                      //       style: GoogleFonts.poppins(
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: _widthScale * 12,
                      //           color: text9),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: _heightScale * 10,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       whomade,
                      //       style: GoogleFonts.poppins(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: _widthScale * 13,
                      //           color: text9),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _heightScale * 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: _heightScale * 1,
                  color: text13,
                ),
                // SizedBox(
                //   height: _heightScale * 25,
                // ),
              ],
            );
          }),
    );
  }
}
