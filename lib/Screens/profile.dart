import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/becomeprofessional.dart';
import 'package:heybuddy/Screens/editProfile.dart';
import 'package:heybuddy/Screens/newbecome_a_professional.dart';
import 'package:heybuddy/Screens/onboarding_Screen.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/becomeaprofessional.dart';
import 'package:heybuddy/api/profileget_api.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/update_profile_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _gender = TextEditingController();

  // var imageFile;
  // final picker = ImagePicker();

  // chooseImage(ImageSource source) async {
  //   final pickedFile = await picker.getImage(source: source);

  //   setState(() {
  //     imageFile = File(pickedFile!.path);
  //   });
  // }

  var response;
  var name;
  var email;
  var phone;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      // getData();
      _onRefresh();
      getData();
    });
    // getData();
    // _onRefresh();
    super.initState();
  }

  var tkn = datam.read('f');

  getData() async {
    response = await getdata(tkn);
  }

  var becomepro;
  onSubmit() async {
    becomepro = await BecomeaProfessional.professional(tkn);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
        (route) => false);
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  void _onRefresh() async {
    setState(() {
      print("vjbdvjhdbvjif");
      getData();
      print("23");
      // await Future.delayed(Duration(milliseconds: 1000));
      print("24");
      getData();
      refreshController.refreshCompleted();
      print("22");
    });
  }

  var pp;
  //  var val = datam.read('f');
  // onSubmit() {
  //   var res = UpdateProfile.updateProfile(response['name'], tkn, imageFile);
  //   print("bbnnnb$tkn");
  //   Navigator.pop(context);
  // }
  //var imgg = "assets/vall.png";
  Future showAlertDialog(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            insetPadding: EdgeInsets.symmetric(horizontal: 30),
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_widthScale * 12),
            ),
            title: Text(
              "Do you want to become a professional",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 16, color: black(context)),
              ),
            ),
            actions: [
              Column(
                children: [
                  // Padding(
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: _widthScale * 20.0),
                  //   child: Text(
                  //     "Please update your profile after becoming a professional",
                  //     style: GoogleFonts.poppins(
                  //       textStyle: TextStyle(fontSize: 10, color: black(context)),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: _heightScale * 10,
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _widthScale * 20.0),
                    child: Container(
                      width: double.infinity,
                      height: _heightScale * 45,
                      child: ElevatedButton(
                          onPressed: () {
                            onSubmit();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: text6,
                            shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.circular(_widthScale * 10.0),
                            ),
                          ),
                          child: Text(
                            'Confirm',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: _widthScale * 18),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: _heightScale * 10,
                  ),
                ],
              ),
            ],
          );
        });
  }

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    print(response != null ? "ffdj${response}" : 'aa');
    var size = MediaQuery.of(context).size;
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    // Widget spacevert = SizedBox(
    //   height: size.height * 0.04,
    // );
    // Widget spacehort = SizedBox(
    //   width: size.width * 0.06,
    // );
    // Widget spacehort1 = SizedBox(
    //   width: size.width * 0.35,
    // );
    // Widget spacevert1 = SizedBox(
    //   height: size.height * 0.02,
    // );
    // Widget spacevert2 = SizedBox(
    //   height: size.height * 0.4,
    // );
    return Scaffold(
      // backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: backgroundColor,
      //   title: Builder(builder: (context) {
      //     return Row(
      //       children: [
      //         GestureDetector(
      //             onTap: () {
      //               Scaffold.of(context).openDrawer();
      //             },
      //             child: Container(
      //               height: _heightScale * 30,
      //               width: _widthScale * 35,
      //               child: Center(
      //                 child: GestureDetector(
      //                   onTap: () {
      //                     Scaffold.of(context).openDrawer();
      //                   },
      //                   child: GestureDetector(
      //                     onTap: () {
      //                       Scaffold.of(context).openDrawer();
      //                     },
      //                     child: Image.asset(
      //                       "assets/Vector.png",
      //                       height: _heightScale * 16.85,
      //                       width: _widthScale * 18,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             )),
      //         SizedBox(
      //           width: _widthScale * 84,
      //         ),
      //         InkWell(
      //           onTap: () {
      //             Scaffold.of(context).openDrawer();
      //           },
      //           child: GestureDetector(
      //             onTap: () {
      //               Navigator.pushAndRemoveUntil(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => Nav1(selectedIndex: 0)),
      //                   (route) => true);
      //             },
      //             child: Image.asset(
      //               "assets/hort2.png",
      //               height: _heightScale * 25,
      //               width: _widthScale * 115,
      //             ),
      //           ),
      //         ),
      // Container(
      //   height: _heightScale * 35,
      //   width: _widthScale * 35,
      //   decoration: BoxDecoration(
      //     borderRadius:
      //         BorderRadius.all(Radius.circular(_widthScale * 20)),
      //     color: black(context),
      //     //  shape: BoxShape.circle
      //   ),
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(
      //         horizontal: _widthScale * 8,
      //         vertical: _widthScale * 9),
      //     child: Text(
      //       "HB",
      //       style: GoogleFonts.poppins(
      //           textStyle: TextStyle(
      //               color: white,
      //               fontSize: _widthScale * 12,
      //               fontWeight: FontWeight.bold)),
      //     ),
      //   ),
      // ),
      // SizedBox(
      //   width: _widthScale * 15,
      // ),
      // Text(
      //   "HeyBuddy",
      //   style: CustomTextStyle.HeyBuddy1(context),
      // ),
      //       ],
      //     );
      //   }),
      // ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: false,
        enablePullDown: true,
        onRefresh: _onRefresh,
        // onLoading: () => _onLoading(context),
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapShot) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                  child: response == null
                      ? Container(
                          height: _heightScale * 600,
                          width: double.infinity,
                          child: Center(child: CircularProgressIndicator()))
                      : Column(
                          children: [
                            SizedBox(
                              height: _heightScale * 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                response['profilePic'] == ""
                                    ? (response['gender'] == "Male" ||
                                            response['gender'] == "Other")
                                        ? Image.asset(
                                            'assets/Men Professional.png',
                                            height: _heightScale * 90,
                                            width: _widthScale * 90,
                                          )
                                        : Image.asset(
                                            'assets/Female Professional.png',
                                            height: _heightScale * 90,
                                            width: _widthScale * 90,
                                          )
                                    : Container(
                                        height: _heightScale * 90,
                                        width: _widthScale * 90,
                                        decoration: BoxDecoration(
                                          // border: Border.all()
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  response['profilePic']),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                //
                                SizedBox(
                                  width: _widthScale * 177,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditProfile(
                                                  name: response['name'],
                                                  image: response[
                                                              'profilePic'] ==
                                                          ""
                                                      ? imggg
                                                      : response['profilePic'],
                                                ))).then((value) {
                                      setState(() {
                                        getData();
                                      });
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Edit",
                                        style: GoogleFonts.poppins(
                                          color: whitebox(context),
                                          fontSize: _widthScale * 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: _widthScale * 5,
                                      ),
                                      Image.asset(
                                        "assets/Group 1067.png",
                                        height: _heightScale * 20,
                                        width: _widthScale * 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _heightScale * 32,
                            ),

                            fieldss("Your full name",
                                response != null ? response['name'] : ''),
                            // fields("Your full name", "Shrvan Kumar", _name),
                            // fields("Your Gender", "Male", _gender),
                            fieldss("Your Gender",
                                response != null ? response['gender'] : ''),
                            fieldss("Your E-Mail",
                                response != null ? response['email'] : ''),
                            fieldss("Your Phone number",
                                response != null ? response['phone'] : ''),
                            // fields("Your E-Mail", "xyz@gmail.com", _email),
                            // fields("Your Phone number", "98******32", _number),
                            SizedBox(
                              height: _heightScale * 32,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // showAlertDialog(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BecomeProfessionalFormFill()));
                                  },
                                  child: Text(
                                    "Become a professional",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: _widthScale * 16,
                                            decoration:
                                                TextDecoration.underline,
                                            color: text6)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _heightScale * 25,
                            ),
                          ],
                        ),
                ),
              );
            }),
      ),
    );
  }

  Widget fields(String title, String name, TextEditingController cont) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: text2(context),
                    fontSize: _widthScale * 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 8,
        ),
        TextField(
          controller: cont,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: white(context),
            hintText: name,
            hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: _widthScale * 16,
                    color: text12.withOpacity(0.8))),
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
          height: _heightScale * 20,
        ),
      ],
    );
  }

  Widget fieldss(String title, String name) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: text2(context),
                    fontSize: _widthScale * 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 8,
        ),

        Container(
          color: textFieldColor(context),
          height: _heightScale * 45,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(
              left: _widthScale * 16.0,
              //  top: _heightScale * 16,
              // bottom: _heightScale * 16
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 16,
                              color: text12.withOpacity(0.8))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: _heightScale * 20,
        ),
      ],
    );
  }
}
