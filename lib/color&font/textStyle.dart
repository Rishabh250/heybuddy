import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class CustomTextStyle {
  static TextStyle HeyBuddy(BuildContext context) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        color: black(context),
        fontSize: _widthScale * 24,
        // fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle HeyBuddy1(BuildContext context) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    return GoogleFonts.poppins(
      //color: black(context),
      fontSize: _widthScale * 12,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle Blue1(BuildContext context) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    return GoogleFonts.poppins(
        textStyle: TextStyle(
      color: whitebox(context),
      fontSize: _widthScale * 20,
      // fontWeight: FontWeight.w600,
    ));
  }

  static TextStyle Blue4(BuildContext context) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    return GoogleFonts.poppins(
        textStyle: TextStyle(
      color: whitebox(context),
      fontSize: _widthScale * 20,
      // fontWeight: FontWeight.w600,
    ));
  }

  static TextStyle Blue3(BuildContext context) {
    const double kDesignWidth = 375;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    return GoogleFonts.poppins(
        textStyle: TextStyle(
      color: whitebox(context),
      fontSize: _widthScale * 24,
      fontWeight: FontWeight.w600,
    ));
  }

  // static TextStyle Blue2(BuildContext context) {
  //   return GoogleFonts.montserrat(
  //       textStyle: TextStyle(
  //     color: whitebox( context),
  //     fontSize: 19,
  //     fontWeight: FontWeight.w600,
  //   ));
  // }
}
