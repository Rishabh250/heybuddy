// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/comment/comment_for_asp.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_calendar.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfessionalAppointmentCompleted extends StatefulWidget {
  var index;
  var getId;
  ProfessionalAppointmentCompleted({required this.index, required this.getId});
  // const AppointmentBooked({Key? key}) : super(key: key);

  @override
  _ProfessionalAppointmentCompletedState createState() =>
      _ProfessionalAppointmentCompletedState();
}

class _ProfessionalAppointmentCompletedState
    extends State<ProfessionalAppointmentCompleted> {
  TextEditingController _comment = TextEditingController();
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
    super.initState();
    getDataProfile();
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

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  var noon;
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

                  var prodate2 = output['professionalResponseDate'].split('-');
                  var promon2 = int.parse(prodate2[1]);
                  var prodate = prodate2[2][0];
                  var progetDate12 = prodate2[2][1];
                  var progetDate2 = prodate + progetDate12;

                  var proFinalDate = progetDate2 +
                      " " +
                      months[promon2 - 1] +
                      ', ' +
                      prodate2[0];
                  finalTime = hours.toString() + ":" + time[1] + " " + noon;

                  var date = output['Date'].split('-');
                  var mon = int.parse(date[1]);
                  var getDate0 = date[2][0];
                  var getDate1 = date[2][1];
                  var getDate = getDate0 + getDate1;

                  day = getDate;
                  year = date[0];

                  finalDate = getDate + " " + months[mon - 1] + ', ' + date[0];

                  var bookedDate = output['txndate'].split('-');

                  var mon2 = int.parse(bookedDate[1]);
                  var getDate02 = bookedDate[2][0];
                  var getDate12 = bookedDate[2][1];
                  var getDate2 = getDate02 + getDate12;
                  var finalDate2 =
                      getDate2 + " " + months[mon2 - 1] + ', ' + bookedDate[0];

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
                                Image.asset("assets/Group 246 (2).png"),
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
                                          "Aspirant Name: ",
                                          // output["Aspirant"] == responseid['_id']
                                          //     ?
                                          output['isAspirantAnonymous'] !=
                                                  "true"
                                              ? getCapitalizeStringaa(
                                                  output['aspirantname'])
                                              : "Anonymous",
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
                                                  finalDate2,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 12,
                                                    color: black(context),
                                                    // fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                                Text(
                                                  " :  Booking",
                                                  style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 12,
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
                                                  proFinalDate,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 12,
                                                    color: black(context),
                                                    // fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                                Text(
                                                  " :  Aspirant Response : Yes",
                                                  style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 12,
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
                                                  " :  Completed",
                                                  style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 12,
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
                          ],
                        );
                }),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FutureBuilder(
          future: getDataProfile(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }
            print(output['commentforaspirant']);
            return output['commentforaspirant'] == ""
                ? InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (builder) {
                            return AlertDialog(
                              content: Container(
                                height: 400,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: _comment,
                                        textAlign: TextAlign.left,
                                        maxLines: 15,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          hintText: 'Notes for Aspirant',
                                          hintStyle: TextStyle(fontSize: 16),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              width: 1,
                                            ),
                                          ),
                                          filled: true,
                                          contentPadding: EdgeInsets.all(16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (_comment.text.isEmpty) {
                                            const snackBar = SnackBar(
                                              content:
                                                  Text("Notes can't be empty"),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor: text6,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          } else {
                                            sendNotes(widget.getId,
                                                _comment.text.toString());
                                            _comment.clear();
                                            Get.offAll(
                                                () => Nav1(selectedIndex: 1));
                                            const snackBar = SnackBar(
                                              content:
                                                  Text("Notes has seen sent"),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor: text6,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.blue,
                                            ),
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            child: Center(
                                              child: Text("Send Notes",
                                                  style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 16,
                                                      color: black(context),
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text("Write Notes for Aspriant",
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 16,
                                  color: black(context),
                                  fontWeight: FontWeight.w600)),
                        )),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 130, 147, 161),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: Text("Aspirant has recevied your notes",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 16,
                              color: black(context),
                              fontWeight: FontWeight.w600)),
                    ));
          }),
        ));
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
