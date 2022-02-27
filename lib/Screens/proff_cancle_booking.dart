// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';

class ProfessionalCancleBooking extends StatefulWidget {
  // const AppointmentBooked({Key? key}) : super(key: key);

  @override
  _ProfessionalCancleBookingState createState() =>
      _ProfessionalCancleBookingState();
}

class _ProfessionalCancleBookingState extends State<ProfessionalCancleBooking> {
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
      backgroundColor: backgroundColor,
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
              Container(
                height: size.height * 0.74,
                child: Column(
                  children: [
                    SizedBox(
                      height: _heightScale * 44,
                    ),
                    Image.asset("assets/Group 246 (1).png"),
                    SizedBox(
                      height: _heightScale * 32,
                    ),
                    Appointment("Booking id: ", "0321231", text9),
                    SizedBox(
                      height: _heightScale * 32,
                    ),
                    Appointment(
                        "Topic: ", "Interview process at Amazon", text9),
                    SizedBox(
                      height: _heightScale * 32,
                    ),
                    Appointment(
                        "Professional: ", "Manipreet Mittapelli", text9),
                    SizedBox(
                      height: _heightScale * 32,
                    ),
                    Appointment("Status: ", "Cancelled", Colors.red),
                    SizedBox(
                      height: _heightScale * 32,
                    ),
                    Appointment("Date: ", "17 November 2021", text9),
                    SizedBox(
                      height: _heightScale * 32,
                    ),
                    Row(
                      children: [
                        Text(
                          "Reason for Cancelling",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 16,
                              color: text9,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _heightScale * 20,
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
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
                  ],
                ),
              ),
              spacevert,
              Container(
                width: double.infinity,
                height: _widthScale * 56,
                child: ElevatedButton(
                    onPressed: () {},
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
            ],
          ),
        ),
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
