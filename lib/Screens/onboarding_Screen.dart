import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/brand_name.dart';
import 'package:heybuddy/Screens/loginScreen.dart';
import 'package:heybuddy/Screens/logoName.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/provider/dark_theme_provider.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool _isDarkTheme = false;
  bool isLoading = false;
  bool darkmode = false;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context, listen: true);
    _isDarkTheme = themeProvider.liteTheme;
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      // backgroundColor: Styles.isDark?white:Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: Column(
            children: [
              BrandName(),
              SizedBox(
                height: _heightScale * 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 20),
                child: Image.asset(
                  "assets/rafiki.png",
                  // height:_heightScale* 292.57,
                  // width:_widthScale* 218,
                ),
              ),
              SizedBox(
                height: _heightScale * 40,
              ),
              Row(
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  CircleAvatar(
                    radius: _widthScale * 15,
                    backgroundColor: text2(context),
                    child: Icon(
                      Icons.location_pin,
                      size: _widthScale * 16,
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
                // mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  Column(
                    children: [
                      Text(
                        "Welcome to HeyBuddy the best",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: whiteBox(context),
                              fontSize: _widthScale * 18),
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
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  Text(
                    "professional advise platform",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: whiteBox(context), fontSize: _widthScale * 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 16,
              ),
              Row(
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  Text(
                    "Leading carrer conversations platform",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: whiteBox(context), fontSize: _widthScale * 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 30,
              ),
              Container(
                height: _widthScale * 55,
                width: double.infinity, //340,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                      // Navigator.push(
                      //     context,
                      //     PageRouteBuilder(
                      //         transitionDuration: Duration(milliseconds: 400),
                      //         transitionsBuilder:
                      //             (context, animation, animationTime, child) {
                      //           return ScaleTransition(
                      //             scale: animation,
                      //             alignment: Alignment.centerRight,
                      //             child: child,
                      //           );
                      //         },
                      //         pageBuilder: (context, animation, animationTime) {
                      //           return WelcomePage();
                      //         }));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isLoading ? text6.withOpacity(0.4) : text6,
                      // side: isLoading
                      //     ? BorderSide(color: white, width: 2)
                      //     : BorderSide(color: text6, width: 5),
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadius.circular(_widthScale * 10.0),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => WelcomePage()));
              //     },
              //     style: ElevatedButton.styleFrom(
              //       primary: text6,
              //       shape: new RoundedRectangleBorder(
              //         borderRadius: new BorderRadius.circular(10.0),
              //       ),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(
              //           left: 115.0, right: 115, top: 15, bottom: 15),
              //       child: Text(
              //         'Get Started',
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               fontSize: 18, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     )),
              SizedBox(
                height: _heightScale * 25,
              ),
              Text(
                "Already have an account?",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: text2(context), fontSize: _widthScale * 18),
                ),
              ),
              SizedBox(
                height: _heightScale * 5,
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
                    // login?.setLogin(true);
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
              // SizedBox(
              //   height: _widthScale * 25,
              // ),
              // Switch(
              //   onChanged: (bool value) {
              //     setState(() {
              //       themeProvider.changeTheme(value);
              //     });
              //   },
              //   value: _isDarkTheme,
              //   inactiveThumbColor: Color.fromRGBO(36, 59, 124, 1),
              //   activeTrackColor: Color.fromRGBO(238, 142, 33, 1),
              //   activeColor: Color.fromRGBO(219, 235, 255, 1),
              // ),
//               ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//  setState(() {
//                             themeProvider.changeTheme(value);
//                           });
//                       // darkmode = !darkmode;
//                       // darkmode
//                       //     ? AdaptiveTheme.of(context).setLight()
//                       //     : AdaptiveTheme.of(context).setDark();
//                     });
//                   },
//                   child: Text( "Dark"))
            ],
          ),
        ),
      ),
    );
  }
}
