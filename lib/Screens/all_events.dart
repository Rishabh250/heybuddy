import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/pool_session.dart';
import 'package:heybuddy/api/all_events.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';

class AllEvents extends StatefulWidget {
  const AllEvents({Key? key}) : super(key: key);

  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  var events;
  List event = [];
  getAllEvents() async {
    events = await getallevents();
    event = events;
    return event;
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: getAllEvents(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return events == null
                    ? Container(
                        height: _heightScale * 800,
                        width: double.infinity,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _heightScale * 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _widthScale * 24),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Styles.isDark
                                        ? whites.withOpacity(0.8)
                                        : text9,
                                  ),
                                ),
                                SizedBox(
                                  width: _widthScale * 10,
                                ),
                                Text("All Events",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: _widthScale * 18)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _heightScale * 40,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: event.isNotEmpty ? event.length : 0,
                              itemBuilder: (context, index) {
                                var time = event[index]["meetingTime"];
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
                                if (int.parse(time[0]) > 12) {
                                  noon = "PM";
                                }
                                if (int.parse(time[0]) < 12) {
                                  noon = "AM";
                                }

                                var finalTime = hours.toString() +
                                    ":" +
                                    time[1] +
                                    " " +
                                    noon;

                                var date = event[index]["Date"];
                                date = date.split('/');

                                var mon = int.parse(date[1]);

                                var finalDate = date[2] +
                                    " " +
                                    months[mon - 1] +
                                    ', ' +
                                    date[0];
                                return Column(
                                  children: [
                                    Stack(
                                      children: [
                                        event[index]['eventPic'] == ''
                                            ? Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        _widthScale * 30),
                                                height: _heightScale * 197,
                                                width: _widthScale * 315,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color.fromARGB(
                                                        255, 20, 100, 167)),
                                              )
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        _widthScale * 30),
                                                height: _heightScale * 197,
                                                width: _widthScale * 315,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 20, 100, 167),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                //  BoxDecoration(
                                                //     image: DecorationImage(
                                                //   image:
                                                //       AssetImage('assets/pool.png'),
                                                //   fit: BoxFit.fill,
                                                // )),
                                              ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left:
                                                            _widthScale * 45.0,
                                                        top: _heightScale * 12),
                                                    child: Text(
                                                      getCapitalizeStringaa(
                                                          "${event[index]['title']}"),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            _widthScale * 16,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: whites,
                                                      )),
                                                    ),
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
                                                // ),
                                              ],
                                            ),
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
                                            content(
                                                "assets/video.png", "Online"),
                                            SizedBox(
                                              height: _heightScale * 5,
                                            ),
                                            content("assets/rupees.png",
                                                "Rs ${event[index]['amount']}"),
                                            SizedBox(
                                              height: _heightScale * 15,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      _widthScale * 46.0),
                                              child: Container(
                                                height: _heightScale * 36,
                                                width: _widthScale * 286,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      event[index]['closed'] ==
                                                              'no'
                                                          ? Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PoolSession(
                                                                            index:
                                                                                index,
                                                                            id: event[index]['_id'],
                                                                          )))
                                                          : null;
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: whites,
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                _widthScale *
                                                                    10.0),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      event[index]['closed'] ==
                                                              'no'
                                                          ? 'Attend'
                                                          : "Closed",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: text6,
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
                                    SizedBox(
                                      height: _heightScale * 20,
                                    )
                                  ],
                                );
                              }),
                        ],
                      );
              }),
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
