import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:heybuddy/color&font/colors.dart';

class Styles {
  static bool isDark = false;
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    isDark = isDarkTheme;
    return ThemeData(
      primaryColor: white(context), //Color.fromRGBO(36, 59, 124, 1),
      backgroundColor: isDark
          ? Colors.black
          : white(context), //Color.fromRGBO(223, 223, 223, 1),
      indicatorColor: Colors.white,
      scaffoldBackgroundColor: isDark
          ? Colors.black
          : backgroundColor, // Color.fromRGBO(223, 223, 223, 1),
      // buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      // hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      // hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      // disabledColor: Colors.grey,
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black(context),
      // cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      // canvasColor: isDarkTheme ? Colors.black(context) : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // buttonTheme: Theme.of(context).buttonTheme.copyWith(
      //     colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: 'Montserrat',
        ),
        headline2: TextStyle(
          fontFamily: 'OpenSans',
        ),
        headline3: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(),
      ),
    );
  }
}
