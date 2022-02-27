import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ResendOTP extends StatefulWidget {
  const ResendOTP({Key? key}) : super(key: key);

  @override
  _ResendOTPState createState() => _ResendOTPState();
}

class _ResendOTPState extends State<ResendOTP> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(6.0),
    );
  }

  final BoxDecoration OTPBox = BoxDecoration(
    color: text7,
    border: Border.all(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      // backgroundColor: textFieldColor,
      // backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
        child: Column(
          children: [
            SizedBox(
              height: _heightScale * 65,
            ),
            Row(
              children: [
                Text(
                  "Confirm Your Phone Number",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: _widthScale * 20,
                        color: whitebox(context),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _heightScale * 44,
            ),
            fields("Phone Number", "Enter your Phone Number"),
            SizedBox(
              height: _heightScale * 32,
            ),
            Row(
              children: [
                Text(
                  "Enter OTP",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: _widthScale * 20,
                        color: whitebox(context),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _heightScale * 32,
            ),
            PinPut(
              fieldsCount: 4,
              //onSubmit: (String pin) => _showSnackBar(pin, context),
              eachFieldHeight: _heightScale * 56,
              eachFieldWidth: _widthScale * 70,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(_widthScale * 6.0),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(_widthScale * 5.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(.5),
                ),
              ),
            ),
            // Row(
            //   children: [
            //     box("text"),
            //     box("text"),
            //     box("text"),
            //     box("text"),
            //   ],
            // ),
            SizedBox(
              height: _heightScale * 14,
            ),
            Row(
              children: [
                Text(
                  "Resend OTP",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: black(context), fontSize: _widthScale * 13),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _heightScale * 32,
            ),
            Container(
              height: _widthScale * 56,
              width: double.infinity, //340,
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
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget fields(String title, String info) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        TextField(
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor(context),
            hintText: title,
            hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: _widthScale * 16,
                    color: text12.withOpacity(0.5))),
            contentPadding: EdgeInsets.only(
                left: _widthScale * 14.0,
                bottom: _heightScale * 8.0,
                top: _heightScale * 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: col1),
              borderRadius: BorderRadius.circular(_widthScale * 6),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: textFieldColor(context),
              ),
              borderRadius: BorderRadius.circular(_widthScale * 6),
            ),
          ),
        ),
        SizedBox(
          height: _heightScale * 4,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _widthScale * 16.0),
              child: Text(
                info,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: black(context), fontSize: _widthScale * 13),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget box(String text) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Row(
      children: [
        Container(
          height: _heightScale * 56,
          width: _widthScale * 70,
          decoration: BoxDecoration(
            color: text7,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(_widthScale * 10.0),
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: 5, horizontal: _widthScale * 25),
            child: TextField(
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
        SizedBox(
          width: _widthScale * 10,
        ),
      ],
    );
  }
}
