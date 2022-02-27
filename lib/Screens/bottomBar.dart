import 'dart:js';

import 'package:flutter/material.dart';
import 'package:heybuddy/color&font/colors.dart';

class BottomBar {
  Widget bar = Container(
    height: 78,
    width: 330,
    decoration: BoxDecoration(
      color: blue(context),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    child: Row(
      children: [
        Expanded(child: Icon(Icons.home,color: white(context),)),
        Expanded(child: Icon(Icons.calendar_today_sharp,color: white(context),)),
        Expanded(child: Icon(Icons.notifications,color: white(context),)),
        Expanded(child: Icon(Icons.ac_unit,color: white(context),)),
    ],),
  );
}
