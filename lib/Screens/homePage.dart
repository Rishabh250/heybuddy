import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/all_events.dart';
import 'package:heybuddy/Screens/home_top_pro.dart';
import 'package:heybuddy/Screens/pool_session.dart';
import 'package:heybuddy/Screens/professional_profile.dart';
import 'package:heybuddy/Screens/search_page.dart';
import 'package:heybuddy/Screens/skills_to_user.dart';
import 'package:heybuddy/Screens/top_professionals.dart';
import 'package:heybuddy/Screens/top_skills.dart';
import 'package:heybuddy/Screens/userprofile.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/all_events.dart';
import 'package:heybuddy/api/getProfessionalUsers.dart';
import 'package:heybuddy/api/notification.dart';
import 'package:heybuddy/api/profileget_api.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/skills_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/main.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/token_preference.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:heybuddy/shared_preference/userdata.dart';
import 'package:heybuddy/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../api/getBanner.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = new FlutterSecureStorage();
  final UserSecureStorage secure = UserSecureStorage();
  List<String> _locations = ["Company", "Technology"];
  var valueChoose = "Company";
  var val;
  var value;
  int page = 1;
  @override
  void initState() {
    getAllEvents();
    getBanner();
    super.initState();
    // login = Login();

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
    chooseLogins();
    innerCheckLogin();
    innerCheckLoginn();
    upperCheckLogin();
    getUsers(1);
    getData();
    getAllEvents();
    // notificatio();
    // getSkills();
    // UserSecureStorage();
    //  UserSecureStorage.getToken();
  }

  var events;
  List event = [];
  getAllEvents() async {
    events = await getallevents();
    event = events;
    return event;
  }

  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  var notif;
  notificatio() async {
    notif = await notification(tkn);
    print("hitted is $notif");
    return notif;
  }

  chooseLogins() async {
    value = await login?.getLogin();
  }

  chooseLogin() async {
    val = await loginPreference?.getLoginStatus();
  }

  bool vvv = false;
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

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  var response;
  var tkn = datam.read('f');
  Future getData() async {
    response = await getdetails(tkn);
    // Provider.of<Choose>(context, listen: false).changeFavs(response);
    print("resssssss$response");
    if (response == 'professional') {
      // loginPreference?.setLoginStatus(false);
      innerCheck?.setLoginn(true);
      innerCheck?.setLogin(false);
      print("pro.......");
      if (mounted) {
        setState(() {
          vvv = false;
        });
      }
      print("pro.......$vvv");
      return response;
    } else if (response == 'aspirant') {
      print("pro..... not");
      innerCheck?.setLogin(true);
      innerCheck?.setLoginn(false);
      // loginPreference?.setLoginStatus(true);
      if (mounted) {
        setState(() {
          vvv = true;
        });
      }
      print("pro.......$vvv");
      return response;
    }
  }

  // gg() async {
  //   ggg = await secure.getToken("token");
  //   return ggg;
  // }
  var res;
  List vv = [];
  getUsers(page) async {
    res = await getProfessionalData(page);
    vv = res;
  }

  // var response;
  // getSkills() async {
  //   response = await getSkillsData();
  // }
  var responses;
  onSubmit(BuildContext context, titl) async {
    responses = await Skills.userSkills(titl);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SkillToUser(
                  name: titl,
                )));
    setState(() {
      istap = false;
    });
  }

  var output;
  onTap() async {
    // output = await UniqueUser.uniqueUser(phone);
  }
  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing ",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(
          channel.id, channel.name, channel.description,
          importance: Importance.high,
          color: Colors.blue,
          playSound: true,
          // icon: '@mipmap/ic_launcher',
        )));
  }

  String getCapitalizeString(String input) {
    final List<String> splitStr = input.split(' ');
    for (int i = 0; i < splitStr.length; i++) {
      splitStr[i] =
          '${splitStr[i][0].toUpperCase()}${splitStr[i].substring(1)}';
    }
    final output = splitStr.join(' ');
    return output;
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    print("dptokencheck  ${tokenProfile?.token}");
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var word = Provider.of<Favourite>(context).fav;
    var size = MediaQuery.of(context).size;

    Widget spacehort = SizedBox(
      width: size.width * 0.08,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //drawer: CustomAppDrawer(),
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: appbar(context),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Container(
                  height: _heightScale * 50,
                  width: double.infinity,
                  color: white(context).withOpacity(0.4),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 0.8,
                                color: Color.fromARGB(255, 8, 85, 148))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: _widthScale * 15,
                            ),
                            Image.asset(
                              "assets/Search.png",
                              height: _heightScale * 20,
                              width: _widthScale * 20,
                              color: black(context),
                            ),
                            SizedBox(
                              width: _widthScale * 15,
                            ),
                            Text(
                              "Search",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: _widthScale * 15,
                                    color: text12.withOpacity(0.8)),
                              ),
                            ),
                            SizedBox(
                              width: _widthScale * 60,
                            ),
                            // Image.asset(
                            //   "assets/filter.png",
                            //   height: _heightScale * 20,
                            //   width: _widthScale * 20,
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _heightScale * 4,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: getUsers(1),
          builder: (context, snapShot) {
            return SingleChildScrollView(
              child: (res == null || event == null)
                  ? Container(
                      height: _heightScale * 500,
                      width: double.infinity,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: _heightScale * 12,
                          ),
                          Text("Please Wait . . . . . .",
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 14)),
                        ],
                      )))
                  : Column(
                      children: [
                        SizedBox(
                          height: _heightScale * 32,
                        ),
                        FutureBuilder(
                          future: getBanner(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            }
                            var data = snapshot.requireData;
                            return Container(
                              height: _heightScale * 197,
                              width: _widthScale * 315,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      data.banner.imgUrl,
                                    )),
                              ),
                            );
                          },
                        ),

                        SizedBox(
                          height: _heightScale * 24,
                        ),

                        SizedBox(
                          height: _heightScale * 20,
                        ),
                        Row(
                          children: [
                            spacehort,
                            Text("Top Skills",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 18,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: _widthScale * 160,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TopSkills()));
                              },
                              child: Text("View All",
                                  style: GoogleFonts.poppins(
                                      fontSize: _widthScale * 14,
                                      fontWeight: FontWeight.w500,
                                      color: Styles.isDark
                                          ? Color.fromARGB(255, 167, 164, 164)
                                          : Color.fromARGB(255, 20, 20, 20))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightScale * 1,
                        ),

                        // topics("Java"),
                        skills("Java"),
                        SizedBox(
                          height: _heightScale * 16,
                        ),
                        // topics("3D Animation"),
                        skills("3D Animation"),
                        SizedBox(
                          height: _heightScale * 32,
                        ),
                        Row(
                          children: [
                            spacehort,
                            Text("Top Professionals",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 18,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: _widthScale * 100,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TopProfessional()));
                              },
                              child: Text("View All",
                                  style: GoogleFonts.poppins(
                                      fontSize: _widthScale * 14,
                                      fontWeight: FontWeight.w500,
                                      color: Styles.isDark
                                          ? Color.fromARGB(255, 167, 164, 164)
                                          : Color.fromARGB(255, 20, 20, 20))),
                            ),
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: _heightScale * 300,
                          child: TopProfessional02(),
                        ),

                        Row(
                          children: [
                            spacehort,
                            GestureDetector(
                              onTap: () {
                                // showAlertDialog(context);
                              },
                              child: Text("Events",
                                  style: GoogleFonts.poppins(
                                      fontSize: _widthScale * 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: _widthScale * 190,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllEvents()));
                              },
                              child: Text("View All",
                                  style: GoogleFonts.poppins(
                                      fontSize: _widthScale * 14,
                                      color: Styles.isDark
                                          ? Color.fromARGB(255, 167, 164, 164)
                                          : Color.fromARGB(255, 20, 20, 20),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightScale * 1,
                        ),

                        FutureBuilder(
                            future: getAllEvents(),
                            builder: (context, AsyncSnapshot snapShot) {
                              if (snapShot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: _widthScale * 30),
                                    height: _heightScale * 197,
                                    width: _widthScale * 315,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                );
                              }

                              if (snapShot.hasData) {
                                if (snapShot.requireData.length > 0) {
                                  var time = event[0]["meetingTime"];
                                  time = time.split(':');
                                  var hours = int.parse(time[0]);
                                  if (hours > 12) {
                                    if (hours == 13) {
                                      hours = 1;
                                    }
                                    if (hours == 14) {
                                      hours = 2;
                                    }
                                    if (hours == 15) {
                                      hours = 3;
                                    }
                                    if (hours == 16) {
                                      hours = 4;
                                    }
                                    if (hours == 17) {
                                      hours = 5;
                                    }
                                    if (hours == 18) {
                                      hours = 6;
                                    }
                                    if (hours == 19) {
                                      hours = 7;
                                    }
                                    if (hours == 20) {
                                      hours = 8;
                                    }
                                    if (hours == 21) {
                                      hours = 9;
                                    }
                                    if (hours == 22) {
                                      hours = 10;
                                    }
                                    if (hours == 23) {
                                      hours = 11;
                                    }
                                    if (hours == 24) {
                                      hours = 0;
                                    }
                                  }
                                  var noon;
                                  if (hours > 12) {
                                    noon = "PM";
                                  }
                                  if (hours < 12) {
                                    noon = "AM";
                                  }

                                  var finalTime = hours.toString() +
                                      ":" +
                                      time[1] +
                                      " " +
                                      noon;

                                  var date = event[0]["Date"];
                                  date = date.split('/');

                                  var mon = int.parse(date[1]);

                                  var finalDate = date[2] +
                                      " " +
                                      months[mon - 1] +
                                      ', ' +
                                      date[0];
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            event[0]['eventPic'] == ''
                                                ? Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                _widthScale *
                                                                    30),
                                                    height: _heightScale * 197,
                                                    width: _widthScale * 315,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Color.fromARGB(
                                                            255, 20, 100, 167)),
                                                  )
                                                : Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                _widthScale *
                                                                    30),
                                                    height: _heightScale * 197,
                                                    width: _widthScale * 315,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Color.fromARGB(
                                                            255, 20, 100, 167)),
                                                  ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: _widthScale *
                                                              45.0,
                                                          top: _heightScale *
                                                              12),
                                                      child: Text(
                                                        getCapitalizeStringaa(
                                                            "${event[0]['title']}"),
                                                        style: GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    _widthScale *
                                                                        16,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                color: whites)),
                                                      ),
                                                    ),
                                                    // Padding(
                                                    //   padding: EdgeInsets.only(
                                                    //       right: _widthScale * 56.0,
                                                    //       top: _heightScale * 12),
                                                    //   child: Image.asset(
                                                    //     "assets/Group 3390.png",
                                                    //     height: _heightScale * 30,
                                                    //     width: _widthScale * 51,
                                                    //   ),
                                                    // ),ski

                                                    SizedBox(
                                                      height: _heightScale * 18,
                                                    ),
                                                    content(
                                                        "assets/cal.png",
                                                        "$finalDate ,"
                                                            " $finalTime"),
                                                    SizedBox(
                                                      height: _heightScale * 5,
                                                    ),
                                                    content("assets/video.png",
                                                        "Online"),
                                                    SizedBox(
                                                      height: _heightScale * 5,
                                                    ),
                                                    content("assets/rupees.png",
                                                        "Rs ${event[0]['amount']}"),
                                                    SizedBox(
                                                      height: _heightScale * 15,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  _widthScale *
                                                                      46.0),
                                                      child: Container(
                                                        height:
                                                            _heightScale * 36,
                                                        width:
                                                            _widthScale * 286,
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              event[0]['closed'] ==
                                                                      'no'
                                                                  ? Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => PoolSession(
                                                                                index: 0,
                                                                                id: event[0]['_id'],
                                                                              )))
                                                                  : null;
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              primary: whites,
                                                              shape:
                                                                  new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius
                                                                        .circular(
                                                                    _widthScale *
                                                                        10.0),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              event[0]['closed'] ==
                                                                      'no'
                                                                  ? 'Attend'
                                                                  : "Closed",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                textStyle: TextStyle(
                                                                    color:
                                                                        text6,
                                                                    fontSize:
                                                                        _widthScale *
                                                                            13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                  );
                                }
                              }
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: _heightScale * 45,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                    child: Text("No Events",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 12,
                                            fontWeight: FontWeight.bold))),
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
            );
          }),
    );
  }

  var nm;
  bool isPress = false;
  Widget box2(String img, String name, String role, String img3,
      String namenextpage, String bio, var imgs, var i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var word = Provider.of<Favourite>(context).fav;
    List ggg = [];
    ggg = vv[i]['company'];
    return Column(
      children: [
        Container(
          height: _heightScale * 300,
          width: _widthScale * 227,
          decoration: BoxDecoration(
            color: name == nm
                ? isPress == true
                    ? text6.withOpacity(0.1)
                    : white(context).withOpacity(0.39)
                : white(context)
                    .withOpacity(0.39), // white(context).withOpacity(0.39),
            borderRadius: BorderRadius.all(Radius.circular(_widthScale * 20)),
            // border: Border.all(color: text6),
          ),
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 10,
              ),
              // CircleAvatar(
              //   radius: _widthScale * 30,
              //   backgroundImage: AssetImage(img),
              // ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  res != null
                      ? res[i]['anonymous'] == 'false'
                          ? res[i]['profilePic'] == ""
                              ? (res[i]['gender'] == "Male" ||
                                      res[i]['gender'] == "Other")
                                  ? Image.asset(
                                      'assets/Men Professional.png',
                                      height: _heightScale * 70,
                                      width: _widthScale * 70,
                                    )
                                  : Image.asset(
                                      'assets/Female Professional.png',
                                      height: _heightScale * 70,
                                      width: _widthScale * 70,
                                    )
                              : Container(
                                  height: _heightScale * 70,
                                  width: _widthScale * 70,
                                  decoration: BoxDecoration(
                                      color: white(context).withOpacity(0.39),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            res[i]['profilePic'],
                                          ),
                                          fit: BoxFit.cover)),
                                )
                          : (res[i]['gender'] == "Male" ||
                                  res[i]['gender'] == "Other")
                              ? Image.asset(
                                  'assets/Men Professional.png',
                                  height: _heightScale * 70,
                                  width: _widthScale * 70,
                                )
                              : Image.asset(
                                  'assets/Female Professional.png',
                                  height: _heightScale * 70,
                                  width: _widthScale * 70,
                                )
                      : (res[i]['gender'] == "Male" ||
                              res[i]['gender'] == "Other")
                          ? Image.asset(
                              'assets/Men Professional.png',
                              height: _heightScale * 70,
                              width: _widthScale * 70,
                            )
                          : Image.asset(
                              'assets/Female Professional.png',
                              height: _heightScale * 70,
                              width: _widthScale * 70,
                            ),
                  // res != null
                  //     ? // res[2]['profilePic'] : '',
                  //     Container(
                  //         height: _heightScale * 50,
                  //         width: _widthScale * 50,
                  //         decoration: BoxDecoration(
                  //             color: white(context).withOpacity(0.39),
                  //             shape: BoxShape.circle,
                  //             image:
                  //                 //  res[i]['profilePic'] == ""
                  //                 //     ? DecorationImage(image: NetworkImage(imggg))
                  //                 DecorationImage(
                  //                     image: NetworkImage(
                  //                       res[i]['profilePic'],
                  //                     ),
                  //                     fit: BoxFit.cover)),
                  //       )
                  //     : Image.asset(
                  //         'assets/Men Professional.png',
                  //         height: _heightScale * 50,
                  //         width: _widthScale * 50,
                  //       ),
                  res[i]['verified'] == 'true'
                      ? Image.asset(
                          "assets/verify.png",
                          height: _heightScale * 20,
                          width: _widthScale * 20,
                          color: Colors.green,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                ],
              ),
              SizedBox(
                height: _heightScale * 16,
              ),
              Text(
                  getCapitalizeStringaa(
                      res[i]['anonymous'] == 'true' ? "Anonymous" : name),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 14,
                    fontWeight: FontWeight.bold,
                  )),

              Text(
                  getCapitalizeStringaa(
                      "Rating : 5/" + "${res[i]['rating'].toString()[0]}"),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 14,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(
                height: _heightScale * 16,
              ),
              Text(
                  getCapitalizeStringaa(ggg.isEmpty
                      ? "Not Mentioned"
                      : vv[i]['company'][0]['title']),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 12,
                  )),
              SizedBox(
                height: _heightScale * 16,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       width: _widthScale * 30,
              //     ),
              //     Image.asset(
              //       img2,
              //       height: _heightScale * 25,
              //       width: _widthScale * 25,
              //     ),
              //     SizedBox(
              //       width: _widthScale * 8.96,
              //     ),
              //     Text(university,
              //         style: GoogleFonts.poppins(
              //           fontSize: _widthScale * 12,
              //         )),
              //   ],
              // ),
              // SizedBox(
              //   height: _heightScale * 16,
              // ),
              Text(
                  getCapitalizeStringaa(ggg.isEmpty
                      ? "Not Mentioned"
                      : vv[i]['company'][0]['company_name']),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 12,
                  )),

              SizedBox(
                height: 20,
              ),
              Container(
                height: _heightScale * 40,
                width: 160,
                child: ElevatedButton(
                    onPressed: () async {
                      nm = name;
                      ti = i;
                      setState(() {
                        isPress = true;
                      });
                      output = await UniqueUser.uniqueUser(res[i]['phone']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile(
                                  img: vv[i]["profilePic"] == ""
                                      ? imggg
                                      : vv[i]["profilePic"],
                                  uniqueid: vv[i]['phone'],
                                  // bio: res[index]["bio"] == null
                                  //     ? "Bio not added yet by professional"
                                  //     : res[index]["bio"],
                                  name: vv[i]["name"],
                                  i: i)));
                      setState(() {
                        isPress = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: name == nm && i == ti
                          ? isPress == true
                              ? text6.withOpacity(0.1)
                              : text6
                          : text6,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: text6),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "View Profile",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: _widthScale * 14,
                              color: Colors.white),
                        ),
                      ),
                    )),
              ),
              // Image.asset(
              //   img3,
              //   height: _heightScale * 30,
              //   width: _widthScale * 107,
              // ),
              SizedBox(
                height: _widthScale * 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool istap = false;
  var ti;
  Widget skills(String title) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Container(
      height: _heightScale * 36,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
          onPressed: () {
            ti = title;
            setState(() {
              istap = true;
            });
            onSubmit(context, title);
          },
          style: ElevatedButton.styleFrom(
            primary: white(context),
            side: BorderSide(color: text6),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(_widthScale * 20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/Skill Set.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: _widthScale * 3.93,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: text6,
                      fontSize: _widthScale * 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }

  Widget topics(String title) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Container(
      margin: EdgeInsets.only(left: _widthScale * 20, right: _widthScale * 20),
      padding:
          EdgeInsets.only(top: _heightScale * 10, bottom: _heightScale * 15),
      decoration: BoxDecoration(
        color: white(context).withOpacity(0.39),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        // leading: Image.asset(
        //   img,
        //   width: _widthScale * 85,
        //   height: _heightScale * 90,
        //   fit: BoxFit.fill,
        // ),
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: _widthScale * 16),
                ),
              ],
            ),
            SizedBox(
              height: _widthScale * 9,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.people,
              color: blue(context),
              size: _widthScale * 18,
            ),
            SizedBox(
              width: _widthScale * 7.93,
            ),
            Text("", style: GoogleFonts.poppins(fontSize: 12, color: text10))
          ],
        ),
      ),
    );
  }

  Widget content(String img, String text) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _widthScale * 50.0),
              child: Image.asset(
                img,
                height: _heightScale * 18,
                width: _widthScale * 16.53,
              ),
            ),
            SizedBox(width: _widthScale * 7.43),
            Text(
              text,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: _widthScale * 12,
                      fontWeight: FontWeight.w300,
                      color: whites)),
            ),
          ],
        )
      ],
    );
  }
}
