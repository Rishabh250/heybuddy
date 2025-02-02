import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/enterconfirmpassword.dart';
import 'package:heybuddy/api/email_verification.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/verifyforgotpassword.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/main.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:heybuddy/widgets/otp_timer.dart';
import 'package:pinput/pin_put/pin_put.dart';

class EmailVerifiy extends StatefulWidget {
  //  Verification({Key? key}) :super(key: key);
  //       check == true ? 'aspirant' : 'professional',
  //       _email.text,
  //       _name.text,
  //       _value,
  //       _password.text,
  //       widget.phone);
  var who;
  var email;
  var name;
  var gender;
  var password;
  var phone;
  var tkn;
  var refCode;
  // final bool verify;
  EmailVerifiy(
      {required this.who,
      required this.email,
      required this.name,
      required this.gender,
      required this.password,
      required this.phone,
      required this.tkn,
      required this.refCode});
  @override
  State<EmailVerifiy> createState() => _EmailVerifiyState();
}

class _EmailVerifiyState extends State<EmailVerifiy> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;

  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(
        color: text6, // Colors.deepPurpleAccent
      ),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('token coming${widget.tkn}');
  }

  var isLoading1 = false;
  // var tkn = datam.read('f');
  void _onSubmit(BuildContext context) async {
    var firetkn = await firebaseMessaging.getToken();
    var output = await VerifyEmailVerification.verification(
        widget.email, _pinPutController.text, widget.tkn);
    if (output == false) {
      const snackBar = SnackBar(
        backgroundColor: text6,
        content: Text("Incorrect pin"),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (output == true) {
      //  else {

      var response = await SignUp.signUp(
          widget.who,
          widget.email,
          widget.name,
          widget.gender,
          widget.password,
          widget.phone,
          firetkn,
          widget.refCode,
          context);

      print(response);

      if (response == true) {
        // apihit();
        await login?.setLogin(true);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Nav1(
                      selectedIndex: 0,
                    )),
            (route) => false);
        setState(() {
          isLoading1 = false;
        });
      } else if (response == false) {
        print("is value printed");
        await login?.setLogin(false);
        print("hhhh");
        // const snackBar = SnackBar(
        //   content: Text("Something went wrong ! "),
        //   backgroundColor: text6,
        //   duration: Duration(milliseconds: 2000),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        if (mounted) {
          setState(() {
            isLoading1 = false;
          });
        }
      }
    }
  }

  void _onResend(BuildContext context) async {
    // var response = await ResendOtp.verify(widget.email);
    var output = await VerifyEmailVerification.verification(
      widget.email,
      _pinPutController.text,
      widget.tkn,
    );
    // ignore: curly_braces_in_flow_control_structures

    const snackBar = SnackBar(
      content: Text("Otp sent successfully !"),
      backgroundColor: text6,
      duration: Duration(milliseconds: 2000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // setState(() {
    //   verified = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23 * _widthScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31 * _heightScale,
              ),
              Text(
                'Confirm your Email Id',
                style: GoogleFonts.poppins(
                  fontSize: 21 * _widthScale,
                  fontWeight: FontWeight.w400,
                  color: whitebox(context), //const Color(0xFF775594),
                ),
              ),
              SizedBox(
                height: 39 * _heightScale,
              ),
              Text(
                'Please enter the Code sent on your email address ${widget.email} to register',
                style: GoogleFonts.poppins(
                  fontSize: 13 * _widthScale,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF828282),
                ),
              ),
              SizedBox(
                height: 39 * _heightScale,
              ),
              Row(
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  Text(
                    "Enter CODE",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 20 * _widthScale,
                          color: whitebox(context), //Color(0xFF775594),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29 * _heightScale,
              ),
              Container(
                // color: Colors.white,
                // margin: const EdgeInsets.all(20.0),
                // padding: const EdgeInsets.all(20.0),
                child:
                    // TextField(
                    //   controller: _pinPutController,
                    //   autofocus: false,
                    //   keyboardType: TextInputType.number,
                    //   style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: textFieldColor.withOpacity(0.5),
                    //     hintText: 'Enter OTP',
                    //     hintStyle: GoogleFonts.poppins(
                    //         textStyle: TextStyle(
                    //             fontSize: _widthScale * 15,
                    //             color: text12.withOpacity(0.8))),
                    //     contentPadding: EdgeInsets.only(
                    //       left: _widthScale * 14.0,
                    //       //bottom: _widthScale * 8.0,
                    //       // top: _widthScale * 8.0
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: col1),
                    //       borderRadius: BorderRadius.circular(_widthScale * 6),
                    //     ),
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: textFieldColor(context),
                    //       borderRadius: BorderRadius.circular(_widthScale * 6),
                    //     ),
                    //   ),
                    // ),
                    PinPut(
                  //  cursorHeight: 70,
                  fieldsCount: 6,
                  eachFieldHeight: 50 * _heightScale,
                  eachFieldWidth: 45 * _widthScale,
                  onSubmit: (String pin) => _onSubmit(context),
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: text6, //Colors.deepPurpleAccent.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              //    PinPutTest(),
              Row(
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  // box("text", context),
                  // box("text", context),
                  // box("text" , context),
                  // box("text", context),
                ],
              ),
              SizedBox(
                height: 13 * _heightScale,
              ),
              TimeButton(
                buttonType: ButtonTyp.FlatButton,
                label: "Resend OTP",
                timeOutInSeconds: 59,
                onPressed: () {
                  _onResend(context);
                },
                disabledColor: textFieldColor(context),
                color: textFieldColor(context),
                disabledTextStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 13 * _widthScale,
                      color: whitebox(context), // Color(0xFF828282),
                      fontWeight: FontWeight.w500),
                ),
                activeTextStyle: TextStyle(
                    fontSize: 13 * _widthScale,
                    color: whitebox(context), // Color(0xFF775594),
                    fontWeight: FontWeight.w500),
              ),
              //
              SizedBox(
                height: 32 * _heightScale,
              ),
              ElevatedButton(
                onPressed: () {
                  _onSubmit(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: text6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 328 * _widthScale,
                  height: 56 * _heightScale,
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18 * _widthScale,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget box(String text, context) {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
  final double _heightScale =
      MediaQuery.of(context).size.height / kDesignHeight;

  return Row(
    children: [
      Container(
        height: 56 * _heightScale,
        width: 75 * _widthScale,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0XFFCCCCCC),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 5 * _heightScale, horizontal: 25 * _widthScale),
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
      SizedBox(
        width: 7.2 * _widthScale,
      ),
    ],
  );
}
