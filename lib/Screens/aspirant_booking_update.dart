// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/second_tab_api.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_calendar.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';

class AspirantBookingUpdate extends StatefulWidget {
  var index;
  AspirantBookingUpdate({required this.index});
  // const AppointmentBooked({Key? key}) : super(key: key);

  @override
  _AspirantBookingUpdateState createState() => _AspirantBookingUpdateState();
}

class _AspirantBookingUpdateState extends State<AspirantBookingUpdate> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get2ndtabapi();
    onTap();
  }

  var tkn = datam.read('f');
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

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
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
      // backgroundColor: backgroundColor,
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
                    padding: EdgeInsets.all(40),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                var date = output['Date'].split('-');

                var mon = int.parse(date[1]);
                var getDate0 = date[2][0];
                var getDate1 = date[2][1];
                var getDate = getDate0 + getDate1;

                var finalDate =
                    getDate + " " + months[mon - 1] + ', ' + date[0];
                return output == null
                    ? Container(
                        height: _heightScale * 650,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                    : Column(
                        children: [
                          SizedBox(
                            height: _heightScale * 44,
                          ),
                          Image.asset("assets/Group 246 (1).png"),
                          SizedBox(
                            height: _heightScale * 32,
                          ),
                          Appointment("Booking id: ", output['orderId'], text9),
                          SizedBox(
                            height: _heightScale * 32,
                          ),
                          Appointment("Topic: ", output['topic'], text9),
                          // SizedBox(
                          //   height: _heightScale * 32,
                          // ),
                          // Appointment(
                          //     "Professional: ", "Manipreet Mittapelli", text9),
                          SizedBox(
                            height: _heightScale * 32,
                          ),

                          Appointment(
                              "Professional Name: ",
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
                              text9),
                          SizedBox(
                            height: _heightScale * 32,
                          ),
                          Row(
                            children: [
                              Appointment(
                                  "Status: ", output['status'], Colors.orange),
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
                                            finalDate,
                                            style: GoogleFonts.poppins(
                                              fontSize: _widthScale * 12,
                                              color: black(context),
                                              // fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          Text(
                                            "-  Booked",
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
                                          Text(
                                            finalDate,
                                            style: GoogleFonts.poppins(
                                              fontSize: _widthScale * 12,
                                              color: black(context),
                                              // fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          Text(
                                            " - Waiting for professional confimation ",
                                            // resout[widget.index]['Date']
                                            //     .toString()
                                            //     .replaceRange(10, 24, ""),
                                            style: GoogleFonts.poppins(
                                              fontSize: _widthScale * 10,
                                              color: black(context),
                                              // fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: _heightScale * 10,
                                      ),
                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: _widthScale * 10,
                                      //     ),
                                      //     // SizedBox(
                                      //     //   width: MediaQuery.of(context).size.width * 0.08,
                                      //     // ),
                                      //     Text(
                                      //       "Awating. professional Response... ",
                                      //       style: GoogleFonts.poppins(
                                      //         fontSize: _widthScale * 12,
                                      //         color: black(context),
                                      //         // fontWeight: FontWeight.w600
                                      //       ),
                                      //     ),
                                      //     Text(
                                      //       " - ${output['approvedbyaspirant']}",
                                      //       style: GoogleFonts.poppins(
                                      //           fontSize: _widthScale * 12,
                                      //           color: black(context)),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: _heightScale * 32,
                          ),
                          Appointment("Date: ", finalDate, text9),
                          SizedBox(
                            height: _heightScale * 32,
                          ),

                          SizedBox(
                            height: _heightScale * 23,
                          ),
                          // Row(
                          //   children: [
                          //     //spacehort,
                          //     Text(
                          //       "12:00-12:30",
                          //       style: GoogleFonts.poppins(
                          //           fontSize: _widthScale * 18, color: text9),
                          //     ),
                          //   ],
                          // ),
                          // spacevert2,

                          // spacevert1,
                          // Container(
                          //   //margin: EdgeInsets.only(left: 35, right: 35),
                          //   child: Text(
                          //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aenean pellentesque ut sem eu senectus porttitor. Sem nulla ornare nulla pellentesque lacus, nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aenean pellentesque ut sem eu senectus porttitor. Sem nulla ornare nulla pellentesque lacus, nunc. ",
                          //     style: GoogleFonts.poppins(
                          //         color: text11, fontSize: _widthScale * 14),
                          //   ),
                          // )
                        ],
                      );
              }),
        ),
      ),
    );
  }

  Widget Appointment(String heading, String data, Color col) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    print("TTTTT" "${data}");
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
