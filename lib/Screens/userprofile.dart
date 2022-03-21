import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/seeall_professional.dart';
import 'package:heybuddy/Screens/seeall_skills.dart';
import 'package:heybuddy/Screens/seealleducation.dart';
import 'package:heybuddy/Screens/slotbooktime.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/getProfessionalUsers.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'education_new_experience.dart';

class UserProfile extends StatefulWidget {
  var name;
  var uniqueid;
  var img;
  var i;
  // var skills;
  UserProfile({
    required this.name,
    required this.uniqueid,
    required this.img,
    required this.i,
    // required this.skills,
  });
  // const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var res;
  List vv = [];
  getUsers(page) async {
    res = await getProfessionalData(page);
    vv = res;
  }

  @override
  void initState() {
    super.initState();
    onTap();
    getData();
    // getcompanylength();
    // getgf();
    // getgh();
  }

  var tkn = datam.read('f');
  var responsevv;
  // List vv = [];
  // List pp = [];
  getData() async {
    responsevv = await getdata(tkn);
    // pp = response;
    return responsevv;
    // setState(() {
    //   vv = [...vv, ...response];
    //   // response;
    // });
  }

  List x = [];
  var xy;

  var output;
  onTap() async {
    output = await UniqueUser.uniqueUser(widget.uniqueid);
    return output;
  }

  getgf() async {
    x = output['user'][0]["skills"];
    return x;
  }

  List z = [];
  getgh() async {
    z = output['user'][0]["company"];
    print("val of x is$z");
    return z;
  }

  var y;
  getcompanylength() async {
    y = output['user'][0]["company"].length;
    print("vy  is$y");
    return y;
  }

  List zz = [];
  gethh() async {
    zz = output['user'][0]["education"];
    print("val of x is$zz");
    return zz;
  }

  var yy;
  geteducationlength() async {
    yy = output['user'][0]["education"].length;
    print("vy  is$yy");
    return yy;
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

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;
    // Widget spacevert = SizedBox(
    //   height: size.height * 0.04,
    // );
    Widget spacehort = SizedBox(
      width: size.width * 0.06,
    );
    // Widget spacehort1 = SizedBox(
    //   width: size.width * 0.1,
    // );
    // Widget spacevert1 = SizedBox(
    //   height: size.height * 0.02,
    // );
    // Widget spacevert2 = SizedBox(
    //   height: size.height * 0.03,
    // );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: (() {
              Get.back();
            }),
            child: Icon(
              Icons.arrow_back_ios,
              color: Styles.isDark ? text7 : Colors.black,
            ),
          ),
          title: Text(
            "Profile View",
            style: TextStyle(
                color: Styles.isDark ? text7 : Colors.black,
                fontWeight: FontWeight.bold),
          )),
      // backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.87,
              // color: Colors.yellow,
              width: double.infinity,
              child: FutureBuilder(
                  future: onTap(),
                  builder: (context, snapShot) {
                    return SingleChildScrollView(
                      child: output == null
                          ? Container(
                              height: _heightScale * 900,
                              width: double.infinity,
                              child: Center(child: CircularProgressIndicator()))
                          : Column(
                              children: [
                                SizedBox(
                                  height: _heightScale * 24,
                                ),
                                Container(
                                  color: white(context).withOpacity(0.39),
                                  // color: Colors.yellow,
                                  child: Row(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      spacehort,
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: _heightScale * 24,
                                            // width: size.width * 0.96,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: _widthScale * 45),
                                      Container(
                                        color: white(context).withOpacity(0.39),
                                        child: FutureBuilder(
                                            future: getgh(),
                                            builder: (context, snapShot) {
                                              return Row(
                                                children: [
                                                  box2(
                                                    output['user'][0][
                                                                'profilePic'] !=
                                                            ""
                                                        ? output['user'][0]
                                                            ['profilePic']
                                                        : imggg,
                                                    // "assets/Ellipse 9.png",
                                                    // "Manideep Mittapelli",
                                                    output['user'][0]['name'],
                                                    z.isNotEmpty
                                                        ? output['user'][0][
                                                                        'company'][0]
                                                                    ['title'] ==
                                                                ""
                                                            ? "Not Mentioned"
                                                            : output['user'][0]
                                                                    ['company']
                                                                [0]['title']
                                                        : "Not Mentioned yet",
                                                    "assets/Education.png",

                                                    // output['user'][0][
                                                    //             'university'] !=
                                                    //         ""
                                                    //     ? output['user'][0]
                                                    //         ['university']
                                                    //     :
                                                    "Not Mentioned Yet",
                                                    z.isNotEmpty
                                                        ? output['user'][0]
                                                                ['company'][0]
                                                            ['company_name']
                                                        : "Not Mentioned yet",
                                                    z.isNotEmpty
                                                        ? output['user'][0]
                                                            ['HKTID']
                                                        : "Not Mentioned yet",
                                                  ),
                                                ],
                                              );
                                            }),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: _heightScale * 24,
                                            // width: size.width * 0.96,
                                          ),
                                          // Container(
                                          //   child: Image.asset(
                                          //     "assets/Group 33900.png",
                                          //     height: _heightScale * 24,
                                          //     width: _widthScale * 73,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: _heightScale * 25.84,
                                ),
                                Container(
                                  color: white(context).withOpacity(0.39),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: _heightScale * 20.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              // color: Colors.yellow,
                                              height: _heightScale * 70,
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
                                                  getCapitalizeStringaa(output[
                                                                  'user'][0]
                                                              ["languages"]
                                                          .isEmpty
                                                      ? "No Languages added"
                                                      : output['user'][0]
                                                              ["languages"]
                                                          .toString()
                                                          .replaceAll("[", "")
                                                          .replaceAll("]", "")
                                                          .trim()),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 14,
                                                  ),
                                                ),
                                                // trailing: Padding(
                                                //   padding: EdgeInsets.only(
                                                //       right: _widthScale * 8.0),
                                                //   child: GestureDetector(
                                                //     child: Icon(
                                                //       Icons.edit,
                                                //       color: Colors.grey,
                                                //     ),
                                                //   ),
                                                // ),
                                              ),
                                            ),
                                            // spacehort,
                                            // Text(
                                            //   "Languages Known : ",
                                            //   style: GoogleFonts.poppins(
                                            //       fontSize: _widthScale * 14,
                                            //       fontWeight: FontWeight.bold,
                                            //       color: black(context)),
                                            // ),
                                            // Text(
                                            //   // ": English, Hindi, Punjabi ",
                                            //   getCapitalizeStringaa(
                                            //       output['user'][0]["languages"]
                                            //               .isEmpty
                                            //           ? "Add Languages"
                                            //           : output['user'][0]
                                            //                   ["languages"]
                                            //               .toString()
                                            //               .replaceAll("[", "")
                                            //               .replaceAll("]", "")
                                            //               .trim()),
                                            //   style: GoogleFonts.poppins(
                                            //       fontSize: _widthScale * 14,
                                            //       color: text11),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: _heightScale * 16,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: _widthScale * 22.5,
                                            right: _widthScale * 22.5,
                                            bottom: _heightScale * 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Bio :",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: black(
                                                                  context)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              // "Profile of a line describes a tolerance zone around any line in any feature, usually of a curved shape. Profile of a line is a 2-Dimensional tolerance range that can be applied to any linear tolerance.",
                                              // widget.bio,
                                              // res[widget.i]['bio'] != null
                                              //     ? res[widget.i]['bio']
                                              //     : 'Not Mentioned Yet',
                                              getCapitalizeStringaa(
                                                  output['user'][0]['bio'] !=
                                                          null
                                                      ? output['user'][0]['bio']
                                                      : "Not Mentioned Yet"),
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                fontSize: _widthScale * 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: _heightScale * 20,
                                ),
                                Container(
                                  color: white(context).withOpacity(0.39),
                                  height: _heightScale * 43,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Row(
                                      children: [
                                        spacehort,
                                        Text("Professional History",
                                            style: GoogleFonts.poppins(
                                                fontSize: _widthScale * 18,
                                                color: Styles.isDark
                                                    ? text6
                                                    : text5,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: _widthScale * 106,
                                        ),
                                        Text(
                                            output == null
                                                ? ""
                                                : output['experience'] == ""
                                                    ? ""
                                                    : "${output['experience'].toString()}  Yrs",
                                            style: GoogleFonts.poppins(
                                                color: Styles.isDark
                                                    ? text6
                                                    : text5,
                                                fontSize: _widthScale * 14,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                                FutureBuilder(
                                    future: getcompanylength(),
                                    builder: (context, snapShot) {
                                      return FutureBuilder(
                                          future: getgh(),
                                          builder: (context, snapShot) {
                                            return z.isEmpty
                                                ? Container(
                                                    height: _heightScale * 80,
                                                    width: double.infinity,
                                                    child: Center(
                                                      child: Text(
                                                        "Not Mentioned Yet ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        14,
                                                                color: black(
                                                                    context)),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: y == 1
                                                        ? _heightScale * 110
                                                        : _heightScale *
                                                            200, // _heightScale * 240,
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
                                                              output['user'][0]["company"][index][
                                                                          'title'] ==
                                                                      ""
                                                                  ? "Not Mentioned"
                                                                  : output['user'][0]
                                                                          ["company"][index]
                                                                      ['title'],
                                                              // : "Enter Your Details",
                                                              output['user'][0]
                                                                          ["company"]
                                                                      [index][
                                                                  'company_name'],
                                                              output['user'][0]["company"][index]['year'] == 0
                                                                  ? '${output['user'][0]["company"][index]['month']} months'
                                                                  : '${output['user'][0]["company"][index]['year']} Yrs' +
                                                                      ' ${output['user'][0]["company"][index]['month']} months');
                                                        }),
                                                  );
                                          });
                                    }),
                                // topics(
                                //     "assets/Rectangle 8.png",
                                //     "Sr Technical Program Manager",
                                //     "PlayStation"),
                                // topics(
                                //     "assets/Rectangle 8.png",
                                //     "Sr Technical Program Manager",
                                //     "PlayStation"),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SeeAllHistory(
                                                  uniqueid: widget.uniqueid,
                                                )));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: white(context).withOpacity(0.39),
                                    margin:
                                        EdgeInsets.only(top: _heightScale * 20),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10),
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
                                SizedBox(
                                  height: _heightScale * 20,
                                ),
                                Container(
                                  color: white(context).withOpacity(0.39),
                                  height: _heightScale * 43,
                                  child: Row(
                                    children: [
                                      spacehort,
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 0.0),
                                        child: Text("Education",
                                            style: GoogleFonts.poppins(
                                                fontSize: _widthScale * 18,
                                                color: Styles.isDark
                                                    ? text6
                                                    : text5,
                                                fontWeight: FontWeight.bold)),
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
                                                    child: Center(
                                                      child: Text(
                                                        "Not Mentioned Yet ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        14,
                                                                color: black(
                                                                    context)),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: yy == 1
                                                        ? _heightScale * 110
                                                        : _heightScale * 200,
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
                                                              output['user'][0]["education"]
                                                                              [index]
                                                                          [
                                                                          'uni'] ==
                                                                      ""
                                                                  ? "Not Mentioned"
                                                                  : output['user']
                                                                              [0]
                                                                          ["education"][index]
                                                                      ['uni'],
                                                              // : "Enter Your Details",
                                                              output['user'][0][
                                                                          "education"]
                                                                      [index]
                                                                  ['course']);
                                                        }),
                                                  );
                                          });
                                    }),
                                // topics(
                                //     "assets/Education.png",
                                //     // "Delhi Technological University",
                                //     // res[widget.i]['university'] != ""
                                //     //     ? res[widget.i]['university']
                                //     //     : 'Not Mentioned Yet',
                                //     output['user'][0]['university'] != ""
                                //         ? output['user'][0]['university']
                                //         : "Not Mentioned Yet",
                                //     "Bachelor Of Technology"),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SeeAllEducation(
                                                  uniqueid: widget.uniqueid,
                                                )));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: white(context).withOpacity(0.39),
                                    margin:
                                        EdgeInsets.only(top: _heightScale * 20),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: _heightScale * 10.0,
                                          bottom: _heightScale * 10),
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
                                SizedBox(
                                  height: _heightScale * 20,
                                ),
                                Container(
                                  color: white(context).withOpacity(0.39),
                                  height: _heightScale * 43,
                                  child: Row(
                                    children: [
                                      spacehort,
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: _heightScale * 8.0),
                                        child: Text("Skills",
                                            style: GoogleFonts.poppins(
                                                fontSize: _widthScale * 18,
                                                color: Styles.isDark
                                                    ? text6
                                                    : text5,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        FutureBuilder(
                                            future: getgf(),
                                            builder: (context, snapShot) {
                                              return x.isEmpty
                                                  ? Container(
                                                      height: _heightScale * 50,
                                                      width: _widthScale *
                                                          375, //double.infinity,
                                                      // color: Colors.yellow,
                                                      child: Center(
                                                          child: Text(
                                                        "No Skills added",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        14,
                                                                color: black(
                                                                    context)),
                                                      )),
                                                    )
                                                  : Container(
                                                      height:
                                                          _heightScale * 135,
                                                      width: _widthScale *
                                                          300, // double.infinity,
                                                      child: ListView.builder(
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          itemCount: output['user']
                                                                          [0][
                                                                      "skills"] !=
                                                                  null
                                                              ? output['user']
                                                                          [0]
                                                                      ["skills"]
                                                                  .length
                                                              : 0,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Container(
                                                                child: button(
                                                                    output['user'][0]["skills"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        'name'],
                                                                    output['user'][0]["skills"][index]
                                                                            [
                                                                            'price']
                                                                        .toString(),
                                                                    text6,
                                                                    white(
                                                                        context)));
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SeeAllSkills(
                                                uniqueid: widget.uniqueid)));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    color: white(context).withOpacity(0.39),
                                    margin:
                                        EdgeInsets.only(top: _heightScale * 20),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: _heightScale * 10.0,
                                          bottom: _heightScale * 10),
                                      child: Center(
                                        child: Text(
                                          "See All (${x.length})",
                                          style: GoogleFonts.poppins(
                                              fontSize: _widthScale * 14,
                                              color: text6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FutureBuilder(
          future: getData(),
          builder: (context, snapShot) {
            return FutureBuilder(
                future: onTap(),
                builder: (context, snapShot) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _widthScale * 24.0),
                    child:
                        // if(output) output['user'][0]['_id'] != responsevv['_id']

                        Container(
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      // color: Colors.yellow,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                          onPressed: () async {
                            print("phone is${output['user'][0]["phone"]}");
                            print(
                                "phone isssssss${output['user'][0]["available"]}");
                            if (output['user'][0]["available"] == "false") {
                              if (output['user'][0]['_id'] !=
                                  responsevv['_id']) {
                                var fcmToken =
                                    output['user'][0]['fcmtoken'].toString();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SlotBookTime(
                                            i: output['user'][0]["phone"],
                                            fcm: fcmToken)));
                              } else {
                                const snackBar = SnackBar(
                                  content: Text(
                                      "You cannot Book Session to yourself"),
                                  duration: Duration(milliseconds: 2000),
                                  backgroundColor: text6,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } else if (output['user'][0]["available"] ==
                                "true") {
                              const snackBar = SnackBar(
                                content: Text(
                                    "The Professional you choose is not available ! Please choose another"),
                                duration: Duration(milliseconds: 2000),
                                backgroundColor: text6,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            primary: text6,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Book Session',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          )),
                    ),
                  );
                });
          }),
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
        borderRadius: BorderRadius.all(Radius.circular(_widthScale * 8)),
      ),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => EducationFormFill()));
        },
        child: ListTile(
          leading: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(_widthScale * 5.0)),
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
        borderRadius: BorderRadius.all(Radius.circular(_widthScale * 8)),
      ),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => EducationFormFill()));
        },
        child: ListTile(
          leading: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(_widthScale * 5.0)),
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
                height: _widthScale * 6,
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Column(
                children: [
                  FittedBox(
                    child: Text(getCapitalizeStringaa(subtitle),
                        style: GoogleFonts.poppins(fontSize: _widthScale * 12)),
                  ),
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
      ),
    );
  }

  Widget box2(String img, String name, String role, String img2,
      String university, String img3, String id) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        children: [
          output['user'][0]['anonymous'] == "false"
              ? output['user'][0]['profilePic'] != ""
                  ? Container(
                      height: _heightScale * 90,
                      width: _widthScale * 90,
                      decoration: BoxDecoration(
                          color: white(context).withOpacity(0.39),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                output['user'][0]['profilePic'],
                              ),
                              fit: BoxFit.cover)),
                    )
                  : (output['user'][0]['gender'] == "Male" ||
                          output['user'][0]['gender'] == "Other")
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
              : (output['user'][0]['gender'] == "Male" ||
                      output['user'][0]['gender'] == "Other")
                  ? Image.asset(
                      'assets/Men Professional.png',
                      height: _heightScale * 90,
                      width: _widthScale * 90,
                    )
                  : Image.asset(
                      'assets/Female Professional.png',
                      height: _heightScale * 90,
                      width: _widthScale * 90,
                    ),
          output['user'][0]['verified'] == 'true'
              ? Image.asset(
                  "assets/verify.png",
                  height: _heightScale * 25,
                  color: Colors.green,
                  width: _widthScale * 25,
                )
              : SizedBox(height: 0),
          SizedBox(
            height: _heightScale * 21,
          ),
          Text(
              getCapitalizeStringaa(output['user'][0]['anonymous'] == "true"
                  ? "Anonymoys"
                  : name),
              style: GoogleFonts.poppins(
                fontSize: _widthScale * 14,
                fontWeight: FontWeight.bold,
              )),
          Text(
              getCapitalizeStringaa("Rating : " +
                  "${output['user'][0]['rating'].toString()[0]}" +
                  "/5"),
              style: GoogleFonts.poppins(
                fontSize: _widthScale * 10,
                fontWeight: FontWeight.w400,
              )),
          Text(getCapitalizeStringaa(id),
              style: GoogleFonts.poppins(
                fontSize: _widthScale * 10,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              )),

          SizedBox(
            height: _heightScale * 16,
          ),
          Text(getCapitalizeStringaa(role),
              style: GoogleFonts.poppins(
                fontSize: _widthScale * 12,
              )),
          // SizedBox(
          //   height: _heightScale * 16.71,
          // ),
          // Row(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: _widthScale * 50,
          //     ),
          //     Image.asset(
          //       img2,
          //       // color: blue,
          //       height: _heightScale * 25,
          //       width: _widthScale * 25,
          //     ),
          //     SizedBox(
          //       width: _widthScale * 10,
          //     ),
          //     Text(university,
          //         style: GoogleFonts.poppins(
          //           fontSize: _widthScale * 12,
          //         )),
          //   ],
          // ),
          SizedBox(
            height: _heightScale * 16.2,
          ),
          Text(getCapitalizeStringaa(img3),
              style: GoogleFonts.poppins(
                fontSize: _widthScale * 12,
              )),
          // Image.asset(
          //   img3,
          //   height: _heightScale * 30,
          //   width: _widthScale * 107,
          // ),
        ],
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
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_widthScale * 5.0)),
            child: Image.asset(
              "assets/Skill Set.png",
              height: _heightScale * 50,
              width: _widthScale * 50,
              fit: BoxFit.fill,
            )),
        SizedBox(
          width: _widthScale * 10,
        ),
        Padding(
          padding: EdgeInsets.only(top: _heightScale * 10.0),
          child: Container(
            height: _heightScale * 56,
            width: _widthScale * 240, // double.infinity,
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
}

// Container(
//                     width: double.infinity,
//                     color: white,
//                     margin: EdgeInsets.only(top: 2),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Edit",
//                             style: GoogleFonts.poppins(
//                               color: whitebox( context),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Image.asset("assets/Group 1067.png"),
//                         ],
//                       ),
//                     ),
//                   ),
