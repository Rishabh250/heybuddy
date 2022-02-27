import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/notifications.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/provider/styles.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotif();
  }

  var tkn = datam.read('f');
  var notification;
  List notiff = [];
  getNotif() async {
    notification = await getNotifications(tkn);

    return notification;
  }

  var x;
  getgf() async {
    print("output is $notification");
    x = notification['data'].length;
    print("output x is$x");
    return x;
  }

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var size = MediaQuery.of(context).size;
    var spacevert = SizedBox(
      height: size.height * 0.04,
    );

    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );
    return Scaffold(
      // backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: backgroundColor,
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(0),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 24),
      //       child: Column(
      //         children: [
      //           Row(
      //             children: [
      //               InkWell(
      //                   onTap: () {
      //                     Scaffold.of(context).openDrawer();
      //                   },
      //                   child: Image.asset(
      //                     "assets/Vector.png",
      //                     height: _heightScale * 16.29,
      //                     width: _widthScale * 19,
      //                   )),
      //               SizedBox(
      //                 width: _widthScale * 85,
      //               ),
      //               Image.asset(
      //                 "assets/logohort1.png",
      //                 height: _heightScale * 36.74,
      //                 width: _widthScale * 112,
      //               ),
      //               // Container(
      //               //   height:_heightScale* 35,
      //               //   width:_widthScale* 35,
      //               //   decoration: BoxDecoration(
      //               //     borderRadius: BorderRadius.all(Radius.circular(20)),
      //               //     color: black(context),
      //               //     //  shape: BoxShape.circle
      //               //   ),
      //               //   child: Padding(
      //               //    padding: EdgeInsets.symmetric(
      //               //         horizontal: _widthScale * 8, vertical: _widthScale * 9),
      //               //     child: Text(
      //               //       "HB",
      //               //       style: GoogleFonts.poppins(
      //               //           textStyle: TextStyle(
      //               //               color: white,
      //               //               fontSize: _widthScale * 12,
      //               //               fontWeight: FontWeight.bold)),
      //               //     ),
      //               //   ),
      //               // ),
      //               // SizedBox(
      //               //   width: _widthScale * 15,
      //               // ),
      //               // Text(
      //               //   "HeyBuddy",
      //               //   style: CustomTextStyle.HeyBuddy1(context),
      //               // ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getNotif(),
            builder: (context, snapShot) {
              return Column(
                children: [
                  SizedBox(
                    height: _heightScale * 30,
                  ),
                  notification == null
                      ? Container(
                          height: _heightScale * 500,
                          width: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ))
                      : notification['status'] == false
                          ? Container(
                              height: _heightScale * 500,
                              width: double.infinity,
                              child: Center(
                                child: Text("No Notifications"),
                              ),
                            )
                          : FutureBuilder(
                              future: getgf(),
                              builder: (context, snapShot) {
                                return Container(
                                  height: _heightScale * 600,
                                  child: ListView.builder(
                                      itemCount: x != null
                                          ? x
                                          : 0, // notiff.isEmpty ? 0 : notiff.length,
                                      itemBuilder: (context, index) {
                                        return topics(
                                          // "assets/Group 33852.png",
                                          notification['data'][index]
                                                      ['profilePic'] !=
                                                  ""
                                              ? notification['data'][index]
                                                  ['profilePic']
                                              : imggg,
                                          // notification!=null? notification['data'][index]['profilePic']:"",
                                          // "Your appointment for legal consultation of Consumer complaints has been successfully booked",
                                          notification != null
                                              ? notification['data'][index]
                                                  ['title']
                                              : "Not Data",
                                          notification != null
                                              ? notification['data'][index]
                                                      ['Date']
                                                  .toString()
                                                  .replaceRange(10, 24, "")
                                              : "Not Data",
                                          index,
                                        );
                                      }),
                                );
                              }),
                  SizedBox(
                    height: _heightScale * 16,
                  ),
                  // topics(
                  //     "assets/Group 33852.png",
                  //     "Your appointment for legal consultation of Consumer complaints has been successfully booked",
                  //     "17 July"),
                  // SizedBox(
                  //   height: _heightScale * 16,
                  // ),
                  // topics(
                  //     "assets/Group 33852.png",
                  //     "Your appointment for legal consultation of Consumer complaints has been successfully booked",
                  //     "17 July"),
                  // SizedBox(
                  //   height: _heightScale * 16,
                  // ),
                  // topics(
                  //     "assets/Group 33852.png",
                  //     "Your appointment for legal consultation of Consumer complaints has been successfully booked",
                  //     "17 July"),
                ],
              );
            }),
      ),
    );
  }

  Widget topics(String img, String title, String subtitle, int i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(_widthScale * 5.0)),
              child: Padding(
                padding: EdgeInsets.only(left: _widthScale * 10.0),
                child: notification['data'][i]['profilePic'] != ""
                    ? Container(
                        height: _heightScale * 60,
                        width: _widthScale * 60,
                        decoration: BoxDecoration(
                            color: white(context).withOpacity(0.39),
                            // border: Border.all()
                            shape: BoxShape.circle,
                            image: //res[i]['profilePic'] == ""
                                // DecorationImage(image: NetworkImage(imggg))
                                DecorationImage(
                                    image: NetworkImage(
                                      notification['data'][i]['profilePic'],
                                    ),
                                    fit: BoxFit.cover)),
                      )
                    : (notification['data'][i]['gender'] == "Male" ||
                            notification['data'][i]['gender'] == "Other")
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

                //  Container(
                //   height: _heightScale * 60,
                //   width: _widthScale * 60,
                //   decoration: BoxDecoration(
                //       color: white.withOpacity(0.39),
                //       // border: Border.all()
                //       shape: BoxShape.circle,
                //       image: //res[i]['profilePic'] == ""
                //           // DecorationImage(image: NetworkImage(imggg))
                //           DecorationImage(
                //               image: NetworkImage(
                //                 img,
                //               ),
                //               fit: BoxFit.cover)),
                // ),

                // Image.asset(
                //   img,
                //   height: _heightScale * 50,
                //   width: _widthScale * 50,
                //   fit: BoxFit.fill,
                //   //scale: 10,
                // ),
              )),
          title: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: _heightScale * 12.0),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 12,
                      color: Styles.isDark ? whites.withOpacity(0.8) : text9),
                ),
              ),
              SizedBox(
                height: _widthScale * 8,
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Column(
                children: [
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color:
                            Styles.isDark ? whites.withOpacity(0.8) : text10),
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
        SizedBox(
          height: _heightScale * 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: _heightScale * 1,
          color: Styles.isDark ? whites.withOpacity(0.8) : text13,
        ),
      ],
    );
  }
}
