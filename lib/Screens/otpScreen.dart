import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/homePage.dart';
import 'package:heybuddy/Screens/resend_otp.dart';
import 'package:heybuddy/Screens/signup_email.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:heybuddy/widgets/otp_timer.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatefulWidget {
  // const OtpScreen({Key? key}) : super(key: key);
  var phone;
  var codeDigits;
  OtpScreen({required this.phone, required this.codeDigits});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String? verificationCode;
  final BoxDecoration OTPBox = BoxDecoration(
    color: text7,
    border: Border.all(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(6.0),
    );
  }

  @override
  void initState() {
    sendOTP();
    super.initState();
  }

// resendOTP()async{
// await FirebaseAuth.instance.
// }
  sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpEmail(
                          phone: widget.phone,
                        )),
                (route) => false);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      },
      codeSent: (String vID, int? resendToken) {
        setState(() {
          verificationCode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          verificationCode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: textFieldColor,
      // backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
        child: Column(
          children: [
            SizedBox(
              height: _heightScale * 100,
            ),
            // Row(
            //   children: [
            //     Text(
            //       "Confirm Your Phone Number",
            //       style: GoogleFonts.poppins(
            //         textStyle: TextStyle(
            //             fontSize: _widthScale * 20,
            //             color: whitebox( context),
            //             fontWeight: FontWeight.w400),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: _heightScale * 44,
            // ),
            // fields("Phone Number", "Enter your Phone Number"),
            // SizedBox(
            //   height: _heightScale * 32,
            // ),
            Row(
              children: [
                Text(
                  "Enter OTP",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: _widthScale * 21,
                        color: whitebox(context),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _heightScale * 15,
            ),
            Text(
              "Enter the 6 digit code sent to your registered mobile number ",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: black(context), fontSize: _widthScale * 15),
              ),
            ),
            SizedBox(
              height: _heightScale * 32,
            ),
            // Row(
            //   children: [
            //     Text(
            //       "Enter OTP",
            //       style: GoogleFonts.poppins(
            //         textStyle: TextStyle(
            //             fontSize: _widthScale * 20,
            //             color: whitebox( context),
            //             fontWeight: FontWeight.w400),
            //       ),
            //     ),
            //   ],
            // ),

            // SizedBox(
            //   height: _heightScale * 20,
            // ),
            PinPut(
              fieldsCount: 6,
              //onSubmit: (String pin) => _showSnackBar(pin, context),
              eachFieldHeight: _heightScale * 50,
              eachFieldWidth: _widthScale * 45,
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
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode!, smsCode: pin))
                      .then((value) {
                    //if user is successfully loggedin we have to send user to homepage.
                    if (value.user != null) {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => SignUpEmail(phone: widget.phone,)),
                      //     (route) => false);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpEmail(
                                    phone: widget.phone,
                                  )));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("INVALID OTP"),
                    duration: Duration(seconds: 4),
                  ));
                }
              },
            ),
            SizedBox(
              height: _heightScale * 14,
            ),
            Row(
              children: [
                // InkWell(
                //   onTap: () {
                //     sendOTP();
                //     // Navigator.push(context,
                //     // MaterialPageRoute(builder: (context) => ResendOTP()));
                //   },
                //   child: Text(
                //     "Resend OTP",
                //     style: GoogleFonts.poppins(
                //       textStyle:
                //           TextStyle(color: black(context), fontSize: _widthScale * 13),
                //     ),
                //   ),

                // ),
                TimeButton(
                  buttonType: ButtonTyp.FlatButton,
                  label: "Resend OTP",
                  timeOutInSeconds: 59,
                  onPressed: () {
                    sendOTP();
                  },
                  disabledColor: textFieldColor(context),
                  color: textFieldColor(context),
                  disabledTextStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 13 * _widthScale,
                        color: whiteBox(context),
                        fontWeight: FontWeight.w500),
                  ),
                  activeTextStyle: TextStyle(
                      fontSize: 13 * _widthScale,
                      color: whiteBox(context),
                      fontWeight: FontWeight.w500),
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
                  onPressed: () {
                    sendOTP();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: text6,
                    shape: new RoundedRectangleBorder(
                      borderRadius:
                          new BorderRadius.circular(_widthScale * 10.0),
                    ),
                  ),
                  child: Text(
                    'Log In',
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
