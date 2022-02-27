import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/logoName.dart';
import 'package:heybuddy/Screens/signin_Phone.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:provider/provider.dart';

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
                              color: whitebox(context),
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
                          color: whitebox(context), fontSize: _widthScale * 19),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _heightScale * 48),
              // buttona('I am a Aspirant'),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                height: _widthScale * 56,
                child: ElevatedButton(
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        isLoading = false;
                      });
                      Provider.of<Favourite>(context, listen: false)
                          .changeFav("I am a Aspirant");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPhone()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: text6,
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadius.circular(_widthScale * 10.0),
                      ),
                    ),
                    child: isLoading
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
                            "I am a Aspirant",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: _widthScale * 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
              ),
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
              //button('I am a professional'),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                height: _widthScale * 56,
                child: ElevatedButton(
                    onPressed: () async {
                      if (isLoading1) return;
                      setState(() {
                        isLoading1 = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        isLoading1 = false;
                      });
                      Provider.of<Favourite>(context, listen: false)
                          .changeFav("I am a professional");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInPhone()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: text6,
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
                            "I am a professional",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: _widthScale * 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
              ),
              SizedBox(
                height: _heightScale * 89,
              ),
              Text(
                "Already have an account?",
                style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(color: text2(context), fontSize: _widthScale * 18),
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
                        MaterialPageRoute(builder: (context) => SignInPhone()));
                  },
                  child: Text(
                    "Log In Here",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: blue(context), fontSize: _widthScale * 18),
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
          onPressed: () {
            Provider.of<Favourite>(context, listen: false).changeFav(title);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInPhone()));
          },
          style: ElevatedButton.styleFrom(
            primary: text6,
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
          onPressed: () {
            Provider.of<Favourite>(context, listen: false).changeFav(title);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInPhone()));
          },
          style: ElevatedButton.styleFrom(
            primary: text6, //Colors.grey[600]!.withOpacity(0.5),
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
  String fav = 'unknown';

  void changeFav(String newFav) {
    fav = newFav;
    notifyListeners();
  }
}
