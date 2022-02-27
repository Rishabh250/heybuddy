// import 'dart:html';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/calendar.dart';
import 'package:heybuddy/Screens/proff_cancle_booking.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/professional_choice.dart';
import 'package:heybuddy/api/refund_api.dart';
import 'package:heybuddy/api/second_tab_api.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/unique_calendar.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:provider/provider.dart';

class ProfessionalAppointmentSchedule extends StatefulWidget {
  // const AppointmentBooked({Key? key}) : super(key: key);
  var index;
  ProfessionalAppointmentSchedule({required this.index});
  @override
  _ProfessionalAppointmentScheduleState createState() =>
      _ProfessionalAppointmentScheduleState();
}

class _ProfessionalAppointmentScheduleState
    extends State<ProfessionalAppointmentSchedule> {
  TextEditingController _cont = TextEditingController();
  var time;
  var pickedDate;
  var newDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
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

  var add = TimeOfDay.minutesPerHour / 2;
  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      fhour = time;
      fmin = time;
      // ffff1 = time.minute;
      final hours = time.hour;
      final minutes = time.minute;
      // final extratime = TimeOfDay(hour: hours, minute: minutes);
      if (minutes < 10) {
        print('1');
        return '$hours:${0}${minutes} - $hours:${minutes + 30}';
      } else if (hours < 10 && minutes >= 30) {
        print('22');
        return '${0}$hours:${minutes} -  ${0}${hours + 1}:${0}${minutes + 30 - 60} ';
      } else if (hours < 10) {
        print('2');
        return '${0}$hours:${minutes} - ${0}$hours:${minutes + 30} ';
      } else if (hours > 10 && minutes >= 40) {
        print('3');
        return '$hours:${minutes} - ${hours + 1}:${minutes + 30 - 60} ';
      } else if (hours > 10 && minutes >= 30) {
        print('3');
        return '$hours:${minutes} - ${hours + 1}:${0}${minutes + 30 - 60} ';
      } else if (hours > 10 && minutes < 30) {
        print('333');
        return '$hours:${minutes} - ${hours}:${minutes + 30} ';
      } else if (hours > 10) {
        print('32');
        return '$hours:${minutes} - ${hours + 1}:${00}${minutes + 30 - 60}';
      } else if (minutes > 10 && minutes < 30) {
        print('4');
        return '$hours:$minutes - $hours:${minutes + 30}';
      } else if (minutes >= 30) {
        print('15');
        return '$hours:$minutes - ${hours + 1}:${minutes + 30 - 60}';
      }
    }
    return "";
  }

  var fhour;
  var fmin;

  var todaytimehour = TimeOfDay.fromDateTime(DateTime.now());
  var todaytimemin = TimeOfDay.fromDateTime(DateTime.now());
  var exacttime = TimeOfDay.fromDateTime(DateTime.now());
  gg() {
    print(
        "latest dateeee${output['Date'].toString().replaceRange(10, 24, "").replaceRange(0, 9, "")}");
    print("latest day is is${DateTime.now().day.toString()}");
    print(
        "latest time hour is${todaytimehour.toString().toString().replaceRange(0, 10, "").replaceRange(2, 6, "")}");
    print(
        "latest choose hour${fhour.toString().replaceRange(0, 10, "").replaceRange(2, 6, "")}");
    print(
        "latest time min is${todaytimemin.toString().replaceRange(0, 13, "").replaceAll(")", "")}");
    print(
        "latest choose min${fmin.toString().replaceRange(0, 13, "").replaceAll(")", "")}");

    if (output['Date'].toString().replaceRange(10, 24, "") ==
        DateTime.now().toString().replaceRange(9, 25, "")) {
      if (int.parse(todaytimehour
              .toString()
              .toString()
              .replaceRange(0, 10, "")
              .replaceRange(2, 6, "")) <
          int.parse(fhour
              .toString()
              .replaceRange(0, 10, "")
              .replaceRange(2, 6, ""))) {
        print("latest you can move");
      }
    }
  }

  String getTexts() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time.hour;
      final minutes = time.minute;
      // final extratime = TimeOfDay(hour: hours, minute: minutes);
      if (minutes < 10 && hours < 10) {
        return '${0}$hours:${0}${minutes}';
      } else if (minutes < 10) {
        return '$hours:${0}${minutes}';
      } else if (hours < 10) {
        return '${0}$hours:${minutes}';
      } else if (hours >= 10) {
        return '$hours:${minutes}';
      } else if (minutes > 10 && minutes < 30) {
        return '$hours:$minutes'; //'$hours:$minutes';
      } else if (minutes > 30) {
        return '${hours + 1}:$minutes';
      }
    }
    return 'bb';
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

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    newDate = await showDatePicker(
      context: context,
      initialDate: pickedDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => pickedDate = newDate);
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

  submit() async {
    subout = await ProfessionalChoice.choice(
        output['orderId'], approve, _cont.text.trim(), getTexts(), tkn);
    print('subout is $subout');
    if (subout['status'] == "false") {
      const snackBar = SnackBar(
        content: Text("Choose Future Time"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("goins");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Nav1(
                    selectedIndex: 1,
                  )));
    }
  }

  onSchedulesend() async {
    print("time is${getTexts()}");

    if (time == null) {
      const snackBar = SnackBar(
        content: Text("Enter Time"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pop(context);
    }
    // else if (int.parse(output['Date']
    //         .toString()
    //         .replaceRange(10, 24, "")
    //         .replaceRange(0, 9, "")) ==
    //     DateTime.now().day.toInt()) {
    //   print("going 11");
    //   if (int.parse(todaytimehour
    //           .toString()
    //           .toString()
    //           .replaceRange(0, 10, "")
    //           .replaceRange(2, 6, "")) >
    //       int.parse(fhour
    //           .toString()
    //           .replaceRange(0, 10, "")
    //           .replaceRange(2, 6, ""))) {
    //     const snackBar = SnackBar(
    //       content: Text("Choose Future Time"),
    //       duration: Duration(milliseconds: 2000),
    //       backgroundColor: text6,
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   } else {
    //     setState(() {
    //       approve = 'yes';
    //     });
    //     submit();
    //     Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => Nav1(
    //                   selectedIndex: 1,
    //                 )));
    //     // Navigator.pop(context);
    //   }
    // } else if (int.parse(output['Date']
    //         .toString()
    //         .replaceRange(10, 24, "")
    //         .replaceRange(0, 9, "")) !=
    //     DateTime.now().day.toInt()) {
    //   print("going 22");
    //   if (int.parse(DateTime.now()
    //               .toString()
    //               .replaceRange(6, 25, "")
    //               .replaceRange(0, 5, "")) -
    //           int.parse(output['Date']
    //               .toString()
    //               .replaceRange(7, 24, "")
    //               .replaceRange(0, 5, "")) <=
    //       0) {
    //     if (int.parse(DateTime.now()
    //                 .toString()
    //                 .replaceRange(9, 25, "")
    //                 .replaceRange(0, 8, "")) -
    //             int.parse(output['Date']
    //                 .toString()
    //                 .replaceRange(10, 24, "")
    //                 .replaceRange(0, 8, "")) <=
    //         0) {
    //       setState(() {
    //         approve = 'yes';
    //       });
    //       submit();
    //       Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => Nav1(
    //                     selectedIndex: 1,
    //                   )));
    //     } else {
    //       const snackBar = SnackBar(
    //         content: Text("Event Expired"),
    //         duration: Duration(milliseconds: 2000),
    //         backgroundColor: text6,
    //       );
    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     }
    //   } else {
    //     const snackBar = SnackBar(
    //       content: Text("Event Expired !"),
    //       duration: Duration(milliseconds: 2000),
    //       backgroundColor: text6,
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   }

    // }
    else {
      setState(() {
        approve = 'yes';
      });
      submit();
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => Nav1(
      //               selectedIndex: 1,
      //             )));
      // Navigator.pop(context);
    }
  }

  onCanclesend() {
    //  else if (_cont.text.isNotEmpty) {
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
    // }
  }

  Future showAlertDialogss(BuildContext context) {
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
              "You are about to reject the session request  with Boooking Id ${output['orderId'].toString().replaceRange(0, 6, "")} for ${output["skill"]}" +
                  " You can’t undo this once you confirm to reject. .",
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
                                // onCancle();

                                onCanclesend();
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

  var output;
  onTap() async {
    output = await UniqueUserCalendar.uniqueUser(widget.index, tkn);
    return output;
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
            backgroundColor: backgroundColor,
            insetPadding: EdgeInsets.symmetric(horizontal: 30),
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_widthScale * 12),
            ),
            title: Text(
              "Reason for Cancelling",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 22, color: black(context)),
              ),
            ),
            actions: [
              Column(
                children: [
                  SizedBox(
                    height: _heightScale * 20,
                  ),
                  TextField(
                    autofocus: false,
                    maxLines: 8,
                    style: TextStyle(
                        fontSize: _widthScale * 15.0, color: black(context)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white(context).withOpacity(0.5),
                      hintText: 'typing',
                      hintStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: _widthScale * 16)),
                      contentPadding: EdgeInsets.only(
                          left: _widthScale * 14.0,
                          bottom: _heightScale * 8.0,
                          top: _heightScale * 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textFieldColor(context),
                        ),
                        borderRadius: BorderRadius.circular(_widthScale * 6),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: textFieldColor(context),
                        ),
                        borderRadius: BorderRadius.circular(_widthScale * 6),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // onCanclesend();
                        showAlertDialogss(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: text6,
                        shape: new RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(_widthScale * 10.0),
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: _widthScale * 18),
                        ),
                      )),
                  SizedBox(
                    height: _heightScale * 10,
                  ),
                ],
              ),
            ],
          );
        });
  }

  dfdf() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    // showM
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                // color: backgroundColor,
                height: _heightScale * 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: _heightScale * 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Reason for Cancelling",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 18,
                              color: text9,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _heightScale * 40,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: _widthScale * 20.0),
                      child: TextField(
                        controller: _cont,
                        autofocus: false,
                        maxLines: 8,
                        style: TextStyle(
                            fontSize: _widthScale * 15.0,
                            color: black(context)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white(context).withOpacity(0.5),
                          hintText: 'typing',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: _widthScale * 16)),
                          contentPadding: EdgeInsets.only(
                              left: _widthScale * 14.0,
                              bottom: _heightScale * 8.0,
                              top: _heightScale * 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: textFieldColor(context),
                            ),
                            borderRadius:
                                BorderRadius.circular(_widthScale * 6),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: textFieldColor(context),
                            ),
                            borderRadius:
                                BorderRadius.circular(_widthScale * 6),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _heightScale * 40,
                    ),
                    Container(
                      height: _heightScale * 56,
                      width: _widthScale * 200,
                      child: ElevatedButton(
                          onPressed: () {
                            // onCanclesend();
                            if (_cont.text.isEmpty) {
                              const snackBar = SnackBar(
                                content: Text("Enter Reason for cancelling"),
                                duration: Duration(milliseconds: 2000),
                                backgroundColor: text6,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.pop(context);
                            } else if (_cont.text.isNotEmpty) {
                              showAlertDialogss(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: text6,
                            shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.circular(_widthScale * 10.0),
                            ),
                          ),
                          child: Text(
                            'Send',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: _widthScale * 18),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: _heightScale * 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
    Widget spacehort = SizedBox(
      width: size.width * 0.07,
    );
    Widget spacehort1 = SizedBox(
      width: size.width * 0.05,
    );
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FutureBuilder(
              future: onTap(),
              builder: (context, snapShot) {
                return Column(
                  children: [
                    output == null
                        ? Container(
                            height: _heightScale * 650,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ))
                        : Container(
                            height: size.height * 0.8,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: _heightScale * 44,
                                  ),
                                  Image.asset("assets/Group 246 (1).png"),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  Appointment(
                                      "Booking id:  ",
                                      output['orderId'] == ""
                                          ? ""
                                          : output['orderId']
                                              .toString()
                                              .replaceRange(0, 6, ""),
                                      text9),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  Appointment(
                                      "Topic: ",
                                      output['topic'] == ""
                                          ? ""
                                          : output['topic'],
                                      text9),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  Appointment(
                                      "Name: ",
                                      output['professionalname'] != null
                                          ? getCapitalizeStringaa(
                                              output['aspirantname'])
                                          : "No Detail",
                                      text9),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  // Appointment("Professional: ",
                                  //     "Manipreet Mittapelli", text9),
                                  // SizedBox(
                                  //   height: _heightScale * 32,
                                  // ),
                                  Appointment("Status: ", "Action Required",
                                      Colors.red),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  Appointment(
                                      "Date:  ",
                                      output['Date'] == ""
                                          ? ""
                                          : output['Date']
                                              .toString()
                                              .replaceRange(10, 24, ""),
                                      text9),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  Appointment(
                                      "Amount:  ",
                                      output['amount'] == ""
                                          ? ""
                                          : 'Rs ${output['amount'].toString()} /-',
                                      text9),
                                  SizedBox(
                                    height: _heightScale * 40,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     //  spacehort,
                                  //     Text(
                                  //       "Select Date",
                                  //       style: GoogleFonts.poppins(
                                  //           fontSize: _widthScale * 16,
                                  //           color: text9,
                                  //           fontWeight: FontWeight.w600),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: _heightScale * 32,
                                  // ),
                                  // Container(
                                  //   //margin: EdgeInsets.only(left: 20, right: 20),
                                  //   height: _heightScale * 56,
                                  //   width: double.maxFinite,
                                  //   decoration: BoxDecoration(
                                  //     color: white.withOpacity(0.5),
                                  //     borderRadius: BorderRadius.all(
                                  //         Radius.circular(_widthScale * 6)),
                                  //   ),
                                  //   child: ListTile(
                                  //     title: Text(
                                  //       getText(),
                                  //       style: GoogleFonts.poppins(
                                  //           fontSize: _widthScale * 16),
                                  //     ),
                                  //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                                  //     trailing: InkWell(
                                  //         onTap: () => pickDate(context),
                                  //         child: Image.asset(
                                  //             "assets/Group 804.png")),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: _heightScale * 40,
                                  // ),
                                  Row(
                                    children: [
                                      //  spacehort,
                                      Text(
                                        "Select Time Slot",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 16,
                                            color: text9,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _heightScale * 32,
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(left:_widthScale* 16, right:_widthScale* 15),
                                    height: _heightScale * 56,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: white(context).withOpacity(0.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(_widthScale * 20)),
                                    ),
                                    child: ListTile(
                                      title: Text(getText()),
                                      trailing: InkWell(
                                          onTap: () => pickTime(context),
                                          child:
                                              Image.asset("assets/Group.png")),

                                      // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: _heightScale * 25,
                                  ),
                                  // ElevatedButton(
                                  //     onPressed: () {
                                  //       gg();
                                  //     },
                                  //     child: Text("dummy")),
                                ],
                              ),
                            ),
                          ),
                    Row(
                      children: [
                        // spacehort,
                        button("Cancel", white(context), text6),
                        SizedBox(
                          width: _widthScale * 20,
                        ),
                        button("Schedule", text6, white(context)),
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

  Widget button(String text, Color col1, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      width: _widthScale * 145,
      height: _heightScale * 56,
      child: ElevatedButton(
          onPressed: () async {
            text == "Cancel"
                ? await dfdf() // showAlertDialog(context)
                // ? Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ProfessionalCancleBooking()))
                : await onSchedulesend();
            // : Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => ProfessionalCancleBooking()));
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

  Widget buttonw(String text, Color col1, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

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
          padding: EdgeInsets.only(
              left: _widthScale * 40.0,
              right: _widthScale * 40,
              top: _heightScale * 15,
              bottom: _heightScale * 15),
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
}
