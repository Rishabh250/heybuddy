import 'package:flutter/material.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/shared_preference/darkmode.dart';

bool darkmode = false;
Color whiteBox(context) {
  return Styles.isDark ? Colors.white : Color(0xFF223263);
}

Color whitebox(context) {
  return Styles.isDark ? Colors.white : Color(0xFF223263);
}

Color blue(context) {
  return Colors.blue;
}

Color textFieldColor(context) {
  return Styles.isDark ? Colors.white.withOpacity(0.38) : Color(0xFFF3F3F3);
}

Color text2(context) {
  return Styles.isDark ? blue(context) : Color(0xFF828282);
}

Color black(context) {
  return Styles.isDark ? Colors.white : Colors.black;
}

Color greyp(context) {
  return Styles.isDark ? Colors.white : Colors.grey;
}

Color blacksearch(context) {
  return Styles.isDark
      ? Colors.white.withOpacity(0.2)
      : white(context).withOpacity(0.39);
}

Color white(context) {
  return Styles.isDark ? Colors.black : Colors.white;
}

Color appbar(context) {
  return Styles.isDark ? Colors.black : Colors.white;
}

Color text666(context) {
  return Styles.isDark ? Colors.white : Color(0xFF0099CC);
}

const whites = Colors.white;
// const black(context) = Colors.black(context);
// var blue222 = Styles.isDark ? white : Color(0xFF223263);
// const blue = Colors.blue;
// const textFieldColor = Color(0xFFF3F3F3);
const backgroundColor = Color(0xFFF6F6F6);
const backgroundColor1 = Color(0xFFF2F4F6);
// const text2(context) = Color(0xFF828282);
var row = Color(0xFF223263);
const text3 = Color(0xFF5D6785);
const text4 = Color(0xFFFC7E00);
const text5 = Color(0xFF00365B);
const col1 = Color(0xFFC5C5C5);
const col2 = Colors.grey;
const col4 = Color(0xFFD7D7D7);
const col3 = Color(0xFF434343);
const text6 = Color(0xFF0099CC);
const text7 = Color(0xFFF3F3F3);
const text8 = Color(0xFFDFDFDF);
const text9 = Color(0xFF333333);
const text10 = Color(0xFF6F7789);
const text11 = Color(0XFF5A5A5A);
const text12 = Color(0xFFB6B6B6);
const text13 = Color(0xFFCCCCCC);
