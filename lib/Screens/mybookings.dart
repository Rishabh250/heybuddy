// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heybuddy/Screens/welcome.dart';
// import 'package:heybuddy/api/mybookings.dart';
// import 'package:heybuddy/api/signup_api.dart';
// import 'package:heybuddy/color&font/colors.dart';
// import 'package:provider/provider.dart';
// class MyBookings extends StatefulWidget {
//   // const AppointmentBooked({Key? key}) : super(key: key);
//   @override
//   _MyBookingsState createState() => _MyBookingsState();
// }
// class _MyBookingsState extends State<MyBookings> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//   var tkn = datam.read('f');
//   var response;
//   List res = [];
//   getData() async {
//     response = await mybookings(tkn);
//     res = response;
//     return res;
//   }
//   @override
//   Widget build(BuildContext context) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     var word = Provider.of<Favourite>(context).fav;
//     var size = MediaQuery.of(context).size;
//     Widget spacevert = SizedBox(
//       height: size.height * 0.04,
//     );
//     Widget spacehort = SizedBox(
//       width: size.width * 0.08,
//     );
//     Widget spacehort2 = SizedBox(
//       width: size.width * 0.1,
//     );
//     Widget spacevert1 = SizedBox(
//       height: size.height * 0.015,
//     );
//     return Scaffold(
//       // backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: white, //backgroundColor,
//         elevation: 0,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: text9,
//           ),
//         ),
//         title: Text(
//           "My Bookings",
//           style: GoogleFonts.poppins(
//               color: whitebox( context),
//               fontSize: _widthScale * 18,
//               fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
//           child: FutureBuilder(
//               future: getData(),
//               builder: (context, snapShot) {
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: _heightScale * 28,
//                     ),
//                     response == null
//                         ? Container(
//                             height: _heightScale * 600,
//                             width: double.infinity,
//                             child: Center(
//                               child: CircularProgressIndicator(),
//                             ))
//                         : res.isEmpty
//                             ? Container(
//                                 height: _heightScale * 550,
//                                 width: double.infinity,
//                                 child: Center(
//                                   child: Text("No Bookings till Now!"),
//                                 ),
//                               )
//                             : Container(
//                                 height: _heightScale * 700,
//                                 width: double.infinity,
//                                 child: ListView.builder(
//                                   itemCount: res.isEmpty ? 0 : res.length,
//                                   itemBuilder: (context, index) {
//                                     return details(
//                                       res[index]['_id'],
//                                       // res[index]['topic'],
//                                       res[index]['Date']
//                                           .toString()
//                                           .replaceRange(10, 24, ""),
//                                       res[index]['topic'],
//                                     );
//                                   },
//                                 ),
//                               ),
//                     // Row(
//                     //   children: [
//                     //     //spacehort2,
//                     //     Text(
//                     //       "November",
//                     //       style: GoogleFonts.poppins(
//                     //           fontSize: _widthScale * 18,
//                     //           fontWeight: FontWeight.w500,
//                     //           color: text6),
//                     //     ),
//                     //   ],
//                     // ),
//                     // SizedBox(
//                     //   height: _heightScale * 9.53,
//                     // ),
//                     // Container(
//                     //   width: MediaQuery.of(context).size.width * 0.9,
//                     //   height: _heightScale * 1,
//                     //   color: text13,
//                     // ),
//                     // SizedBox(
//                     //   height: _heightScale * 16.47,
//                     // ),
//                     // Appointment("Booking Id: ", 12, "0321231", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Date: ", 12, "17 November 2021", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Aspirant: ", 12, "Manipreet Mitapelli", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment(
//                     //     "Topic: ", 12, "Interview Process at Amazon", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 32,
//                     // ),
//                     // Appointment("Booking Id: ", 14, "0321231", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Date: ", 12, "17 November 2021", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Aspirant: ", 12, "Manipreet Mitapelli", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment(
//                     //     "Topic: ", 12, "Interview Process at Amazon", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 32,
//                     // ),
//                     Container(
//                       width: double.infinity,
//                       height: _heightScale * 20,
//                       color: backgroundColor,
//                     ),
//                     SizedBox(
//                       height: _heightScale * 40,
//                     ),
//                     // Row(
//                     //   children: [
//                     //     //spacehort2,
//                     //     Text(
//                     //       "October",
//                     //       style: GoogleFonts.poppins(
//                     //           fontSize: _widthScale * 18,
//                     //           fontWeight: FontWeight.w500,
//                     //           color: text6),
//                     //     ),
//                     //   ],
//                     // ),
//                     // SizedBox(
//                     //   height: _heightScale * 9.53,
//                     // ),
//                     // Container(
//                     //   width: MediaQuery.of(context).size.width * 0.9,
//                     //   height: _heightScale * 1,
//                     //   color: text13,
//                     // ),
//                     // SizedBox(
//                     //   height: _heightScale * 16.47,
//                     // ),
//                     // Appointment("Booking Id: ", 14, "0321231", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Date: ", 12, "17 November 2021", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Aspirant: ", 12, "Manipreet Mitapelli", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment(
//                     //     "Topic: ", 12, "Interview Process at Amazon", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 32,
//                     // ),
//                     // Appointment("Booking Id: ", 14, "0321231", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Date: ", 12, "17 November 2021", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment("Aspirant: ", 12, "Manipreet Mitapelli", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Appointment(
//                     //     "Topic: ", 12, "Interview Process at Amazon", black(context)),
//                     // SizedBox(
//                     //   height: _heightScale * 16,
//                     // ),
//                     // Container(
//                     //   width: MediaQuery.of(context).size.width * 1,
//                     //   height: _heightScale * 30,
//                     //   color: backgroundColor,
//                     // ),
//                     // spacevert,
//                   ],
//                 );
//               }),
//         ),
//       ),
//     );
//   }
//   Widget Appointment(String heading, double size, String data, Color col) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     return Row(
//       children: [
//         // SizedBox(
//         //   width: MediaQuery.of(context).size.width * 0.1,
//         // ),
//         Text(
//           heading,
//           style: GoogleFonts.poppins(
//               fontSize: _widthScale * size,
//               color: black(context),
//               fontWeight: FontWeight.w600),
//         ),
//         Text(
//           data,
//           style: GoogleFonts.poppins(fontSize: _widthScale * size, color: col),
//         ),
//       ],
//     );
//   }
//   Widget details(String data, String title, String topic) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               "Booking Id :  ",
//               style: GoogleFonts.poppins(
//                   color: black(context),
//                   fontSize: _widthScale * 14,
//                   fontWeight: FontWeight.w500),
//             ),
//             Text(
//               data,
//               style: GoogleFonts.poppins(
//                 color: text11,
//                 fontSize: _widthScale * 14,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: _heightScale * 8,
//         ),
//         // Row(
//         //   children: [
//         //     Text(
//         //       "Topic is :  ",
//         //       style: GoogleFonts.poppins(
//         //           color: black(context),
//         //           fontSize: _widthScale * 14,
//         //           fontWeight: FontWeight.w500),
//         //     ),
//         //     Text(
//         //       topic,
//         //       style: GoogleFonts.poppins(
//         //         color: text11,
//         //         fontSize: _widthScale * 14,
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         // SizedBox(
//         //   height: _heightScale * 8,
//         // ),
//         Row(
//           children: [
//             // SizedBox(
//             //   width: MediaQuery.of(context).size.width * 0.07,
//             // ),
//             Text(
//               "Date : ",
//               style: GoogleFonts.poppins(
//                   color: black(context),
//                   fontSize: _widthScale * 14,
//                   fontWeight: FontWeight.w500),
//             ),
//             Text(
//               title,
//               style: GoogleFonts.poppins(
//                 color: text11,
//                 fontSize: _widthScale * 14,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: _heightScale * 8,
//         ),
//         Row(
//           children: [
//             // SizedBox(
//             //   width: MediaQuery.of(context).size.width * 0.07,
//             // ),
//             Text(
//               "Topic : ",
//               style: GoogleFonts.poppins(
//                   color: black(context),
//                   fontSize: _widthScale * 14,
//                   fontWeight: FontWeight.w500),
//             ),
//             Text(
//               topic,
//               style: GoogleFonts.poppins(
//                   color: text11,
//                   fontSize: _widthScale * 14,
//                   fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               width: _widthScale * 100,
//             ),
//             // Image.asset(
//             //   img,
//             //   height: _heightScale * 25,
//             //   width: _widthScale * 25,
//             // ),
//           ],
//         ),
//         SizedBox(
//           height: _heightScale * 32,
//         ),
//         Container(
//           width: double.infinity,
//           height: _heightScale * 8,
//           color: backgroundColor,
//         ),
//         SizedBox(
//           height: _heightScale * 20,
//         ),
//       ],
//     );
//   }
// }
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/mybookings.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';

class MyBookings extends StatefulWidget {
  // const AppointmentBooked({Key? key}) : super(key: key);

  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var tkn = datam.read('f');
  var response;
  var res;
  // List res = [];
  getData() async {
    res = await mybookings(tkn);
    // res = response;
    return res;
  }

  var month;

  bbb(index) {
    if (index == 11) {
      month = "January";
      // isExpand = isExpand11;
      // return month;
    } else if (index == 10) {
      month = "February";
      // isExpand = isExpand10;
      // return month;
    } else if (index == 9) {
      month = "March";
      // isExpand = isExpand9;
      // return month;
    } else if (index == 8) {
      month = "April";
      // isExpand = isExpand8;
      // return month;
    } else if (index == 7) {
      month = "May";
      // isExpand = isExpand7;
      // return month;
    } else if (index == 6) {
      month = "June";
      // isExpand = isExpand6;
      // return month;
    } else if (index == 5) {
      month = "July";
      // isExpand = isExpand5;
      // return month;
    } else if (index == 4) {
      month = "August";
      // isExpand = isExpand4;
      // return month;
    } else if (index == 3) {
      month = "September";
      // isExpand = isExpand3;
      // return month;
    } else if (index == 2) {
      month = "October";
      // isExpand = isExpand2;
      // return month;
    } else if (index == 1) {
      month = "November";
      // isExpand = isExpand1;
      // return month;
    } else if (index == 0) {
      month = "December";
      // isExpand = isExpand0;
      // return month;
    }
  }

  bool isExpand = false;
  bool isExpand0 = false;
  bool isExpand1 = false;
  bool isExpand2 = false;
  bool isExpand3 = false;
  bool isExpand4 = false;
  bool isExpand5 = false;
  bool isExpand6 = false;
  bool isExpand7 = false;
  bool isExpand8 = false;
  bool isExpand9 = false;
  bool isExpand10 = false;
  bool isExpand11 = false;
  // vvv(val) {
  //   setState(() {
  //     val = !val;
  //   });
  // }
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
      width: size.width * 0.08,
    );
    Widget spacehort2 = SizedBox(
      width: size.width * 0.1,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.015,
    );
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: white(context), //backgroundColor,
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
          "My Bookings",
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
              future: getData(),
              builder: (context, snapShot) {
                return res == null
                    ? Container(
                        height: _heightScale * 600,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                    : res['data'].isEmpty
                        ? Container(
                            height: _heightScale * 550,
                            width: double.infinity,
                            child: Center(
                              child: Text("No Bookings till Now!"),
                            ),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: _heightScale * 28,
                              ),
                              Container(
                                // height: _heightScale * 100,
                                width: _widthScale * 374,
                                child:
                                    // ListView.builder(
                                    //     itemCount: res.isEmpty ? 0 : res.length,
                                    //     itemBuilder: (BuildContext ctx, index) {
                                    //       bbb(index);
                                    //       return
                                    Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isExpand0 = !isExpand0;
                                        });
                                        // vvv(val);
                                      },
                                      child: Row(
                                        children: [
                                          //spacehort2,
                                          Expanded(
                                            child: Text(
                                              // month != null ? month :
                                              "January, " +
                                                  res['year'].toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: text6),
                                            ),
                                          ),
                                          Icon(
                                            isExpand0 == true
                                                ? Icons.arrow_drop_down_outlined
                                                : Icons.arrow_drop_up_outlined,
                                            color: text6,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: _heightScale * 9.53,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: _heightScale * 1,
                                      color: text13,
                                    ),
                                    SizedBox(
                                      height: _heightScale * 16.47,
                                    ),
                                    isExpand0 == false
                                        ? Container()
                                        : res['data'][11].isEmpty
                                            ? Container(
                                                height: _heightScale * 80,
                                                width: double.infinity,
                                                child: Center(
                                                  child:
                                                      Text("Nothing to show !"),
                                                ))
                                            : Column(
                                                children: [
                                                  ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemCount: res['data'][11]
                                                          .length,
                                                      itemBuilder:
                                                          (context, index1) {
                                                        return Appointments(
                                                          res['data'][11]
                                                              [index1]['_id'],
                                                          res['data'][11][index1]
                                                                      [
                                                                      'professionalname'] !=
                                                                  null
                                                              ? getCapitalizeStringaa(res[
                                                                          'data']
                                                                      [
                                                                      11][index1]
                                                                  [
                                                                  'professionalname'])
                                                              : "No Name",
                                                          res['data'][11]
                                                                      [index1]
                                                                  ['Date']
                                                              .toString()
                                                              .replaceRange(
                                                                  10, 24, ""),
                                                          res['data'][11]
                                                              [index1]['topic'],
                                                        );
                                                      }),
                                                  Container(
                                                    width: double.infinity,
                                                    height: _heightScale * 20,
                                                    color: backgroundColor,
                                                  ),
                                                  SizedBox(
                                                    height: _heightScale * 40,
                                                  ),
                                                ],
                                              ),
                                  ],
                                ),
                                // }),
                              ),
                              res['data'][10].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand1 = !isExpand1;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "February, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand1 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand1 == false
                                              ? Container()
                                              : res['data'][10].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][10]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][10]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][10][index1]
                                                                            [
                                                                            'professionalname'] !=
                                                                        null
                                                                    ? getCapitalizeStringaa(res['data'][10]
                                                                            [
                                                                            index1]
                                                                        [
                                                                        'professionalname'])
                                                                    : "No Name",
                                                                res['data'][10][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][10]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][9].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand2 = !isExpand2;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "March, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand2 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand2 == false
                                              ? Container()
                                              : res['data'][9].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][9]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][9]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][9]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][9][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][9]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][8].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand3 = !isExpand3;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "April, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand3 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand3 == false
                                              ? Container()
                                              : res['data'][8].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][8]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][8]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][8]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][8][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][8]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][7].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand4 = !isExpand4;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "May, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand4 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand4 == false
                                              ? Container()
                                              : res['data'][7].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][7]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][7]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][7]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][7][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][7]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][6].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand5 = !isExpand5;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "June, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand5 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand5 == false
                                              ? Container()
                                              : res['data'][6].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][6]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][6]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][6]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][6][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][6]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][5].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand6 = !isExpand6;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "July, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand6 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand6 == false
                                              ? Container()
                                              : res['data'][5].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][5]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][5]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][5]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][5][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][5]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][4].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand7 = !isExpand7;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "August, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand7 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand7 == false
                                              ? Container()
                                              : res['data'][4].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][4]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][4]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][4]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][4][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][4]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][3].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand8 = !isExpand8;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "September," +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand8 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand8 == false
                                              ? Container()
                                              : res['data'][3].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][3]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][3]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][3]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][3][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][3]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][2].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand9 = !isExpand9;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "October, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand9 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand9 == false
                                              ? Container()
                                              : res['data'][2].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][2]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][2]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][2]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][2][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][2]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][1].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand10 = !isExpand10;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "November, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand10 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand10 == false
                                              ? Container()
                                              : res['data'][1].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][1]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][1]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][1]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][1][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][1]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][0].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isExpand11 = !isExpand11;
                                              });
                                              // vvv(val);
                                            },
                                            child: Row(
                                              children: [
                                                //spacehort2,
                                                Expanded(
                                                  child: Text(
                                                    // month != null
                                                    //     ? month
                                                    //     :
                                                    "December, " +
                                                        res['year'].toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: text6),
                                                  ),
                                                ),
                                                Icon(
                                                  isExpand11 == true
                                                      ? Icons
                                                          .arrow_drop_down_outlined
                                                      : Icons
                                                          .arrow_drop_up_outlined,
                                                  color: text6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: _heightScale * 1,
                                            color: text13,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand11 == false
                                              ? Container()
                                              : res['data'][0].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][0]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                res['data'][0]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][0]
                                                                        [index1]
                                                                    ['_id'],
                                                                res['data'][0][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][0]
                                                                        [index1]
                                                                    ['topic'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                            ],
                          );
              }),
        ),
      ),
    );
  }

  Widget Appointment(String id, String date, String topic) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Booking Id : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              id,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 12,
        ),
        Row(
          children: [
            Text(
              "Date : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              date,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 12,
        ),
        Row(
          children: [
            Text(
              "Topic : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              topic,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 35,
        ),
      ],
    );
  }

  Widget Appointments(String id, String name, String date, String topic) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Booking Id : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              id,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 12,
        ),
        Row(
          children: [
            Text(
              "Name: ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 12,
        ),
        Row(
          children: [
            Text(
              "Date : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              date,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 12,
        ),
        Row(
          children: [
            Text(
              "Topic : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              topic,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 35,
        ),
      ],
    );
  }

  Widget details(String data, String title, String topic) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Booking Id :  ",
              style: GoogleFonts.poppins(
                  color: black(context),
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              data,
              style: GoogleFonts.poppins(
                color: text11,
                fontSize: _widthScale * 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 8,
        ),
        Row(
          children: [
            Text(
              "Date : ",
              style: GoogleFonts.poppins(
                  color: black(context),
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: text11,
                fontSize: _widthScale * 14,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 8,
        ),
        Row(
          children: [
            Text(
              "Topic : ",
              style: GoogleFonts.poppins(
                  color: black(context),
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              topic,
              style: GoogleFonts.poppins(
                  color: text11,
                  fontSize: _widthScale * 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: _widthScale * 100,
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 32,
        ),
        Container(
          width: double.infinity,
          height: _heightScale * 8,
          color: backgroundColor,
        ),
        SizedBox(
          height: _heightScale * 20,
        ),
      ],
    );
  }
}
