// import 'dart:html';

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/second_tab_api.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_calendar.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/comment/comment_for_asp.dart';
import '../widgets/custom_bar.dart';

class AspirantAppointmentBooked extends StatefulWidget {
  var index;
  var getId;
  AspirantAppointmentBooked({required this.index, required this.getId});
  // const AppointmentBooked({Key? key}) : super(key: key);
  @override
  _AspirantAppointmentBookedState createState() =>
      _AspirantAppointmentBookedState();
}

TextEditingController _comment = TextEditingController();
String noon = '';

class _AspirantAppointmentBookedState extends State<AspirantAppointmentBooked> {
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
  bool openLink = false;
  var _color = Colors.grey;
  var finalTime;
  var finalDate;
  var day;
  var month;
  var year;
  var link;
  var getMin;
  var getHour;
  @override
  void initState() {
    _openLink();
    super.initState();
    onTap();
    getDataProfile();
  }

  _openLink() {
    DateTime now = DateTime.now();
    var minget = (DateTime.now().minute + 5).toString();
    if (minget == "60") {
      minget = "00";
    }
    var hourget = now.hour;
    var linkTime;
    if (day.toString()[0].contains("0")) {
      day = day.toString()[1];
    }

    linkTime = hourget.toString() + ":" + minget.toString();
    print("RRRRRRRR" + linkTime.toString());
    print("RRRRRRRR" + meetTime.toString());

    if (meetTime.toString() == linkTime.toString()) {
      print("RRRRRRRR");
      openLink = true;
    }
    if (openLink == true) {
      _color = Colors.blue;
    }
  }

  bool isLoading = false;

  var tkn = datam.read('f');
  var responseid;
  getDataProfile() async {
    responseid = await getdata(tkn); //61eff7e265af2b2bef40cde8
    print("//////$responseid");

    return responseid;
  }

  // var valout;
  // List resout = [];
  // get2ndtabapi() async {
  //   valout = await secondTabPayment(tkn);
  //   resout = valout;
  //   return resout;
  // }
  var output;
  onTap() async {
    output = await UniqueUserCalendar.uniqueUser(widget.index, tkn);
    return output;
  }

  var time;
  var meetTime;

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

    Widget spacehort2 = SizedBox(
      width: size.width * 0.1,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.03,
    );
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: white(context).withOpacity(0.6),
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
          "Session Details",
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
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                var time = output['meetingTime'];
                meetTime = output['meetingTime'];
                link = output['meetingURL'];

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
                if (int.parse(time[0]) > 12) {
                  noon = "PM";

                  if (int.parse(time[0]) == 12) {
                    noon = "PM";
                  }
                }
                if (int.parse(time[0]) < 12) {
                  noon = "AM";
                } else {
                  noon = "PM";
                }
                getMin = int.parse(time[1]);
                getHour = int.parse(hours.toString());
                var date2 = output['professionalResponseDate'].split('-');

                finalTime = hours.toString() + ":" + time[1] + " " + noon;

                var date = output['Date'].split('-');
                var mon = int.parse(date[1]);
                var getDate0 = date[2][0];
                var getDate1 = date[2][1];
                var getDate = getDate0 + getDate1;

                day = getDate;
                year = date[0];

                var mon2 = int.parse(date[1]);
                var getDate02 = date[2][0];
                var getDate12 = date[2][1];
                var getDate2 = getDate02 + getDate12;

                var finalDate2 =
                    getDate2 + " " + months[mon - 1] + ', ' + date2[0];
                var bookedDate = output['txndate'].split('-');

                var mon21 = int.parse(date[1]);
                var getDate021 = bookedDate[2][0];
                var getDate121 = bookedDate[2][1];
                var getDate21 = getDate02 + getDate12;
                var finalDate21 =
                    getDate2 + " " + months[mon2 - 1] + ', ' + bookedDate[0];

                finalDate = getDate + " " + months[mon - 1] + ', ' + date[0];
                _openLink();

                return output == null
                    ? Container(
                        height: _heightScale * 650,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                    : Column(
                        children: [
                          // Container(
                          //   height: size.height * 0.74,
                          // child:
                          Column(
                            children: [
                              SizedBox(
                                height: _heightScale * 44,
                              ),
                              Image.asset("assets/Group 246.png"),
                              SizedBox(
                                height: _heightScale * 32,
                              ),
                              Appointment(
                                  "Booking id: ", output['orderId'], text9),
                              SizedBox(
                                height: _heightScale * 32,
                              ),
                              Appointment("Topic: ", output['topic'], text9),
                              SizedBox(
                                height: _heightScale * 32,
                              ),
                              FutureBuilder(
                                  future: getDataProfile(),
                                  builder: (context, snapShot) {
                                    return Appointment(
                                        "Professional Name: ",
                                        // output["Aspirant"] == responseid['_id']
                                        //     ?
                                        output['isAspirantAnonymous'] == "true"
                                            ? "Anonymous"
                                            : output['professionalname'] != null
                                                ? getCapitalizeStringaa(
                                                    output['professionalname'])
                                                : "No Detail",
                                        // : output['professionalname'] != null
                                        //     ? getCapitalizeStringaa(
                                        //         output['aspirantname'])
                                        //     : "No Detail",
                                        text9);
                                  }),
                              SizedBox(
                                height: _heightScale * 32,
                              ),
                              Row(
                                children: [
                                  Appointment("Status: ", output['status'],
                                      Colors.green),
                                  SizedBox(
                                    width: _widthScale * 151,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isLoading = !isLoading;
                                        });
                                      },
                                      child: Icon(isLoading
                                          ? Icons.arrow_drop_down_sharp
                                          : Icons.arrow_drop_up))
                                ],
                              ),
                              SizedBox(
                                height: _heightScale * 5,
                              ),
                              isLoading
                                  ? Container(
                                      width: double.infinity,
                                      height: _heightScale * 100,
                                      color: white(context).withOpacity(0.7),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: _heightScale * 10,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: _widthScale * 10,
                                              ),
                                              // SizedBox(
                                              //   width: MediaQuery.of(context).size.width * 0.08,
                                              // ),
                                              Text(
                                                finalDate21,
                                                style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 12,
                                                  color: black(context),
                                                  // fontWeight: FontWeight.w600
                                                ),
                                              ),
                                              Text(
                                                " : Booked",
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 12,
                                                    color: black(context)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: _heightScale * 10,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: _widthScale * 10,
                                              ),
                                              // SizedBox(
                                              //   width: MediaQuery.of(context).size.width * 0.08,
                                              // ),
                                              Text(
                                                finalDate,
                                                style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 12,
                                                  color: black(context),
                                                  // fontWeight: FontWeight.w600
                                                ),
                                              ),
                                              Text(
                                                " : Confirmed",
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 12,
                                                    color: black(context)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: _heightScale * 15,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: _widthScale * 10,
                                              ),
                                              // SizedBox(
                                              //   width: MediaQuery.of(context).size.width * 0.08,
                                              // ),
                                              Row(
                                                children: [
                                                  Text(
                                                    finalDate2,
                                                    style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 12,
                                                      color: black(context),
                                                      // fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  Text(
                                                    "Professional Response : ",
                                                    // resout[widget.index]['Date']
                                                    //     .toString()
                                                    //     .replaceRange(10, 24, ""),
                                                    style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 12,
                                                      color: black(context),
                                                      // fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  Text(
                                                    output['approvedbyprofessional']
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 12,
                                                        color: black(context)),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                output['approvedbyprofessional']
                                                    .toString()
                                                    .toUpperCase(),
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 12,
                                                    color: black(context)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: _heightScale * 10,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),

                              SizedBox(
                                height: _heightScale * 32,
                              ),
                              Appointment("Date: ", finalDate, text9),
                              SizedBox(
                                height: _heightScale * 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Time Slot : ",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: _widthScale * 16,
                                        color: text9),
                                  ),
                                  Appointment(
                                      "",
                                      output['meetingTime'] == ""
                                          ? ""
                                          : finalTime,
                                      // .toString(),
                                      // .replaceRange(10, 24, ""),
                                      text9),
                                ],
                              ),
                              // spacevert,
                              SizedBox(
                                height: _heightScale * 30,
                              ),
                            ],
                          ),
                          // ),
                          SizedBox(
                            height: _heightScale * 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "The link has been sent to your gmail and calender",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _heightScale * 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Kindly join it",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _heightScale * 20,
                          ),
                        ],
                      );
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: FutureBuilder(
            future: onTap(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }
              var time = output['meetingTime'];
              var getMeet = time.toString().split(':');
              var meetHour = getMeet[0];

              var date = output['Date'].split('-');

              var mon = int.parse(date[1]);
              var getDate0 = date[2][0];
              var getDate1 = date[2][1];
              var getDate = getDate0 + getDate1;

              if (int.parse(getDate) == DateTime.now().day &&
                  DateTime.now().hour == int.parse(meetHour)) {
                print("RERTVXLSCKLSNCKS");
                openLink = true;
                _color = Colors.blue;
              }

              return Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      {
                        if (openLink == true) {
                          launch(link.toString());
                        } else {
                          return null;
                        }
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: openLink == true ? Colors.blue : Colors.grey,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: Text("Join Meeting",
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        )),
                  ));
            }),
      ),
    );
  }

  Widget Appointment(String heading, String data, Color col) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Row(
      children: [
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
}
