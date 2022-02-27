// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heybuddy/Screens/welcome.dart';
// import 'package:heybuddy/api/second_tab_api.dart';
// import 'package:heybuddy/api/signin_api.dart';
// import 'package:heybuddy/color&font/colors.dart';
// import 'package:provider/provider.dart';

// class AspirantAppointmentBooked extends StatefulWidget {
//   // var index;
//   // AspirantAppointmentBooked({required this.index});
//   const AspirantAppointmentBooked({Key? key}) : super(key: key);

//   @override
//   _AspirantAppointmentBookedState createState() =>
//       _AspirantAppointmentBookedState();
// }

// class _AspirantAppointmentBookedState extends State<AspirantAppointmentBooked> {
//   var time;

//   var add = TimeOfDay.minutesPerHour / 2;
//   String getText() {
//     if (time == null) {
//       return 'Select Time';
//     } else {
//       final hours = time.hour;
//       final minutes = time.minute;
//       // final extratime = TimeOfDay(hour: hours, minute: minutes);
//       if (minutes < 10) {
//         return '$hours:${0}${minutes} - $hours:${minutes + 30}';
//       } else if (minutes > 10 && minutes < 30) {
//         return '$hours:$minutes - $hours:${minutes + 30}'; //'$hours:$minutes';
//       } else if (minutes > 30) {
//         return '$hours:$minutes - ${hours + 1}:${0}${minutes + 30 - 60}';
//       }
//     }
//     return "";
//   }

//   Future pickTime(BuildContext context) async {
//     final initialTime = TimeOfDay.now();
//     final newTime = await showTimePicker(
//       context: context,
//       initialTime: time ?? initialTime,
//     );

//     if (newTime == null) return;

//     setState(() => time = newTime);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     get2ndtabapi();
//   }

//   var tkn = datam.read('f');
//   var valout;
//   List resout = [];
//   get2ndtabapi() async {
//     valout = await secondTabPayment(tkn);
//     resout = valout;
//     return resout;
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

//     Widget spacehort2 = SizedBox(
//       width: size.width * 0.1,
//     );
//     Widget spacevert1 = SizedBox(
//       height: size.height * 0.03,
//     );
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: white.withOpacity(0.6), //backgroundColor,
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
//           "Appointment",
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
//               future: get2ndtabapi(),
//               builder: (context, snapShot) {
//                 return valout == null
//                     ? Container(
//                         height: _heightScale * 650,
//                         width: double.infinity,
//                         child: Center(
//                           child: CircularProgressIndicator(),
//                         ))
//                     : Column(
//                         children: [
//                           // Container(
//                           //   height: _heightScale * 575,
//                           //   child:
//                           Column(
//                             children: [
//                               spacevert,
//                               Image.asset("assets/Group 246.png"),
//                               spacevert1,
//                               Appointment(
//                                   "Booking id: ",
//                                   resout[widget.index]['orderId']
//                                       .toString()
//                                       .replaceRange(0, 6, ""),
//                                   text9),
//                               spacevert1,
//                               Appointment("Topic: ",
//                                   resout[widget.index]['topic'], text9),
//                               // spacevert1,
//                               // Appointment(
//                               //     "Professional: ", "Manipreet Mittapelli", text9),
//                               spacevert1,
//                               Appointment("Status: ",
//                                   resout[widget.index]['status'], Colors.green),
//                               spacevert1,
//                               Appointment(
//                                   "Date: ",
//                                   resout[widget.index]['Date']
//                                       .toString()
//                                       .replaceRange(10, 24, ""),
//                                   text9),
//                               spacevert,
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Time Slot",
//                                     style: GoogleFonts.poppins(
//                                         fontSize: _widthScale * 16,
//                                         color: text9),
//                                   ),
//                                 ],
//                               ),

//                               spacevert1,
//                               Row(
//                                 children: [
//                                   Text(
//                                     resout[widget.index]['meetingTime'] == ""
//                                         ? ""
//                                         : resout[widget.index]['meetingTime'],
//                                     style: GoogleFonts.poppins(
//                                         fontSize: _widthScale * 18,
//                                         color: text9),
//                                   ),
//                                 ],
//                               ),
//                               // Container(
//                               //   margin: EdgeInsets.only(left: 16, right: 15),
//                               //   height: 56,
//                               //   width: double.maxFinite,
//                               //   decoration: BoxDecoration(
//                               //     color: white.withOpacity(0.5),
//                               //     borderRadius: BorderRadius.all(Radius.circular(20)),
//                               //   ),
//                               //   child: ListTile(
//                               //     title: Text(getText()),
//                               //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                           // ),
//                           SizedBox(
//                             height: _heightScale * 50,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "The link has been sent to your gmail and calender",
//                                 style: GoogleFonts.poppins(
//                                     fontSize: _widthScale * 12),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: _heightScale * 5,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Kindly join it",
//                                 style: GoogleFonts.poppins(
//                                     fontSize: _widthScale * 12),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: _heightScale * 20,
//                           ),
//                           // Container(
//                           //   width: double.infinity,
//                           //   height: _widthScale * 56,
//                           //   child: ElevatedButton(
//                           //       onPressed: () {},
//                           //       style: ElevatedButton.styleFrom(
//                           //         primary: text6,
//                           //         shape: new RoundedRectangleBorder(
//                           //           borderRadius:
//                           //               new BorderRadius.circular(_widthScale * 10.0),
//                           //         ),
//                           //       ),
//                           //       child: Text(
//                           //         'Join Meeting',
//                           //         style: GoogleFonts.poppins(
//                           //           textStyle: TextStyle(fontSize: _widthScale * 18),
//                           //         ),
//                           //       )),
//                           // ),
//                         ],
//                       );
//               }),
//         ),
//       ),
//     );
//   }

//   Widget Appointment(String heading, String data, Color col) {
//     const double kDesignWidth = 375;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     return Row(
//       children: [
//         Text(
//           heading,
//           style: GoogleFonts.poppins(
//               fontSize: _widthScale * 16,
//               color: black(context),
//               fontWeight: FontWeight.w600),
//         ),
//         Text(
//           data,
//           style: GoogleFonts.poppins(fontSize: _widthScale * 16, color: col),
//         ),
//       ],
//     );
//   }
// }
