// import 'dart:html';

// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';

class ProfessionalAppointmentSubmit extends StatefulWidget {
  // const AppointmentBooked({Key? key}) : super(key: key);

  @override
  _ProfessionalAppointmentSubmitState createState() =>
      _ProfessionalAppointmentSubmitState();
}

class _ProfessionalAppointmentSubmitState
    extends State<ProfessionalAppointmentSubmit> {
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
  Widget build(BuildContext context) {
    var word = Provider.of<Favourite>(context).fav;
    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );

    Widget spacevert1 = SizedBox(
      height: size.height * 0.03,
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
          style: GoogleFonts.poppins(color: whiteBox(context), fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.9),
          child: Column(
            children: [
              Container(
                height: size.height * 0.8,
                child: Column(
                  children: [
                    spacevert,
                    Appointment(
                        "Topic: ", "Interview process at Amazon", text9),
                    spacevert1,
                    Appointment(
                        "Professional: ", "Manipreet Mittapelli", text9),
                    spacevert1,
                    Appointment("Status: ", "Action Required", Colors.red),
                    spacevert1,
                    Appointment("Date: ", "17 November 2021", text9),
                    spacevert,
                    Row(
                      children: [
                        Text(
                          "Select Time Slot",
                          style:
                              GoogleFonts.poppins(fontSize: 16, color: text9),
                        ),
                      ],
                    ),
                    spacevert,
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 15),
                      height: 56,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: white(context),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ListTile(
                        title: Text(getText()),
                        trailing: InkWell(
                            onTap: () => pickTime(context),
                            child: Icon(
                              Icons.lock_clock_sharp,
                            )),

                        // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  button("Submit", text6, white(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonw(String text, Color col1, Color col2) {
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
              textStyle: TextStyle(fontSize: 18, color: col2),
            ),
          ),
        ));
  }

  Widget Appointment(String heading, String data, Color col) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.08,
        ),
        Text(
          heading,
          style: GoogleFonts.poppins(
              fontSize: 16, color: black(context), fontWeight: FontWeight.w700),
        ),
        Text(
          data,
          style: GoogleFonts.poppins(fontSize: 16, color: col),
        ),
      ],
    );
  }
}

Widget button(String text, Color col1, Color col2) {
  return Column(
    children: [
      Container(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: col1,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: text6),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 18, color: col2),
              ),
            )),
      ),
    ],
  );
}
