import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/login_signinphone.dart';
import 'package:heybuddy/Screens/logoName.dart';
import 'package:heybuddy/Screens/onboarding_Screen.dart';
import 'package:heybuddy/Screens/resetpasswordemail_Screen.dart';
import 'package:heybuddy/api/profileget_api.dart';
import 'package:heybuddy/api/resetpassword.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/main.dart';
import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:heybuddy/shared_preference/user.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:provider/provider.dart';

class EnterConfirmPassword extends StatefulWidget {
  var email;
  EnterConfirmPassword({required this.email});
  // const EnterConfirmPassword({Key? key}) : super(key: key);

  @override
  _EnterConfirmPasswordState createState() => _EnterConfirmPasswordState();
}

class _EnterConfirmPasswordState extends State<EnterConfirmPassword> {
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordconfirm = TextEditingController();

  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  bool isLoading1 = false;

  submit() async {
    if (_password.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text("Enter Password"),
        backgroundColor: text6,
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
        ;
      });
    } else if (_passwordconfirm.text.isEmpty) {
      final snackBar = SnackBar(
        content: Text("Enter Confirm Password"),
        backgroundColor: text6,
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
      // ignore: unrelated_type_equality_checks
    } else if (_password.text != _passwordconfirm.text) {
      final snackBar = SnackBar(
        content: Text("Confirm Password should be same"),
        backgroundColor: text6,
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else {
      var output = await ResetPassword.verify(widget.email, _password.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingScreen()),
          (route) => false);
      setState(() {
        isLoading1 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: Column(children: [
            logoName(),
            SizedBox(
              height: _heightScale * 77.53,
            ),
            Row(
              children: [
                Text(
                  "Reset Password",
                  style: CustomTextStyle.Blue1(context),
                ),
              ],
            ),

            SizedBox(
              height: _heightScale * 24,
            ),
            TextField(
              obscureText: !_passwordVisible2, //true,
              controller: _password,
              autofocus: false,
              style: TextStyle(
                  fontSize: _widthScale * 15.0, color: black(context)),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  size: _widthScale * 20,
                ),
                filled: true,
                fillColor: textFieldColor(context),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible2 ? Icons.visibility : Icons.visibility_off,

                    color: text6,
                    size: _widthScale * 20,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible2 = !_passwordVisible2;
                    });
                  },
                ),
                hintText: 'Enter your new Password',
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: _widthScale * 16,
                      color: text12.withOpacity(0.5)),
                ),
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
                    "Create your password",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: text2(context),
                          fontSize: _widthScale * 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _heightScale * 32,
            ),
            TextField(
              obscureText: !_passwordVisible, //true,
              controller: _passwordconfirm,
              autofocus: false,
              style: TextStyle(
                  fontSize: _widthScale * 15.0, color: black(context)),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  size: _widthScale * 20,
                ),
                filled: true,
                fillColor: textFieldColor(context),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,

                    color: text6,
                    size: _widthScale * 20,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                hintText: 'Confirm Password',
                hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: _widthScale * 16,
                      color: text12.withOpacity(0.5)),
                ),
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
            // Row(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: _widthScale * 16),
            //       child: Text(
            //         "Enter Password",
            //         style: GoogleFonts.poppins(
            //           textStyle: TextStyle(
            //               fontSize: _widthScale * 13,
            //               color: text2(context),
            //               fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: _heightScale * 4,
            // ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: _widthScale * 16),
                  child: Text(
                    "Confirm Password",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 13,
                          // decoration: TextDecoration.underline,
                          color: text2(context),
                          fontWeight: FontWeight.w600),
                    ),
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
                  onPressed: () async {
                    // getData();

                    if (isLoading1) return;
                    setState(() {
                      isLoading1 = true;
                    });
                    submit();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isLoading1 ? text6.withOpacity(0.4) : text6,
                    shape: new RoundedRectangleBorder(
                      borderRadius:
                          new BorderRadius.circular(_widthScale * 10.0),
                    ),
                  ),
                  child: isLoading1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: _heightScale * 20,
                              width: _widthScale * 20,
                              child: CircularProgressIndicator(
                                color: white(context),
                              ),
                            ),
                            SizedBox(
                              width: _widthScale * 20,
                            ),
                            Text("Please Wait...")
                          ],
                        )
                      : Text(
                          'Reset',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: _widthScale * 18,
                                  fontWeight: FontWeight.bold)),
                        )),
            ),
            SizedBox(
              height: _heightScale * 25,
            ),
          ]),
        ),
      ),
    );
  }
}
