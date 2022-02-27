import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/logoName.dart';
import 'package:heybuddy/Screens/signin_Phone.dart';
import 'package:heybuddy/Screens/signup_email.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:provider/provider.dart';

import 'loginScreen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isLoading = false;
  bool isLoading1 = false;
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
          child: Column(
            children: [
              logoName(),
              SizedBox(
                height: _heightScale * 89.53,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: text2(context),
                    radius: _widthScale * 17,
                    child: Icon(
                      Icons.location_pin,
                      size: _widthScale * 20,
                      color: white(context),
                    ),
                  ),
                  SizedBox(
                    width: _widthScale * 8,
                  ),
                  Text(
                    "Welcome",
                    style: CustomTextStyle.Blue3(context),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 19,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Please select what best describes",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: whiteBox(context),
                              fontSize: _widthScale * 19),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 5,
              ),
              Row(
                children: [
                  Text(
                    "you",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: whiteBox(context), fontSize: _widthScale * 19),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _heightScale * 48),
              buttona('I am a Aspirant'),
              SizedBox(
                height: _heightScale * 32,
              ),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: _widthScale * 145,
                    color: row,
                  ),
                  Text(
                    " Or ",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: text5, fontSize: 12),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: _widthScale * 145,
                    color: row,
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 32,
              ),
              button('I am a professional'),
              SizedBox(
                height: _heightScale * 89,
              ),
              Text(
                "Already have an account?",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: text2(context), fontSize: _widthScale * 18),
                ),
              ),
              SizedBox(
                height: _heightScale * 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => SignUpEmail(phone: "768978",)));
                  },
                  child: Text(
                    "Log In Here",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: whiteBox(context), fontSize: _widthScale * 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _widthScale * 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttona(String title) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: _widthScale * 56,
      child: ElevatedButton(
          onPressed: () async {
            if (isLoading) return;
            setState(() {
              isLoading = true;
            });
            await Future.delayed(Duration(milliseconds: 500));

            setState(() {
              isLoading = false;
            });
            uperCheck?.setLoginStatus(true);
            loginPreference?.setLoginStatus(true);
            Provider.of<Favourite>(context, listen: false).changeFav(title);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInPhone()));
          },
          style: ElevatedButton.styleFrom(
            primary: isLoading ? text6.withOpacity(0.4) : text6,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(_widthScale * 10.0),
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: _widthScale * 18, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

  Widget button(String title) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Container(
      //  margin: EdgeInsets.symmetric(horizontal: 25),
      height: _widthScale * 56,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () async {
            if (isLoading1) return;
            setState(() {
              isLoading1 = true;
            });
            await Future.delayed(Duration(milliseconds: 500));

            setState(() {
              isLoading1 = false;
            });
            uperCheck?.setLoginStatus(true);
            loginPreference?.setLoginStatus(false);
            Provider.of<Favourite>(context, listen: false).changeFav(title);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInPhone()));
          },
          style: ElevatedButton.styleFrom(
            primary: isLoading1
                ? text6.withOpacity(0.4)
                : text6, //Colors.grey[600]!.withOpacity(0.5),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(_widthScale * 10.0),
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: _widthScale * 18, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}

class Favourite extends ChangeNotifier {
  String _fav = 'I am a professional';
  String get fav => _fav;
  void changeFav(String newFav) {
    _fav = newFav;
    notifyListeners();
  }
}
