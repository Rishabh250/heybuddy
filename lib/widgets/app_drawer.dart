import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/aspirant_setting.dart';
import 'package:heybuddy/Screens/mybookings.dart';
import 'package:heybuddy/Screens/mypayments.dart';
import 'package:heybuddy/Screens/onboarding_Screen.dart';
import 'package:heybuddy/Screens/professionaluserprofile.dart';
import 'package:heybuddy/Screens/profile.dart';
import 'package:heybuddy/Screens/setting.dart';
import 'package:heybuddy/Screens/signin_Phone.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/isavailableget.dart';
import 'package:heybuddy/api/isavailablepost.dart';
import 'package:heybuddy/api/profileget_api.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/token_preference.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:provider/provider.dart';

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  _CustomAppDrawerState createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  bool isSwitch = false;

  var val;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginPreference = LoginPreference();
    login = Login();
    tokenPreference = TokenPreference();
    innerCheck = InnerCheck();
    uperCheck = UpperCheck();
    // chooseLogin();
    uperCheck = UpperCheck();
    innerCheck = InnerCheck();
    // getData();
    chooseLogin();
    innerCheckLogin();
    innerCheckLoginn();
    upperCheckLogin();
    getData();
    getProfile();
  }

  chooseLogin() async {
    val = await loginPreference?.getLoginStatus();
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OnBoardingScreen()),
          (route) => false);
    });
    login?.cleartTokenPreferenceData();
    loginPreference?.cleartTokenPreferenceData();
    tokenPreference.cleartTokenPreferenceData();
    innerCheck?.cleartTokenPreferenceData();
    uperCheck?.cleartTokenPreferenceData();
    innerCheck?.cleartTokenPreferenceDataa();
    datam.remove('f');
    datam.erase();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => SignInPhone()));
  }

  var inCheck;
  var upCheck;
  var inCheckk;

  // chooseLogin() async {
  //   val = await loginPreference?.getLoginStatus();
  //   // await innerCheckLogin();
  // }

  innerCheckLogin() async {
    inCheck = await innerCheck?.getLogin();
    setState(() {
      print("incheckkkk$inCheck");
    });
  }

  innerCheckLoginn() async {
    inCheckk = await innerCheck?.getLoginn();
    print("incheckp$inCheckk");
  }

  upperCheckLogin() async {
    upCheck = await uperCheck?.getLoginStatus();
  }

  var response;
  var nameval;
  var tkn = datam.read('f');

  getProfile() async {
    nameval = await getdata(tkn);
    return nameval;
  }

  tttoggle(var x) {
    if (x == "true") {
      // setState(() {
      isSwitch1 = true;
      // });
    } else if (x == "false") {
      // setState(() {
      isSwitch1 = false;
      // });
    }
  }

  bool isSwitch1 = false;
  // var tkn = datam.read('f');
  var output;

  intoggle(String xx) async {
    output = await IsAvailable.choice(xx, tkn);
    // await tttoggle(anon);
    return output;
  }

  // var responseaa;
  // List vv = [];
  // // List pp = [];
  // getData() async {
  //   responseaa = await getdata(tkn);
  //   // pp = response;
  //   return responseaa;
  // }

  var anon;
  getdataanonmymous() async {
    anon = await checkavailable(tkn);
    print("vvvvvvv$anon");
    if (anon == "true") {
      setState(() {
        isSwitch1 = true;
      });
    } else if (anon == "false") {
      setState(() {
        isSwitch1 = false;
      });
    }
    // isSwitch1 = anon;
    print("dpppppp$isSwitch1");
    print("anon is $anon");
    print("$anon");
    return anon;
  }

  // var tkn = datam.read('f');
  Future getData() async {
    response = await getdetails(tkn);
    // Provider.of<Choose>(context, listen: false).changeFavs(response);
    print("resssssss$response");
    if (response == 'professional') {
      // loginPreference?.setLoginStatus(false);
      innerCheck?.setLoginn(true);
      innerCheck?.setLogin(false);
      print("beech1");
      return response;
    } else if (response == 'aspirant') {
      print("bee22");
      innerCheck?.setLogin(true);
      innerCheck?.setLoginn(false);
      // loginPreference?.setLoginStatus(true);
      return response;
    }
  }

  Future showAlertDialogss(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_widthScale * 12),
            ),
            title: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Information :",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18,
                            color: black(context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _heightScale * 10,
                ),
                Text(
                  "This will not let anyone book session with you. Do you wish you stay Not Available ? ",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 14, color: black(context)),
                  ),
                ),
              ],
            ),
          );
        });
  }

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    // chooseLogin();
    print("ddd ${val}");
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var word = Provider.of<Favourite>(context).fav;
    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(height: size.height * 0.15);
    Widget spacevert6 = SizedBox(height: size.height * 0.12);
    Widget spacevert4 = SizedBox(height: size.height * 0.02);
    Widget spacehort = SizedBox(
      width: size.width * 0.1,
    );
    // Widget spacehort1 = SizedBox(
    //   width: size.width * 0.07,
    // );
    // Widget spacevert1 = SizedBox(
    //   height: size.height * 0.0038,
    // );
    // Widget spacevert2 = SizedBox(
    //   height: size.height * 0.1,
    // );
    // Widget spacevert3 = SizedBox(
    //   height: size.height * 0.07,
    // );
    return Container(
      width: size.width * 0.8,
      child: Drawer(
        child: FutureBuilder(
            future: getdataanonmymous(),
            builder: (context, snapShot) {
              return Column(
                children: [
                  Container(
                    color: text6,
                    height: size.height * 0.9,
                    width: size.width * 0.8,
                    child: Column(
                      children: [
                        SizedBox(
                          height: _heightScale * 10,
                        ),
                        //word == "I am a professional"
                        inCheck == false
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.27,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showAlertDialogss(context);
                                    },
                                    child: Icon(
                                      Icons.info_outline_rounded,
                                      color: whites,
                                    ),
                                  ),
                                  SizedBox(
                                    width: _widthScale * 5,
                                  ),
                                  Text(
                                    "Not Available",
                                    style: GoogleFonts.poppins(
                                        fontSize: _widthScale * 16,
                                        color: whites,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Switch(
                                    value: isSwitch1,
                                    onChanged: (value) async {
                                      // output = await Anonynmous.choice(tkn);
                                      // intoggle();
                                      print("switch is $isSwitch1");

                                      setState(() {
                                        // isSwitch = value;
                                        // isSwitch1 = value;
                                        // if (value == true) {
                                        //   setState(() {
                                        //     anon = "true";
                                        //   });
                                        //   print(";jjj$anon");
                                        // } else if (value == false) {
                                        //   setState(() {
                                        //     anon = "false";
                                        //   });
                                        //   print(";jjggg$anon");
                                        // }
                                        // print("isSwitch1$isSwitch1");
                                        // print(
                                        //     "isSwitchhhhhhhhhhisSwitch$isSwitch");
                                      });

                                      print("switch after $isSwitch1");
                                      if (value == true) {
                                        print("lllll$isSwitch1");
                                        intoggle("true");
                                        getdataanonmymous();
                                      } else if (value == false) {
                                        intoggle("false");
                                        getdataanonmymous();
                                      }
                                    },
                                    inactiveTrackColor: Colors.blue[100],
                                    activeTrackColor: whitebox(context)
                                        .withOpacity(
                                            0.6), //Colors.lightGreenAccent,
                                    activeColor: whitebox(context)
                                        .withOpacity(0.3), //Colors.green,
                                  ),
                                  spacevert6,
                                ],
                              )
                            : SizedBox(
                                height: _heightScale * 50,
                                //child: Container(),
                              ),
                        SizedBox(height: _heightScale * 35),
                        FutureBuilder(
                            future: getProfile(),
                            builder: (context, snapSnap) {
                              return topics(
                                nameval == null
                                    ? ""
                                    : nameval['profilePic'] == ""
                                        ? imggg
                                        : nameval['profilePic'],
                                nameval == null ? "" : nameval['name'],
                                nameval == null ? "" : nameval['email'],
                              );
                            }),
                        SizedBox(height: _heightScale * 20),
                        Row(
                          children: [
                            spacehort,
                            GestureDetector(
                              onTap: () {
                                // upCheck == true
                                //     ? (val == false
                                //         ? Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     ProfessionalUserProfile()))
                                //         : Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     ProfileScreen())))
                                //     : inCheck == true
                                //         //  : (inCheck == true||inCheckk == false)
                                //         ? Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     ProfileScreen()))
                                //         : inCheck == null
                                //             ? CircularProgressIndicator()
                                //             : Navigator.push(
                                //                 context,
                                //                 MaterialPageRoute(
                                //                     builder: (context) =>
                                //                         ProfessionalUserProfile()));
                                inCheck == false
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Nav1(selectedIndex: 3)))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Nav1(selectedIndex: 3)));
                              },
                              child: Text(
                                "View Profile",
                                style: GoogleFonts.poppins(
                                    color: whites, fontSize: _widthScale * 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: _heightScale * 50),
                        Expanded(
                          child: Container(
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              color: white(context),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(_widthScale * 25),
                                  topRight: Radius.circular(_widthScale * 25)),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: _heightScale * 20),
                                inCheck == false
                                    ? InkWell(
                                        onTap: () {
                                          // word == "I am a professional"
                                          //     ? Navigator.push(
                                          //         context,
                                          //         MaterialPageRoute(
                                          //             builder: (context) => MyPayments()))
                                          //     : null;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyPayments()));
                                        },
                                        child: topics1("assets/paymentsimg.png",
                                            "My Earnings", text666(context)),
                                      )
                                    : Container(),
                                SizedBox(height: _heightScale * 8),
                                InkWell(
                                  onTap: () {
                                    // word == "I am a professional"
                                    //     ?
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyBookings()));
                                    // : null;
                                  },
                                  child: topics1("assets/paymentsimg.png",
                                      "My Bookings", text666(context)),
                                ),
                                SizedBox(height: _heightScale * 8),
                                InkWell(
                                    onTap: () {
                                      upCheck == true
                                          ? (val == false
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Setting()))
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AspirantSetting())))
                                          : inCheck == true
                                              //  : (inCheck == true||inCheckk == false)
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AspirantSetting()))
                                              : inCheck == null
                                                  ? CircularProgressIndicator()
                                                  : Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Setting()));
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => Setting()));
                                    },
                                    child: topics1("assets/setting.png",
                                        "Settings", text666(context))),
                                SizedBox(height: _heightScale * 8),
                                topics1("assets/Group 1136.png",
                                    "Help & Support", text666(context)),
                                SizedBox(height: _heightScale * 8),
                                topics1("assets/paymentsimg.png",
                                    "Refer a Friend", text666(context)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: size.width * 0.8,
                    color: white(context),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              logout();
                            },
                            child: topics1(
                                "assets/logout.png", "LogOut", Colors.red))
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget topics1(String img, String title, Color col) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(left: _widthScale * 20.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.asset(
              img,
              height: _heightScale * 32,
              width: _widthScale * 32,
              fit: BoxFit.fill,
            )),
      ),
      title: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: _widthScale * 15,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: _widthScale * 18,
                    color: col,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topics(String img, String title, String subtitle) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: InkWell(
          child: nameval != null
              ? nameval['anonymous'] == 'false'
                  ? nameval['profilePic'] == ""
                      ? (nameval['gender'] == "Male" ||
                              nameval['gender'] == "Other")
                          ? Image.asset(
                              'assets/Men Professional.png',
                              height: _heightScale * 60,
                              width: _widthScale * 60,
                            )
                          : Image.asset(
                              'assets/Female Professional.png',
                              height: _heightScale * 60,
                              width: _widthScale * 60,
                            )
                      : Container(
                          height: _heightScale * 60,
                          width: _widthScale * 60,
                          decoration: BoxDecoration(
                              color: whites.withOpacity(0.39),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    nameval['profilePic'],
                                  ),
                                  fit: BoxFit.cover)),
                        )
                  : (nameval['gender'] == "Male" ||
                          nameval['gender'] == "Other")
                      ? Image.asset(
                          'assets/Men Professional.png',
                          height: _heightScale * 60,
                          width: _widthScale * 60,
                        )
                      : Image.asset(
                          'assets/Female Professional.png',
                          height: _heightScale * 60,
                          width: _widthScale * 60,
                        )
              : Container(
                  height: 5,
                  width: 5,
                ),
          // (nameval['gender'] == "Male"||nameval['gender'] == "Other")
          //
          //     ?
          // Image.asset(
          //     'assets/Men Professional.png',
          //     height: _heightScale * 60,
          //     width: _widthScale * 60,
          //   )
          // : Image.asset(
          //     'assets/Female Professional.png',
          //     height: _heightScale * 60,
          //     width: _widthScale * 60,
          //   ),
          //  Container(
          //   height: _heightScale * 90,
          //   width: _widthScale * 90,
          //   decoration: BoxDecoration(
          //     // border: Border.all()
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //         image: NetworkImage(img), fit: BoxFit.contain),
          //   ),
          // ),
          //  Image.network(
          //   img,
          //   height: _heightScale * 150,
          //   width: _widthScale * 85,
          //   // fit: BoxFit.cover,
          // ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameval != null
                ? nameval['anonymous'] == 'true'
                    ? "Anonymous"
                    : title
                : "",
            style: GoogleFonts.poppins(
                fontSize: _widthScale * 18,
                color: whites,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: _heightScale * 8,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 13, color: whites)),
        ],
      ),
    );
  }
}
