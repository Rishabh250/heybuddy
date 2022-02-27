// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';

class AspirantMeetingComplete extends StatefulWidget {
  // const AppointmentBooked({Key? key}) : super(key: key);

  @override
  _AspirantMeetingCompleteState createState() =>
      _AspirantMeetingCompleteState();
}

class _AspirantMeetingCompleteState extends State<AspirantMeetingComplete> {
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
    Widget spacevert2 = SizedBox(
      height: size.height * 0.06,
    );
    // Widget spacehort = SizedBox(
    //   width: size.width * 0.08,
    // );
    Widget spacehort2 = SizedBox(
      width: size.width * 0.1,
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
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 44,
              ),
              Image.asset("assets/Group 246 (2).png"),
              SizedBox(
                height: _heightScale * 32,
              ),
              Appointment("Booking id: ", "0321231", text9),
              SizedBox(
                height: _heightScale * 32,
              ),
              Appointment("Topic: ", "Interview process at Amazon", text9),
              SizedBox(
                height: _heightScale * 32,
              ),
              Appointment("Professional: ", "Manipreet Mittapelli", text9),
              SizedBox(
                height: _heightScale * 32,
              ),
              Appointment("Status: ", "Booked", Colors.green),
              SizedBox(
                height: _heightScale * 32,
              ),
              Appointment("Date: ", "17 November 2021", text9),
              SizedBox(
                height: _heightScale * 32,
              ),
              Row(
                children: [
                  // spacehort,
                  Text(
                    "Time Slot",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 16, color: text9),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 23,
              ),
              Row(
                children: [
                  //spacehort,
                  Text(
                    "12:00-12:30",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 18, color: text9),
                  ),
                ],
              ),
              spacevert2,
              Row(
                children: [
                  // spacehort,
                  Text(
                    "Professional's Comments",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              spacevert1,
              Container(
                //margin: EdgeInsets.only(left: 35, right: 35),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aenean pellentesque ut sem eu senectus porttitor. Sem nulla ornare nulla pellentesque lacus, nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aenean pellentesque ut sem eu senectus porttitor. Sem nulla ornare nulla pellentesque lacus, nunc. ",
                  style: GoogleFonts.poppins(
                      color: text11, fontSize: _widthScale * 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Appointment(String heading, String data, Color col) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;

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
