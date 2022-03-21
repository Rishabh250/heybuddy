import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/slotbooktime.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';

import 'education_new_experience.dart';

class ProfessionalProfile extends StatefulWidget {
  var name;
  var uniqueId;
  ProfessionalProfile({required this.name, required this.uniqueId});
  // const ProfessionalProfile({Key? key}) : super(key: key);

  @override
  _ProfessionalProfileState createState() => _ProfessionalProfileState();
}

class _ProfessionalProfileState extends State<ProfessionalProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onTap();
  }

  var output;
  onTap() async {
    output = await UniqueUser.uniqueUser(widget.uniqueId);
    return output;
  }

  var x;
  getgf() async {
    // x = List.generate(
    //     res[widget.i]["skills"] != null ? res[widget.i]["skills"].length : 0,
    //     (index) => res[widget.i]["skills"]);
    // // xy = res[widget.i]["skills"].length;
    // print("val of x is$x");
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
      backgroundColor: backgroundColor,
      body: FutureBuilder(
          future: onTap(),
          builder: (context, snapShot) {
            return output == null
                ? Container(
                    height: _heightScale * 800,
                    width: double.infinity,
                    child: Center(child: CircularProgressIndicator()))
                : Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        // color: Colors.yellow,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: _heightScale * 24,
                              ),
                              Container(
                                color: white(context).withOpacity(0.39),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    spacehort,
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: _heightScale * 24,
                                          // width: size.width * 0.96,
                                        ),
                                        Container(
                                            child: Image.asset(
                                          "assets/Vector.png",
                                          height: _heightScale * 16.29,
                                          width: _widthScale * 19,
                                        )),
                                      ],
                                    ),
                                    SizedBox(width: _widthScale * 40),
                                    Container(
                                      color: white(context).withOpacity(0.39),
                                      child: FutureBuilder(
                                          future: getgh(),
                                          builder: (context, snapShot) {
                                            return Row(
                                              children: [
                                                box2(
                                                  output['user'][0]
                                                              ['profilePic'] !=
                                                          ""
                                                      ? output['user'][0]
                                                          ['profilePic']
                                                      : imggg,
                                                  // "assets/Ellipse 9.png",
                                                  // "Manideep Mittapelli",
                                                  output['user'][0]['name'],
                                                  z.isNotEmpty
                                                      ? output['user'][0]
                                                              ['company'][0]
                                                          ['title']
                                                      : "Not Mentioned yet",
                                                  "assets/Education.png",

                                                  output['user'][0]
                                                              ['university'] !=
                                                          ""
                                                      ? output['user'][0]
                                                          ['university']
                                                      : "Not Mentioned Yet",
                                                  z.isNotEmpty
                                                      ? output['user'][0]
                                                              ['company'][0]
                                                          ['company_name']
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
                                          top: _heightScale * 15.0),
                                      child: Row(
                                        children: [
                                          spacehort,
                                          Text(
                                            "Languages Known",
                                            style: GoogleFonts.poppins(
                                                fontSize: _widthScale * 14,
                                                fontWeight: FontWeight.bold,
                                                color: black(context)),
                                          ),
                                          Text(
                                            ": English, Hindi, Punjabi ",
                                            style: GoogleFonts.poppins(
                                                fontSize: _widthScale * 14,
                                                color: text11),
                                          ),
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
                                      child: Text(
                                        // "Profile of a line describes a tolerance zone around any line in any feature, usually of a curved shape. Profile of a line is a 2-Dimensional tolerance range that can be applied to any linear tolerance.",
                                        output['user'][0]['bio'] != null
                                            ? output['user'][0]['bio']
                                            : "Not Mentioned Yet",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 14,
                                            color: text11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: _heightScale * 36,
                              ),
                              Container(
                                color: white(context).withOpacity(0.39),
                                height: _heightScale * 43,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      spacehort,
                                      Text("Professional History",
                                          style: GoogleFonts.poppins(
                                              fontSize: _widthScale * 18,
                                              color: text5,
                                              fontWeight: FontWeight.w500)),
                                      // SizedBox(
                                      //   width: _widthScale * 106,
                                      // ),
                                      // Text("5 Yr Exp",
                                      //     style: GoogleFonts.poppins(
                                      //         color: text5,
                                      //         fontSize: _widthScale * 14,
                                      //         fontWeight: FontWeight.w500)),
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
                                              color: text5,
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
                                                      "Add Your Skills ",
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
                                                  height: _heightScale * 240,
                                                  width: double.infinity,
                                                  child: ListView.builder(
                                                      itemCount:
                                                          y != null ? y : 0,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return topics(
                                                            "assets/Employment.png",
                                                            // response["company"] != []
                                                            //     ?
                                                            output['user'][0]["company"]
                                                                            [index]
                                                                        [
                                                                        'title'] ==
                                                                    ""
                                                                ? "Not Mentioned"
                                                                : output['user'][0]
                                                                            ["company"]
                                                                        [index]
                                                                    ['title'],
                                                            // : "Enter Your Details",
                                                            output['user'][0]
                                                                        ["company"]
                                                                    [index][
                                                                'company_name']);
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
                              Container(
                                width: double.infinity,
                                color: white(context).withOpacity(0.39),
                                margin: EdgeInsets.only(top: _heightScale * 3),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10),
                                  child: Center(
                                    child: Text(
                                      "See all",
                                      style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 14,
                                          color: text6),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _heightScale * 50,
                              ),
                              Container(
                                color: white(context).withOpacity(0.39),
                                height: _heightScale * 43,
                                child: Row(
                                  children: [
                                    spacehort,
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Education",
                                          style: GoogleFonts.poppins(
                                              fontSize: _widthScale * 18,
                                              color: text5,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                              ),
                              topics(
                                  "assets/Education.png",
                                  output['user'][0]['university'] != ""
                                      ? output['user'][0]['university']
                                      : "Not Mentioned Yet",
                                  "Bachelor Of Technology"),
                              // topics(
                              //     "assets/Rectangle 9.png",
                              //     "Delhi Technological University",
                              //     "Bachelor Of Technology"),
                              Container(
                                width: double.infinity,
                                color: white(context).withOpacity(0.39),
                                margin: EdgeInsets.only(top: 3),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: _heightScale * 10.0,
                                      bottom: _heightScale * 10),
                                  child: Center(
                                    child: Text(
                                      "See all",
                                      style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 14,
                                          color: text6),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: _heightScale * 44,
                              // ),
                              // Container(
                              //   color: white.withOpacity(0.39),
                              //   height: _heightScale * 43,
                              //   child: Row(
                              //     children: [
                              //       spacehort,
                              //       Padding(
                              //         padding: EdgeInsets.only(top: _heightScale * 8.0),
                              //         child: Text("Skills Known",
                              //             style: GoogleFonts.poppins(
                              //                 fontSize: _widthScale * 18,
                              //                 color: text5,
                              //                 fontWeight: FontWeight.w500)),
                              //       ),
                              //     ],
                              //   ),
                              // ),
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
                              // Container(
                              //   width: double.infinity,
                              //   color: white.withOpacity(0.39),
                              //   margin: EdgeInsets.only(top: _heightScale * 3),
                              //   child: Padding(
                              //     padding: EdgeInsets.only(
                              //         top: _heightScale * 10.0, bottom: _heightScale * 10),
                              //     child: Center(
                              //       child: Text(
                              //         "See all",
                              //         style: GoogleFonts.poppins(
                              //             fontSize: _widthScale * 14, color: text6),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: _heightScale * 44,
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
                                      child: Text("Skills Known",
                                          style: GoogleFonts.poppins(
                                              fontSize: _widthScale * 18,
                                              color: text5,
                                              fontWeight: FontWeight.w500)),
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
                                                    height: _heightScale * 240,
                                                    width: _widthScale *
                                                        300, // double.infinity,
                                                    child: ListView.builder(
                                                        itemCount: output['user']
                                                                        [0][
                                                                    "skills"] !=
                                                                null
                                                            ? output['user'][0]
                                                                    ["skills"]
                                                                .length
                                                            //  res[widget.i]
                                                            //             [
                                                            //             "skills"] !=
                                                            //         null
                                                            //     ? res[widget.i]
                                                            //             ["skills"]
                                                            //         .length
                                                            : 0,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Container(
                                                              child: button(
                                                                  // res[widget.i][
                                                                  //             "skills"] !=
                                                                  //         []
                                                                  //     ? res[widget.i]
                                                                  //             [
                                                                  //             "skills"]
                                                                  //         [
                                                                  //         index]
                                                                  //     : [],
                                                                  output['user']
                                                                              [
                                                                              0]
                                                                          [
                                                                          "skills"]
                                                                      [index],

                                                                  // x,
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
                              SizedBox(
                                height: _heightScale * 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: backgroundColor,
                        // color: Colors.yellow,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Row(
                          children: [
                            // spacehort,
                            Column(
                              children: [
                                SizedBox(
                                  height: _heightScale * 15,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: _widthScale * 24),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Book a session with",
                                        style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 15,
                                          color: text6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: _heightScale * 0.7,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: _widthScale * 24),
                                  child: Row(
                                    children: [
                                      Text(
                                        output['user'][0]['name'],
                                        style: GoogleFonts.poppins(
                                          fontSize: _widthScale * 16,
                                          color: text6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: _heightScale * 5,
                                ),
                              ],
                            ),
                            // spacehort1,
                            SizedBox(
                              width: _widthScale * 90.5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  print(
                                      "phone is${output['user'][0]["phone"]}");
                                  var fcmToken =
                                      output['user'][0]['fcmtoken'].toString();
                                  print("RRRRffff" + fcmToken.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SlotBookTime(
                                                i: output['user'][0]["phone"],
                                                fcm: fcmToken,
                                              )));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: text6,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        _widthScale * 10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: _heightScale * 14),
                                  child: Text(
                                    'Connect',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: _widthScale * 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                            // SizedBox(
                            //   width: 5,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  );
          }),
    );
  }

  Widget topics(String img, String title, String subtitle) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      // margin: EdgeInsets.only(left: 10),
      padding:
          EdgeInsets.only(top: _heightScale * 10, bottom: _heightScale * 10),
      decoration: BoxDecoration(
        color: white(context).withOpacity(0.39),
        borderRadius: BorderRadius.all(Radius.circular(_widthScale * 8)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EducationFormFill()));
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
                height: _widthScale * 16,
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Column(
                children: [
                  Text(subtitle,
                      style: GoogleFonts.poppins(
                          fontSize: _widthScale * 12, color: text10)),
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
      String university, String img3) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        Container(
          height: _heightScale * 335,
          width: _widthScale * 200,
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 32.5,
              ),
              // CircleAvatar(
              //   radius: _widthScale * 45,
              //   backgroundImage: AssetImage(img),
              // ),
              output['user'][0]['profilePic'] != ""
                  ?
                  //  output['user'][0]['profilePic']
                  // : imggg,
                  Container(
                      height: _heightScale * 90,
                      width: _widthScale * 90,
                      decoration: BoxDecoration(
                          color: white(context).withOpacity(0.39),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  NetworkImage(output['user'][0]['profilePic']),
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
                        ),
              SizedBox(
                height: _heightScale * 21,
              ),
              Text(name,
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 14,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: _heightScale * 16,
              ),
              Text(role,
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 12,
                  )),
              SizedBox(
                height: _heightScale * 16.71,
              ),
              Row(
                children: [
                  SizedBox(
                    width: _widthScale * 30,
                  ),
                  Image.asset(
                    img2,
                    // color: blue,
                    height: _heightScale * 25,
                    width: _widthScale * 25,
                  ),
                  SizedBox(
                    width: _widthScale * 10,
                  ),
                  Text(university,
                      style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                      )),
                ],
              ),
              SizedBox(
                height: _heightScale * 16.2,
              ),
              Text(img3,
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
        ),
      ],
    );
  }

  Widget button(String time, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: col,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(_widthScale * 10.0),
          child: Text(
            time,
            style: GoogleFonts.poppins(fontSize: _widthScale * 14, color: col2),
          ),
        ));
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





// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heybuddy/Screens/slotbooktime.dart';
// import 'package:heybuddy/color&font/colors.dart';

// class ProfessionalProfile extends StatefulWidget {
//   const ProfessionalProfile({Key? key}) : super(key: key);

//   @override
//   _ProfessionalProfileState createState() => _ProfessionalProfileState();
// }

// class _ProfessionalProfileState extends State<ProfessionalProfile> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     Widget spacevert = SizedBox(
//       height: size.height * 0.04,
//     );
//     Widget spacehort = SizedBox(
//       width: size.width * 0.06,
//     );
//     Widget spacehort1 = SizedBox(
//       width: size.width * 0.1,
//     );
//     Widget spacevert1 = SizedBox(
//       height: size.height * 0.02,
//     );
//     Widget spacevert2 = SizedBox(
//       height: size.height * 0.03,
//     );
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.9,
//             // color: Colors.yellow,
//             width: double.infinity,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: size.height * 0.06,
//                     width: size.width * 0.96,
//                   ),
//                   Container(
//                     color: white.withOpacity(0.39),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         spacehort,
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: size.height * 0.06,
//                               // width: size.width * 0.96,
//                             ),
//                             Container(child: Image.asset("assets/Vector.png")),
//                           ],
//                         ),
//                         SizedBox(
//                           width: 45,
//                         ),
//                         Container(
//                           color: white.withOpacity(0.39),
//                           child: Row(
//                             children: [
//                               box2(
//                                   "assets/Ellipse 9.png",
//                                   "Manideep Mittapelli",
//                                   "Sr Technical Program Manager",
//                                   "assets/Ellipse 182.png",
//                                   "University Of HartFort",
//                                   "assets/Rectangle 704.png"),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: size.height * 0.06,
//                               // width: size.width * 0.96,
//                             ),
//                             Container(
//                               child: Image.asset("assets/Group 33900.png"),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   spacevert2,
//                   Container(
//                     color: white.withOpacity(0.39),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: Row(
//                             children: [
//                               spacehort,
//                               Text(
//                                 "Languages Known",
//                                 style: GoogleFonts.poppins(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: black(context)),
//                               ),
//                               Text(
//                                 ": English, Hindi, Punjabi ",
//                                 style: GoogleFonts.poppins(
//                                     fontSize: 14, color: text11),
//                               ),
//                             ],
//                           ),
//                         ),
//                         spacevert1,
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 22.5, right: 22.5, bottom: 15),
//                           child: Text(
//                             "Profile of a line describes a tolerance zone around any line in any feature, usually of a curved shape. Profile of a line is a 2-Dimensional tolerance range that can be applied to any linear tolerance.",
//                             style: GoogleFonts.poppins(
//                                 fontSize: 14, color: text11),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   spacevert,
//                   Container(
//                     color: white.withOpacity(0.39),
//                     height: size.height * 0.05,
//                     child: Row(
//                       children: [
//                         spacehort,
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text("Professional History",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   color: text5,
//                                   fontWeight: FontWeight.w500)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   topics("assets/Rectangle 8.png",
//                       "Sr Technical Program Manager", "PlayStation"),
//                   topics("assets/Rectangle 8.png",
//                       "Sr Technical Program Manager", "PlayStation"),
//                   Container(
//                     width: double.infinity,
//                     color: white.withOpacity(0.39),
//                     margin: EdgeInsets.only(top: 3),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//                       child: Center(
//                         child: Text(
//                           "See all",
//                           style: GoogleFonts.poppins(
//                               fontSize: 14, color: text6),
//                         ),
//                       ),
//                     ),
//                   ),
//                   spacevert,
//                   Container(
//                     color: white.withOpacity(0.39),
//                     height: size.height * 0.05,
//                     child: Row(
//                       children: [
//                         spacehort,
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text("Education",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   color: text5,
//                                   fontWeight: FontWeight.w500)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   topics(
//                       "assets/Rectangle 9.png",
//                       "Delhi Technological University",
//                       "Bachelor Of Technology"),
//                   topics(
//                       "assets/Rectangle 9.png",
//                       "Delhi Technological University",
//                       "Bachelor Of Technology"),
//                   Container(
//                     width: double.infinity,
//                     color: white.withOpacity(0.39),
//                     margin: EdgeInsets.only(top: 3),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//                       child: Center(
//                         child: Text(
//                           "See all",
//                           style: GoogleFonts.poppins(
//                               fontSize: 14, color: text6),
//                         ),
//                       ),
//                     ),
//                   ),
//                   spacevert,
//                   // Container(
//                   //   color: white.withOpacity(0.39),
//                   //   height: size.height * 0.05,
//                   //   child: Row(
//                   //     children: [
//                   //       spacehort,
//                   //       Padding(
//                   //         padding: const EdgeInsets.only(top: 8.0),
//                   //         child: Text("Skills Known",
//                   //             style: GoogleFonts.poppins(
//                   //                 fontSize: 18,
//                   //                 color: text5,
//                   //                 fontWeight: FontWeight.w500)),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // Container(
//                   //   width: double.infinity,
//                   //   color: white.withOpacity(0.39),
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.all(20.0),
//                   //     child: Column(
//                   //       children: [
//                   //         Row(
//                   //           children: [
//                   //             spacehort,
//                   //             button("C++", text6, white),
//                   //             spacehort,
//                   //             button("Java", text6, white),
//                   //             spacehort,
//                   //             button("Flutter", text6, white),
//                   //           ],
//                   //         ),
//                   //         spacevert1,
//                   //         Row(
//                   //           children: [
//                   //             spacehort,
//                   //             button("SQL", text6, white),
//                   //             spacehort,
//                   //             button("Java", text6, white),
//                   //             spacehort,
//                   //             button("Java", text6, white),
//                   //           ],
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                   // Container(
//                   //   width: double.infinity,
//                   //   color: white.withOpacity(0.39),
//                   //   margin: EdgeInsets.only(top: 3),
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.only(top: 10.0, bottom: 10),
//                   //     child: Center(
//                   //       child: Text(
//                   //         "See all",
//                   //         style: GoogleFonts.poppins(
//                   //             fontSize: 14, color: text6),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             color: backgroundColor,
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.1,
//             child: Row(
//               children: [
//                 //spacehort,
//                 Expanded(
//                   flex: 2,
//                   child: Column(
//                     children: [
//                       spacevert2,
//                       Text(
//                         "Book a session with",
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           color: text6,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 1,
//                       ),
//                       Text(
//                         "Manideep Mittapelli",
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           color: text6,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // spacehort1,
//                 Expanded(
//                   flex: 1,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SlotBookTime()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: text6,
//                         shape: new RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         child: Text(
//                           'Connect',
//                           style: GoogleFonts.poppins(
//                             textStyle: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       )),
//                 ),
//                 spacehort1,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget topics(String img, String title, String subtitle) {
//   return Container(
//     margin: EdgeInsets.only(left: 10),
//     padding: EdgeInsets.only(top: 10, bottom: 10),
//     decoration: BoxDecoration(
//       color: white.withOpacity(0.39),
//       borderRadius: BorderRadius.all(Radius.circular(8)),
//     ),
//     child: ListTile(
//       leading: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(5.0)),
//           child: Image.asset(
//             img,
//             height: 58,
//             width: 55,
//             fit: BoxFit.fill,
//           )),
//       title: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.poppins(fontSize: 16),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 8,
//           ),
//         ],
//       ),
//       subtitle: Row(
//         children: [
//           Column(
//             children: [
//               Text(subtitle,
//                   style: GoogleFonts.poppins(fontSize: 12, color: text10)),
//               // SizedBox(
//               //   height: 8,
//               // ),
//               // Row(
//               //   children: [
//               //     Text("2018-2022",
//               //         style: GoogleFonts.poppins(fontSize: 12, color: text10)),
//               //   ],
//               // ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget box2(String img, String name, String role, String img2,
//     String university, String img3) {
//   return Column(
//     children: [
//       Container(
//         height: 286,
//         width: 200,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 32.5,
//             ),
//             CircleAvatar(
//               radius: 45,
//               backgroundImage: AssetImage(img),
//             ),
//             SizedBox(
//               height: 16.2,
//             ),
//             Text(name,
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 )),
//             SizedBox(
//               height: 16.2,
//             ),
//             Text(role,
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                 )),
//             SizedBox(
//               height: 16.2,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 30,
//                 ),
//                 Image.asset(img2),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(university,
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                     )),
//               ],
//             ),
//             SizedBox(
//               height: 16.2,
//             ),
//             Image.asset(img3),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget button(String time, Color col, Color col2) {
//   return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(
//         primary: col,
//         shape: new RoundedRectangleBorder(
//           borderRadius: new BorderRadius.circular(50.0),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Text(
//           time,
//           style: GoogleFonts.poppins(fontSize: 14, color: col2),
//         ),
//       ));
// }



// // Container(
// //                     width: double.infinity,
// //                     color: white,
// //                     margin: EdgeInsets.only(top: 2),
// //                     child: Padding(
// //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Text(
// //                             "Edit",
// //                             style: GoogleFonts.poppins(
// //                               color: whitebox( context),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             width: 5,
// //                           ),
// //                           Image.asset("assets/Group 1067.png"),
// //                         ],
// //                       ),
// //                     ),
// //                   ),