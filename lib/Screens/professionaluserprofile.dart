import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/ddddddd.dart';
import 'package:heybuddy/Screens/edit_bio.dart';
import 'package:heybuddy/Screens/new_languages.dart';
import 'package:heybuddy/Screens/new_skills_professional.dart';
import 'package:heybuddy/Screens/professional_history_new_experience.dart';
import 'package:heybuddy/Screens/seeallProfHis.dart';
import 'package:heybuddy/Screens/seeall_edu_profonly.dart';
import 'package:heybuddy/Screens/seeall_professional.dart';
import 'package:heybuddy/Screens/seeall_skills_profonly.dart';
import 'package:heybuddy/Screens/skills_new_experience.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/payout.dart';
import 'package:heybuddy/api/send_noti/send_noti.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/app_drawer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'education_new_experience.dart';

class ProfessionalUserProfile extends StatefulWidget {
  const ProfessionalUserProfile({Key? key}) : super(key: key);

  @override
  _ProfessionalUserProfileState createState() =>
      _ProfessionalUserProfileState();
}

class _ProfessionalUserProfileState extends State<ProfessionalUserProfile> {
  String verifyProgress = "";
  var payout;
  @override
  void initState() {
    _onRefresh();
    getData();
    // getgh();
    // gethh();
    super.initState();
  }

  var tkn = datam.read('f');
  var response;
  List vv = [];
  // List pp = [];
  getData() async {
    response = await getdata(tkn);
    print("object");
    print(response);
    // pp = response;
    return response;
    // setState(() {
    //   vv = [...vv, ...response];
    //   // response;
    // });
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

  var x;
  getgf() async {
    // x = List.generate(
    //     response["skills"] != null ? response["skills"].length : 0,
    // (index) => response["skills"].length.toString());
    x = response["skills"].length;
    print("val of x is$x");
    return x;
  }

  List z = [];
  getgh() async {
    // x = List.generate(
    //     response["skills"] != null ? response["skills"].length : 0,
    // (index) => response["skills"].length.toString());
    z = response["company"];
    print("val of z is$z");
    return z;
  }

  var y;
  getcompanylength() async {
    y = response["company"].length;
    print("val of x is$y");
    return y;
  }

  List zz = [];
  gethh() async {
    zz = response["education"] != null ? response["education"] : "";
    print("val of zz is$zz");
    return zz;
  }

  var yy;
  geteducationlength() async {
    yy = response["education"].length;
    print("val of y is$yy");
    return yy;
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
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

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );
    Widget spacehort = SizedBox(
      width: size.width * 0.06,
    );
    Widget spacehort1 = SizedBox(
      width: size.width * 0.2,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );
    Widget spacevert2 = SizedBox(
      height: size.height * 0.03,
    );
    return Scaffold(
      // backgroundColor: backgroundColor,
      // drawer: CustomAppDrawer(),
      body: SafeArea(
        child: SmartRefresher(
          controller: refreshController,
          enablePullUp: false,
          enablePullDown: true,
          onRefresh: _onRefresh,
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapShot) {
                return SingleChildScrollView(
                  child: response == null
                      ? Container(
                          height: _heightScale * 650,
                          width: double.infinity,
                          child: Center(child: CircularProgressIndicator()))
                      : Column(
                          children: [
                            SizedBox(
                              height: _heightScale * 24,
                            ),
                            Container(
                              color: white(context).withOpacity(0.39),
                              // color: Colors.purple,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // spacehort,
                                  Column(
                                    children: [],
                                  ),
                                  // SizedBox(width: _widthScale * 15),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: white(context),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: _heightScale * 20,
                                        ),
                                        response['profilePic'] == ""
                                            ? (response['gender'] == "Male" ||
                                                    response['gender'] ==
                                                        "Other")
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
                                                width: _widthScale * 110,
                                                decoration: BoxDecoration(
                                                  // border: Border.all()
                                                  shape: BoxShape.circle,
                                                  image:
                                                      //  response['profilePic'] == ""
                                                      //     ? DecorationImage(
                                                      //         image: NetworkImage(imggg))
                                                      //:
                                                      DecorationImage(
                                                          image: NetworkImage(
                                                              response[
                                                                  'profilePic']),
                                                          fit: BoxFit.fill),
                                                ),
                                              ),
                                        Row(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: [
                                            FutureBuilder(
                                                future: getgh(),
                                                builder: (context, snapshot) {
                                                  return box2(
                                                      // "assets/Ellipse 9.png",
                                                      response != null
                                                          ? response['name']
                                                          : '',
                                                      // "Sr Technical Program Manager",
                                                      z.isEmpty
                                                          ? "Not Mentioned Yet"
                                                          : response['company']
                                                              [0]['title'],
                                                      // "",
                                                      "assets/Education.png",
                                                      // "University Of HartFort",
                                                      // response['university'] != ""
                                                      //     ? response['university']
                                                      //     :
                                                      'No Educational details',
                                                      // "assets/Rectangle 704.png",
                                                      z.isEmpty
                                                          ? "Not Mentioned Yet"
                                                          : response['company']
                                                                  [0]
                                                              ['company_name'],
                                                      response != null
                                                          ? response['HKTID']
                                                          : ''
                                                      // response['company']==[]?"": response['company'][0]
                                                      // ['company_name'],
                                                      );
                                                }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //spacevert2,
                            // SizedBox(
                            //   height: _heightScale * 46.84,
                            // ),
                            Container(
                              color: white(context).withOpacity(0.39),
                              child: Column(
                                children: [
                                  // SizedBox(height: _heightScale * 16),

                                  // SizedBox(height: _heightScale * ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: _widthScale * 22.5,
                                        right: _widthScale * 22.5,
                                        bottom: _heightScale * 15),
                                    child: //bioname(FontWeight.bold)
                                        Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Account Details :",
                                              style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: black(context)),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "E-Mail : " + response['email'],
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 14,
                                          ),
                                        ),
                                        Text(
                                          "Phone Number : " + response['phone'],
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Bio :",
                                              style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: black(context)),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          // "Profile of a line describes a tolerance zone around any line in any feature, usually of a curved shape. Profile of a line is a 2-Dimensional tolerance range that can be applied to any linear tolerance.",
                                          getCapitalizeStringaa(
                                              response['bio'] != null
                                                  ? response['bio']
                                                  : "Add Your Bio"),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditBioFormFill(
                                                    bio: response['bio'] != null
                                                        ? response['bio']
                                                        : "",
                                                    image: response[
                                                                'profilePic'] ==
                                                            ""
                                                        ? imggg
                                                        : response[
                                                            'profilePic'],
                                                  ))).then((value) {
                                        setState(() {
                                          getData();
                                        });
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      color: white(context).withOpacity(0.39),
                                      margin: EdgeInsets.only(
                                          top: _heightScale * 0),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: _heightScale * 10.0,
                                            bottom: _heightScale * 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Edit",
                                              style: GoogleFonts.poppins(
                                                color: black(context),
                                                fontSize: _widthScale * 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: _widthScale * 8,
                                            ),
                                            Image.asset("assets/Group 1067.png",
                                                height: _heightScale * 24,
                                                width: _widthScale * 24),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: _heightScale * 16),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: _heightScale * 20.0),
                                    child: Row(
                                      children: [
                                        SingleChildScrollView(
                                          child: Container(
                                            // color: Colors.yellow,
                                            // height: _heightScale * 70,
                                            width: _widthScale * 375,
                                            child: ListTile(
                                              leading: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 2.0),
                                                child: Text(
                                                  "Languages Known : ",
                                                  style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: black(context)),
                                                ),
                                              ),
                                              title: Text(
                                                // "English, Hindi, Punjabi,Marathi ",
                                                getCapitalizeStringaa(
                                                    response["languages"]
                                                            .isEmpty
                                                        ? "Add Languages"
                                                        : response["languages"]
                                                            .toString()
                                                            .replaceAll("[", "")
                                                            .replaceAll("]", "")
                                                            .trim()),
                                                style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 14,
                                                ),
                                              ),
                                              trailing: Padding(
                                                padding: EdgeInsets.only(
                                                    right: _widthScale * 8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                NewLanguages())).then(
                                                        (value) {
                                                      setState(() {
                                                        getData();
                                                      });
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: greyp(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Container(
                                        //   color: Colors.yellow,
                                        //   width: MediaQuery.of(context)
                                        //           .size
                                        //           .width *
                                        //       0.9,
                                        //   child:
                                        //   Row(
                                        //     children: [
                                        //       spacehort,
                                        //       Text(
                                        //         "Languages Known : ",
                                        //         style: GoogleFonts.poppins(
                                        //             fontSize: _widthScale * 14,
                                        //             fontWeight: FontWeight.bold,
                                        //             color: black(context)),
                                        //       ),
                                        //       Column(
                                        //         children: [
                                        //           Text(
                                        //             ": English, Hindi, Punjabi,Marathi ",
                                        //             // response["languages"]
                                        //             //     .toString()
                                        //             //     .replaceAll("[", "")
                                        //             //     .replaceAll("]", ""),
                                        //             style: GoogleFonts.poppins(
                                        //                 fontSize:
                                        //                     _widthScale * 14,
                                        //                 color: text11),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // GestureDetector(
                                        //   onTap: () {
                                        //     Navigator.push(
                                        //         context,
                                        //         MaterialPageRoute(
                                        //             builder: (context) =>
                                        //                 NewLanguages()));
                                        //   },
                                        //   child: Icon(
                                        //     Icons.edit,
                                        //     color: Colors.grey,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: _heightScale * 16),

                            Container(
                              color: white(context).withOpacity(0.39),
                              height: _heightScale * 50,
                              child: Row(
                                children: [
                                  spacehort,
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: _heightScale * 0.0),
                                    child: Text("Professional History",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: _widthScale * 18,
                                            color:
                                                Styles.isDark ? text6 : text5)),
                                  ),
                                  SizedBox(
                                    width: _widthScale * 106,
                                  ),
                                  Text(
                                      response == null
                                          ? ""
                                          : response['experience'] == null
                                              ? "0 Yrs"
                                              : "${response['experience'].toString()}  Yrs",
                                      style: GoogleFonts.poppins(
                                          color: Styles.isDark ? text6 : text5,
                                          fontSize: _widthScale * 14,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            FutureBuilder(
                                future: getcompanylength(),
                                builder: (context, snapShot) {
                                  return FutureBuilder(
                                      future: getgh(),
                                      builder: (context, snapShot) {
                                        print("EEEEEE" + "${z.length}");
                                        return z.isEmpty
                                            ? Container(
                                                height: _heightScale * 80,
                                                width: double.infinity,
                                                child: Center(
                                                  child: Text(
                                                    "No professional history added, please add",
                                                    style: GoogleFonts.poppins(
                                                        fontSize:
                                                            _widthScale * 14,
                                                        color: black(context)),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: y == 1
                                                    ? _heightScale * 110
                                                    : _heightScale * 195,
                                                width: double.infinity,
                                                child: ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        y != null ? y : 0,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return topicsprofessionalhistory(
                                                          "assets/Employment.png",
                                                          // response["company"] != []
                                                          //     ?
                                                          response["company"][
                                                                          index]
                                                                      [
                                                                      'title'] ==
                                                                  ""
                                                              ? "Not Mentioned Yet"
                                                              : response["company"]
                                                                      [index]
                                                                  ['title'],
                                                          // : "Enter Your Details",
                                                          response["company"]
                                                                  [index]
                                                              ['company_name'],
                                                          response["company"]
                                                                          [index]
                                                                      [
                                                                      'year'] ==
                                                                  0
                                                              ? '${response["company"][index]['month']} months'
                                                              : '${response["company"][index]['year']} Yrs' +
                                                                  ' ${response["company"][index]['month']} months');
                                                    }),
                                              );
                                      });
                                }),
                            // topics("assets/Rectangle 8.png",
                            //     "Sr Technical Program Manager", "PlayStation"),
                            Container(
                              width: double.infinity,
                              color: white(context).withOpacity(0.39),
                              margin: EdgeInsets.only(top: _heightScale * 5),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: _heightScale * 10.0,
                                    left: _widthScale * 24,
                                    right: _widthScale * 24,
                                    bottom: _heightScale * 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SeeAllHistoryProfOnly()))
                                              .then((value) {
                                            setState(() {
                                              getData();
                                            });
                                          });
                                        },
                                        child: Container(
                                          // color: Colors.yellow,
                                          child: Center(
                                            child: Text(
                                              "See All ($y)",
                                              style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 14,
                                                  color: text6),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProffesionalHistoryFormFill()))
                                              .then((value) {
                                            setState(() {
                                              getData();
                                            });
                                          });
                                        },
                                        child: Container(
                                          // color: Colors.pink,
                                          child: Center(
                                            child: Text(
                                              "Add new",
                                              style: GoogleFonts.poppins(
                                                  fontSize: _widthScale * 14,
                                                  color: text6),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _heightScale * 5,
                            ),
                            Container(
                              color: white(context).withOpacity(0.39),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: _widthScale * 20.0,
                                    vertical: _heightScale * 10),
                                child: Column(
                                  children: [
                                    FutureBuilder(
                                        future: payOut(tkn),
                                        builder:
                                            (context, AsyncSnapshot snapShot) {
                                          if (snapShot.hasData) {
                                            var data = snapShot.requireData;
                                            print("RTCSF :" +
                                                data.commission.toString());
                                            payout = data.commission;
                                            return Row(
                                              children: [
                                                Text(
                                                  "Payout Ratio : ${data.commission}%",
                                                  style: GoogleFonts.poppins(
                                                      fontSize:
                                                          _widthScale * 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: black(context)),
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          _widthScale *
                                                                              12),
                                                            ),
                                                            title: Text(
                                                              "Pay Out ratio is the commision that you earn for taking bookings. Pay-out ratio is automatically calculated based on your professional history and years of experience.",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: black(
                                                                        context)),
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Image.asset(
                                                    "assets/i.png",
                                                    height: 20,
                                                  ),
                                                )
                                              ],
                                            );
                                          }
                                          return Container();
                                        }),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _heightScale * 25,
                            ),
                            Container(
                              color: white(context).withOpacity(0.39),
                              height: _heightScale * 50,
                              child: Row(
                                children: [
                                  spacehort,
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: _heightScale * 0.0),
                                    child: Text("Education",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: _widthScale * 18,
                                            color:
                                                Styles.isDark ? text6 : text5)),
                                  ),
                                ],
                              ),
                            ),
                            FutureBuilder(
                                future: geteducationlength(),
                                builder: (context, snapShot) {
                                  return FutureBuilder(
                                      future: gethh(),
                                      builder: (context, snapShot) {
                                        return zz.isEmpty
                                            ? Container(
                                                height: _heightScale * 80,
                                                width: double.infinity,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: _heightScale * 20.0),
                                                  child: Center(
                                                    child: Text(
                                                      "Add Your Education History ",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      14,
                                                              color: black(
                                                                  context)),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: yy == 1
                                                    ? _heightScale * 110
                                                    : _heightScale * 195,
                                                width: double.infinity,
                                                child: ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        yy != null ? yy : 0,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return topics(
                                                          "assets/Education.png",
                                                          // response["company"] != []
                                                          //     ?
                                                          response["education"][
                                                                          index]
                                                                      ['uni'] ==
                                                                  ""
                                                              ? "Not Mentioned Yet"
                                                              : response[
                                                                      "education"]
                                                                  [
                                                                  index]['uni'],
                                                          // : "Enter Your Details",
                                                          response["education"]
                                                                  [index]
                                                              ['course']);
                                                    }),
                                              );
                                      });
                                }),
                            // topics(
                            //     "assets/Education.png",
                            //     // "Delhi Technological University",
                            //     response['university'] != ""
                            //         ? response['university']
                            //         : 'Enter Your Educational details',
                            //     "Bachelor Of Technology"),

                            Container(
                              width: double.infinity,
                              color: white(context).withOpacity(0.39),
                              margin: EdgeInsets.only(top: _heightScale * 5),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: _heightScale * 10.0,
                                    bottom: _heightScale * 10),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SeeAllEducationProfOnly()))
                                                .then((value) {
                                              setState(() {
                                                getData();
                                              });
                                            });
                                          },
                                          child: Container(
                                            // color: Colors.yellow,
                                            child: Center(
                                              child: Text(
                                                "See All ($yy)",
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 14,
                                                    color: text6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EducationFormFill()))
                                                .then((value) {
                                              setState(() {
                                                getData();
                                              });
                                            });
                                          },
                                          child: Container(
                                            // color: Colors.pink,
                                            child: Center(
                                              child: Text(
                                                "Add new",
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 14,
                                                    color: text6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _heightScale * 25,
                            ),
                            Container(
                              color: white(context).withOpacity(0.39),
                              height: _heightScale * 43,
                              child: Row(
                                children: [
                                  spacehort,
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: _heightScale * 0.0),
                                    child: Text("Skills",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 18,
                                            color:
                                                Styles.isDark ? text6 : text5,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: _heightScale * 10,
                                    ),
                                    FutureBuilder(
                                        future: getgf(),
                                        builder: (context, snapShot) {
                                          return Container(
                                            height: _heightScale * 135,
                                            width: _widthScale *
                                                350, // double.infinity,
                                            child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                // gridDelegate:
                                                //     const SliverGridDelegateWithMaxCrossAxisExtent(
                                                //         maxCrossAxisExtent: 160,
                                                //         childAspectRatio: 6 / 2,
                                                //         // mainAxisExtent: 2,
                                                //         crossAxisSpacing: 5,
                                                //         mainAxisSpacing: 10),
                                                itemCount: x != null ? x : 0,
                                                itemBuilder:
                                                    (context, int index) {
                                                  return button(
                                                      response["skills"][index]
                                                          ['name'],
                                                      // response["skills"][index]
                                                      // ['_id'],
                                                      response["skills"][index]
                                                              ['price']
                                                          .toString(),
                                                      text6,
                                                      white(context));
                                                }),
                                          );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   color: white.withOpacity(0.39),
                            //   child: Padding(
                            //     padding: EdgeInsets.all(_widthScale * 20.0),
                            //     child: Column(
                            //       children: [
                            //         Row(
                            //           children: [
                            //             button("C++", text6, white),
                            //             SizedBox(
                            //               width: _widthScale * 10,
                            //             ),
                            //             button("Java", text6, white),
                            //             SizedBox(
                            //               width: _widthScale * 10,
                            //             ),
                            //             button("Flutter", text6, white),
                            //           ],
                            //         ),
                            //         SizedBox(
                            //           height: _heightScale * 16,
                            //         ),
                            //         Row(
                            //           children: [
                            //             button("SQL", text6, white),
                            //             SizedBox(
                            //               width: _widthScale * 10,
                            //             ),
                            //             button("Java", text6, white),
                            //             SizedBox(
                            //               width: _widthScale * 10,
                            //             ),
                            //             button("Java", text6, white),
                            //           ],
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Container(
                              width: double.infinity,
                              color: white(context).withOpacity(0.39),
                              margin: EdgeInsets.only(top: _heightScale * 5),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: _heightScale * 10.0,
                                    bottom: _heightScale * 10),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SeeAllSkillsProfOnly()))
                                                .then((value) {
                                              setState(() {
                                                getData();
                                              });
                                            });
                                          },
                                          child: Container(
                                            // color: Colors.yellow,
                                            child: Center(
                                              child: Text(
                                                "See All ($x)",
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 14,
                                                    color: text6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            NewSkills()))
                                                .then((value) {
                                              setState(() {
                                                getData();
                                              });
                                            });
                                          },
                                          child: Container(
                                            // color: Colors.pink,
                                            child: Center(
                                              child: Text(
                                                "Add new",
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 14,
                                                    color: text6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: _heightScale * 25,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: _heightScale * 0.0, left: 20),
                                  child: Text("Verification Status : ",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: _widthScale * 18,
                                          color:
                                              Styles.isDark ? text6 : text5)),
                                ),
                                response["verificationRequested"] == "false"
                                    ? InkWell(
                                        onTap: () {
                                          sendVerify(tkn);
                                        },
                                        child: Container(
                                          child:
                                              Text("Send Verification Request"),
                                        ),
                                      )
                                    : Text(response["verificationRequested"]
                                        .toString()
                                        .toUpperCase()),
                              ],
                            )
                          ],
                        ),
                );
              }),
        ),
      ),
    );
  }

  Widget button(String time, String amt, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Row(
      children: [
        SizedBox(
          width: _widthScale * 20,
        ),
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_widthScale * 5.0)),
            child: Image.asset(
              "assets/Skill Set.png",
              height: _heightScale * 50,
              width: _widthScale * 50,
              fit: BoxFit.fill,
            )),
        Padding(
          padding: EdgeInsets.only(
              top: _heightScale * 10.0,
              left: _widthScale * 10,
              right: _widthScale * 20),
          child: Container(
            height: _heightScale * 56,
            width: _widthScale * 250, //double.infinity,
            decoration: BoxDecoration(
                color: white(context).withOpacity(0.39),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                    color:
                        // isLoading == true ? white.withOpacity(0.39) :
                        text6)),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getCapitalizeStringaa(time),
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 14,
                        color: text6,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    ' | Rs $amt',
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 14,
                        color: text6,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       primary: col,
            //       shape: new RoundedRectangleBorder(
            //         borderRadius: new BorderRadius.circular(50.0),
            //       ),
            //     ),
            //     child: Padding(
            //       padding: EdgeInsets.all(_widthScale * 10.0),
            //       child: Text(
            //         time,
            //         style: GoogleFonts.poppins(
            //             fontSize: _widthScale * 14, color: col2),
            //       ),
            //     )),
          ),
        ),
      ],
    );
  }

  Widget buttona(String time, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            // SizedBox(
            //   height: _heightScale * 10,
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  height: _heightScale * 32,
                  width: _widthScale * 100,
                  decoration: BoxDecoration(
                    color: col,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: _widthScale * 10,
                        right: _widthScale * 5,
                        top: _heightScale * 5,
                        bottom: _heightScale * 5),
                    child: Text(
                      time,
                      style: GoogleFonts.poppins(
                          fontSize: _widthScale * 14, color: col2),
                    ),
                  )),
            ),
            SizedBox(
              height: _heightScale * 5,
            ),
          ],
        ),
      ],
    );
  }

  Widget topicsprofessionalhistory(
      String img, String title, String subtitle, String time) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      margin: EdgeInsets.only(
          left: _widthScale * 10,
          right: _widthScale * 10,
          top: _heightScale * 5),
      padding:
          EdgeInsets.only(top: _heightScale * 10, bottom: _heightScale * 10),
      decoration: BoxDecoration(
        color: white(context).withOpacity(0.39),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_widthScale * 5.0)),
            child: Image.asset(
              img,
              height: _heightScale * 60,
              width: _widthScale * 55,
              fit: BoxFit.fill,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getCapitalizeStringaa(title),
              style: GoogleFonts.poppins(fontSize: _widthScale * 16),
            ),
            SizedBox(
              height: _heightScale * 3,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getCapitalizeStringaa(subtitle),
                    style: GoogleFonts.poppins(fontSize: _widthScale * 12)),
                SizedBox(
                  height: _heightScale * 2,
                ),
                Row(
                  children: [
                    Text(time, style: GoogleFonts.poppins(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget topics(String img, String title, String subtitle) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      margin: EdgeInsets.only(
          left: _widthScale * 10,
          right: _widthScale * 10,
          top: _heightScale * 5),
      padding:
          EdgeInsets.only(top: _heightScale * 10, bottom: _heightScale * 10),
      decoration: BoxDecoration(
        color: white(context).withOpacity(0.39),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_widthScale * 5.0)),
            child: Image.asset(
              img,
              height: _heightScale * 58,
              width: _widthScale * 55,
              fit: BoxFit.fill,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getCapitalizeStringaa(title),
              style: GoogleFonts.poppins(fontSize: _widthScale * 16),
            ),
            SizedBox(
              height: _heightScale * 6,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Column(
              children: [
                Text(getCapitalizeStringaa(subtitle),
                    style: GoogleFonts.poppins(fontSize: _widthScale * 12)),
                // SizedBox(
                //   height: 8,
                // ),
                // Row(
                //   children: [
                //     Text("2018-2022",
                //         style: GoogleFonts.poppins(fontSize: 12, color: text10)),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget box2(String name, String role, String img2, String university,
      String company, String id) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        Container(
          height: _heightScale * 160,
          width: _widthScale * 250,
          // width: double.infinity,
          child: Column(
            children: [
              // SizedBox(
              //   height: _heightScale * 32.5,
              // ),
              // CircleAvatar(
              //   radius: _widthScale * 40,
              //   backgroundImage: AssetImage(img),
              // ),

              SizedBox(
                height: _heightScale * 15.2,
              ),
              Text(getCapitalizeStringaa(name),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 14,
                    fontWeight: FontWeight.bold,
                  )),

              Text(getCapitalizeStringaa(id),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 12,
                  )),
              SizedBox(
                height: _heightScale * 15.2,
              ),
              Text(getCapitalizeStringaa(role),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 12,
                  )),

              SizedBox(
                height: _heightScale * 15.2,
              ),
              // Image.asset(
              //   img3,
              //   height: _heightScale * 30,
              //   width: _widthScale * 107,
              // ),
              Text(getCapitalizeStringaa(company),
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 12,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Text bioname() {
    return Text(
      // "Profile of a line describes a tolerance zone around any line in any feature, usually of a curved shape. Profile of a line is a 2-Dimensional tolerance range that can be applied to any linear tolerance.",
      "Bio : ",
      style: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.bold, color: text11),
    );
  }

  sendVerify(tkn) async {
    try {
      var response = await https.get(
          Uri.parse(
              'https://heybuddybackend.herokuapp.com/api/user/verificationRequested'),
          headers: {"x-access-token": "$tkn"});

      var result = json.decode(response.body) as Map<String, dynamic>;

      setState(() {
        verifyProgress =
            json.decode(response.body)["professional"]["verificationRequested"];
      });

      print('RRRRRRRRRRRRRRRRRRtt : $verifyProgress');

      if (response.statusCode == 200) {
        return verifyProgress;
      } else if (response.statusCode == 400) {
      } else {
        return null;
      }
    } catch (e) {
      print("RRRRRRRRRRRRRRRRRR" + e.toString());
    }
  }
}
