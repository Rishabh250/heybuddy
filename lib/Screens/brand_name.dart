import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';

class BrandName extends StatelessWidget {
  const BrandName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        SizedBox(
          height: _heightScale * 53,
          //width: MediaQuery.of(context).size.width * 0.96,
        ),

        Container(
          height: _heightScale * 100,
          width: _widthScale * 135,
          child: Image.asset(
            "assets/brandlogohortt.png",
            //  height: _heightScale*131.47,
            //  width: _widthScale*135,
          ),
        )

        // Container(
        //   decoration: BoxDecoration(color: black(context), shape: BoxShape.circle),
        //   child: Padding(
        //     padding: EdgeInsets.all(_widthScale* 22.0),
        //     child: Text(
        //       "HB",
        //       style: GoogleFonts.poppins(
        //           textStyle: TextStyle(
        //               color: white, fontSize:_widthScale* 20, fontWeight: FontWeight.bold)),
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: _widthScale*8,
        // ),
        // Text(
        //   "HeyBuddy",
        //   style: CustomTextStyle.HeyBuddy(context),
        // ),
      ],
    );
  }
}
