// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heybuddy/Screens/education_becomeaprofessional.dart';
// import 'package:heybuddy/Screens/education_new_experience.dart';
// import 'package:heybuddy/Screens/experience_becomeaprofessional.dart';
// import 'package:heybuddy/Screens/languages_becomeprofessional.dart';
// import 'package:heybuddy/Screens/new_languages.dart';
// import 'package:heybuddy/Screens/new_skills_professional.dart';
// import 'package:heybuddy/Screens/onboarding_Screen.dart';
// import 'package:heybuddy/Screens/professional_history_new_experience.dart';
// import 'package:heybuddy/Screens/skills_becomeaprofessional.dart';
// import 'package:heybuddy/api/becomeaprofessional.dart';
// import 'package:heybuddy/api/signup_api.dart';
// import 'package:heybuddy/color&font/colors.dart';
// import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
// import 'package:heybuddy/shared_preference/shared_preference.dart';
// import 'package:heybuddy/shared_preference/shared_preference_login.dart';
// import 'package:heybuddy/shared_preference/token_preference.dart';
// import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
// import 'package:intl/intl.dart';

// class BecomeProfessionalFormFill extends StatefulWidget {
//   const BecomeProfessionalFormFill({Key? key}) : super(key: key);

//   @override
//   _BecomeProfessionalFormFillState createState() =>
//       _BecomeProfessionalFormFillState();
// }

// class _BecomeProfessionalFormFillState
//     extends State<BecomeProfessionalFormFill> {
//   var pickedDate;
//   var newDate;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loginPreference = LoginPreference();
//     login = Login();
//     tokenPreference = TokenPreference();
//     innerCheck = InnerCheck();
//     uperCheck = UpperCheck();
//     // chooseLogin();
//     uperCheck = UpperCheck();
//     innerCheck = InnerCheck();
//     pickedDate = DateTime.now();
//   }

//   Future pickDate(BuildContext context) async {
//     final initialDate = DateTime.now();
//     newDate = await showDatePicker(
//       context: context,
//       initialDate: pickedDate ?? initialDate,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );

//     if (newDate == null) return;

//     setState(() => pickedDate = newDate);
//   }

//   String getText() {
//     if (pickedDate == null) {
//       return 'Select Date';
//     } else {
//       return DateFormat('dd/MM/yyyy').format(pickedDate);
//       // return '${date.month}/${date.day}/${date.year}';
//     }
//   }

//   var tkn = datam.read('f');
//   var becomepro;
//   onSubmitttt() async {
//     becomepro = await BecomeaProfessional.professional(tkn);
//     Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => OnBoardingScreen()),
//         (route) => false);
//     login?.cleartTokenPreferenceData();
//     loginPreference?.cleartTokenPreferenceData();
//     tokenPreference.cleartTokenPreferenceData();
//     innerCheck?.cleartTokenPreferenceData();
//     uperCheck?.cleartTokenPreferenceData();
//     innerCheck?.cleartTokenPreferenceDataa();
//     datam.remove('f');
//     datam.erase();
//   }

//   Future showAlertDialog(BuildContext context) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             backgroundColor: backgroundColor,
//             insetPadding: EdgeInsets.symmetric(horizontal: 30),
//             contentPadding: EdgeInsets.symmetric(horizontal: 30),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(_widthScale * 12),
//             ),
//             title: Text(
//               "Do you want to become a professional",
//               style: GoogleFonts.poppins(
//                 textStyle: TextStyle(fontSize: 16, color: black(context)),
//               ),
//             ),
//             actions: [
//               Column(
//                 children: [
//                   // Padding(
//                   //   padding:
//                   //       EdgeInsets.symmetric(horizontal: _widthScale * 20.0),
//                   //   child: Text(
//                   //     "Please update your profile after becoming a professional",
//                   //     style: GoogleFonts.poppins(
//                   //       textStyle: TextStyle(fontSize: 10, color: black(context)),
//                   //     ),
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: _heightScale * 10,
//                   // ),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: _widthScale * 20.0),
//                     child: Container(
//                       width: double.infinity,
//                       height: _heightScale * 45,
//                       child: ElevatedButton(
//                           onPressed: () {
//                             onSubmitttt();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: text6,
//                             shape: new RoundedRectangleBorder(
//                               borderRadius:
//                                   new BorderRadius.circular(_widthScale * 10.0),
//                             ),
//                           ),
//                           child: Text(
//                             'Confirm',
//                             style: GoogleFonts.poppins(
//                               textStyle: TextStyle(fontSize: _widthScale * 18),
//                             ),
//                           )),
//                     ),
//                   ),
//                   SizedBox(
//                     height: _heightScale * 10,
//                   ),
//                 ],
//               ),
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

//     var size = MediaQuery.of(context).size;
//     Widget spacevert = SizedBox(
//       height: size.height * 0.04,
//     );
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: white.withOpacity(0.6),
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
//           "Become a Professional",
//           style: GoogleFonts.poppins(
//               color: whitebox( context),
//               fontSize: _widthScale * 18,
//               fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: size.height * 0.76,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: _heightScale * 44,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Add Details",
//                             style: GoogleFonts.poppins(
//                                 fontSize: _widthScale * 20,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: _heightScale * 15,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => NewLanguages()));
//                         },
//                         child: fields(
//                             "Add Languages Known", "Enter languages you known"),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       ProffesionalHistoryFormFill()));
//                         },
//                         child: fields("Add Professional Experience",
//                             "Enter your Experience"),
//                       ),
//                       GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => EducationFormFill()));
//                           },
//                           child: fields(
//                               "Add your Education", "Enter your Education")),
//                       GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => NewSkills()));
//                           },
//                           child: fields("Add Skills", "Enter your skills")),
//                       SizedBox(
//                         height: _heightScale * 30,
//                       ),
//                       // Row(
//                       //   children: [
//                       //     SizedBox(
//                       //       width: _widthScale * 10,
//                       //     ),
//                       //     Text(
//                       //       "Start Date*",
//                       //       style: GoogleFonts.poppins(
//                       //         textStyle: TextStyle(
//                       //             color: text2(context),
//                       //             fontSize: _widthScale * 13,
//                       //             fontWeight: FontWeight.w500),
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       // SizedBox(
//                       //   height: _heightScale * 13,
//                       // ),
//                       // Container(
//                       //   height: _heightScale * 56,
//                       //   width: double.maxFinite,
//                       //   decoration: BoxDecoration(
//                       //     color: white.withOpacity(0.5),
//                       //     borderRadius: BorderRadius.all(
//                       //         Radius.circular(_widthScale * 6)),
//                       //   ),
//                       //   child: ListTile(
//                       //     title: Text(
//                       //       getText(),
//                       //       style: GoogleFonts.poppins(
//                       //           color: text12.withOpacity(0.8),
//                       //           fontSize: _widthScale * 16),
//                       //     ),
//                       //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
//                       //     trailing: InkWell(
//                       //         onTap: () => pickDate(context),
//                       //         child: Image.asset(
//                       //           "assets/Group 804.png",
//                       //           height: _heightScale * 20,
//                       //           width: _widthScale * 20,
//                       //         )),
//                       //   ),
//                       // ),
//                       // SizedBox(
//                       //   height: _heightScale * 30,
//                       // ),
//                       // Row(
//                       //   children: [
//                       //     SizedBox(
//                       //       width: _widthScale * 10,
//                       //     ),
//                       //     Text(
//                       //       "End Date*",
//                       //       style: GoogleFonts.poppins(
//                       //         textStyle: TextStyle(
//                       //             color: text2(context),
//                       //             fontSize: _widthScale * 13,
//                       //             fontWeight: FontWeight.w500),
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       // SizedBox(
//                       //   height: _heightScale * 13,
//                       // ),
//                       // Container(
//                       //   height: _heightScale * 56,
//                       //   width: double.maxFinite,
//                       //   decoration: BoxDecoration(
//                       //     color: white.withOpacity(0.5),
//                       //     borderRadius: BorderRadius.all(
//                       //         Radius.circular(_widthScale * 6)),
//                       //   ),
//                       //   child: ListTile(
//                       //     title: Text(getText(),
//                       //         style: GoogleFonts.poppins(
//                       //             color: text12.withOpacity(0.8),
//                       //             fontSize: _widthScale * 16)),
//                       //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
//                       //     trailing: InkWell(
//                       //         onTap: () => pickDate(context),
//                       //         child: Image.asset("assets/Group 804.png")),
//                       //   ),
//                       // ),
//                       //   fields("Headline*", ""),
//                       //   fields("Industry*", ""),
//                       //   fields("Description*", ""),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: _heightScale * 10,
//               ),
//               Container(
//                 height: _widthScale * 56,
//                 width: _widthScale * 340,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => SlotConfirm()));
//                       // onSubmitttt();
//                       showAlertDialog(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: text6,
//                       shape: new RoundedRectangleBorder(
//                         borderRadius:
//                             new BorderRadius.circular(_widthScale * 10.0),
//                       ),
//                     ),
//                     child: Text(
//                       'Save',
//                       style: GoogleFonts.poppins(
//                           textStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: _widthScale * 18)),
//                     )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget fields(String title, String name) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

//     return Column(
//       children: [
//         SizedBox(
//           height: _heightScale * 30,
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: _widthScale * 10.0),
//               child: Text(
//                 title,
//                 style: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                       color: text6,
//                       decoration: TextDecoration.underline,
//                       fontSize: _widthScale * 15,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: _heightScale * 13,
//         ),
//       ],
//     );
//   }

//   Widget fieldss(String title, String name) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

//     return Column(
//       children: [
//         SizedBox(
//           height: _heightScale * 30,
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: _widthScale * 10.0),
//               child: Text(
//                 title,
//                 style: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                       color: text2(context),
//                       fontSize: _widthScale * 13,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: _heightScale * 13,
//         ),
//         TextField(
//           autofocus: false,
//           style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: white.withOpacity(0.5),
//             hintText: name,
//             hintStyle: GoogleFonts.poppins(
//                 textStyle: TextStyle(
//                     fontSize: _widthScale * 16,
//                     color: text12.withOpacity(0.8))),
//             contentPadding: EdgeInsets.only(
//                 left: _widthScale * 14.0,
//                 bottom: _heightScale * 8.0,
//                 top: _heightScale * 8.0),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: col1),
//               borderRadius: BorderRadius.circular(_widthScale * 6),
//             ),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: textFieldColor(context),
//               borderRadius: BorderRadius.circular(_widthScale * 6),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
