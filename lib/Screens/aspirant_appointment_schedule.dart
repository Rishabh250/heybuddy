// import 'dart:html';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/calendar.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/aspirant_choice.dart';
import 'package:heybuddy/api/meeting.dart';
import 'package:heybuddy/api/refund_api.dart';
import 'package:heybuddy/api/second_tab_api.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_calendar.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:provider/provider.dart';

class AspirantAppointmentSchedule extends StatefulWidget {
  var index;
  AspirantAppointmentSchedule({required this.index});
  // const AppointmentBooked({Key? key}) : super(key: key);

  @override
  _AspirantAppointmentScheduleState createState() =>
      _AspirantAppointmentScheduleState();
}

class _AspirantAppointmentScheduleState
    extends State<AspirantAppointmentSchedule> {
  var time;

  var add = TimeOfDay.minutesPerHour / 2;
  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour;
      final minutes = time.minute;
      // final extratime = TimeOfDay(hour: hours, minute: minutes);
      if (minutes < 10) {
        return '$hours:${0}${minutes} - $hours:${minutes + 30}';
      } else if (minutes > 10 && minutes < 30) {
        return '$hours:$minutes - $hours:${minutes + 30}'; //'$hours:$minutes';
      } else if (minutes > 30) {
        return '$hours:$minutes - ${hours + 1}:${0}${minutes + 30 - 60}';
      }
    }
    return "";
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pickedDate = DateTime.now();
    // get2ndtabapi();
    onTap();
    getData();
  }

  var tkn = datam.read('f');
  var responsed;
  getData() async {
    responsed = await getdata(tkn);
  }

  var refund;
  refundPayment() {
    var refund =
        PaymentRfund.paymentrefund(output['orderId'], responsed['phone'], tkn);
    return refund;
  }

  // var valout;
  // // var tkn = datam.read('f');
  // List resout = [];
  // get2ndtabapi() async {
  //   valout = await secondTabPayment(tkn);
  //   resout = valout;
  //   return resout;
  // }

  var subout;
  String approve = '';

  submit() {
    print('ggggg' + output['orderId']);
    subout = AspirantChoice.choice(output['orderId'], approve, tkn);
  }

  var me;
  meet() {
    me = Meeting.meeting(output['orderId']);
  }

  Future showAlertDialog(BuildContext context) {
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
              "You are about to cancel the session with Boooking Id ${output['orderId'].toString().replaceRange(0, 6, "")} for ${output["skill"]}" +
                  " You will receive your amount back to your source directly.",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 14, color: black(context)),
              ),
            ),
            actions: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: _widthScale * 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                // chooseImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  side: BorderSide(color: white(context)),
                                ),
                              ),
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(fontSize: 16, color: white(context)),
                                ),
                              ))),
                      SizedBox(
                        width: _widthScale * 20,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                // chooseImage(ImageSource.gallery);
                                // Navigator.pop(context);
                                onCancle();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: text6,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  side: BorderSide(color: text6),
                                ),
                              ),
                              child: Text(
                                "Proceed",
                                style: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(fontSize: 16, color: white(context)),
                                ),
                              ))),
                      SizedBox(
                        width: _widthScale * 10,
                      ),
                    ],
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

  onCancle() {
    if (output['meetingTime'] == "") {
      const snackBar = SnackBar(
        content: Text("Professional not yet accept this meeting offer"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pop(context);
    } else {
      setState(() {
        approve = 'no';
      });
      submit();
      refundPayment();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Nav1(
                    selectedIndex: 1,
                  )));
      // Navigator.pop(context);
    }
  }

  onAccept() {
    if (output['meetingTime'] == "") {
      const snackBar = SnackBar(
        content: Text("Professional not yet accept this meeting offer"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pop(context);
    } else {
      setState(() {
        approve = 'yes';
      });
      submit();
      meet();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Nav1(
                    selectedIndex: 1,
                  )));
      // Navigator.pop(context);
    }
  }

  var output;
  onTap() async {
    output = await UniqueUserCalendar.uniqueUser(widget.index, tkn);
    return output;
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
    var word = Provider.of<Favourite>(context).fav;
    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );
    // Widget spacehort = SizedBox(
    //   width: size.width * 0.07,
    // );
    // Widget spacehort1 = SizedBox(
    //   width: size.width * 0.05,
    // );
    // Widget spacehort2 = SizedBox(
    //   width: size.width * 0.08,
    // );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.03,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: white(context).withOpacity(0.6), //backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: text9,
            size: _widthScale * 20,
          ),
        ),
        title: Text(
          "Appointment",
          style: GoogleFonts.poppins(
              color: whitebox(context),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: FutureBuilder(
              future: onTap(),
              builder: (context, snapShot) {
                return output == null
                    ? Container(
                        height: _heightScale * 650,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                    : Column(
                        children: [
                          Container(
                            height: size.height * 0.8,
                            child: Column(
                              children: [
                                spacevert,
                                Image.asset("assets/Group 246 (1).png"),
                                spacevert1,
                                Appointment(
                                    "Booking id: ",
                                    output['orderId']
                                        .toString()
                                        .replaceRange(0, 6, ""),
                                    text9),
                                spacevert1,
                                Appointment("Topic: ", output['topic'], text9),
                                // spacevert1,
                                // Appointment("Professional: ",
                                //     "Manipreet Mittapelli", text9),
                                spacevert1,
                                Appointment(
                                    "Name: ",
                                    output['professionalname'] != null
                                        ? getCapitalizeStringaa(
                                            output['professionalname'])
                                        : "No Detail",
                                    text9),
                                // SizedBox(
                                //   height: _heightScale * 32,
                                // ),
                                spacevert1,
                                Appointment(
                                    "Status: ",
                                    "Action Required" // resout[widget.index]['status']
                                    ,
                                    Colors.red),
                                spacevert1,
                                Appointment(
                                    "Date: ",
                                    output['Date']
                                        .toString()
                                        .replaceRange(10, 24, ""),
                                    text9),
                                spacevert,
                                Row(
                                  children: [
                                    // spacehort,
                                    Text(
                                      " Time Slot",
                                      style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 16,
                                          color: text9),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _heightScale * 14,
                                ),
                                Row(
                                  children: [
                                    // spacehort2,
                                    Text(
                                      output['meetingTime'] == ""
                                          ? "Awaiting for professional professional"
                                          : "  " +
                                              output['meetingTime'].toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 18,
                                          color: text9),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(left: 16, right: 15),
                                //   height: 56,
                                //   width: double.maxFinite,
                                //   decoration: BoxDecoration(
                                //     color: white.withOpacity(0.5),
                                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                                //   ),
                                //   child: ListTile(
                                //     title: Text(getText()),

                                //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              // spacehort,
                              Expanded(child: button("Cancel", white(context), text6)),
                              SizedBox(
                                width: _widthScale * 15,
                              ),
                              Expanded(child: button("Accept", text6, white(context))),
                              // spacehort,
                            ],
                          ),
                        ],
                      );
              }),
        ),
      ),
    );
  }

  Widget buttonw(String text, Color col1, Color col2) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;

    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: col1,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: text6),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40.0, right: 40, top: 15, bottom: 15),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: _widthScale * 18, color: col2),
            ),
          ),
        ));
  }

  Widget Appointment(String heading, String data, Color col) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Row(
      children: [
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 0.08,
        // ),
        Text(
          heading,
          style: GoogleFonts.poppins(
              fontSize: _widthScale * 16,
              color: black(context),
              fontWeight: FontWeight.w600),
        ),
        Text(
          data,
          style: GoogleFonts.poppins(fontSize: _widthScale * 16, color: col),
        ),
      ],
    );
  }

  Widget button(String text, Color col1, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      width: _widthScale * 157,
      height: _widthScale * 56,
      child: ElevatedButton(
          onPressed: () {
            text == "Cancel" ? showAlertDialog(context) : onAccept();
          },
          style: ElevatedButton.styleFrom(
            primary: col1,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(_widthScale * 10.0),
              side: BorderSide(color: text6),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: _widthScale * 18, color: col2),
            ),
          )),
    );
  }
}
