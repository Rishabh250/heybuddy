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
                return events == null
                    ? Container(
                        height: _heightScale * 800,
                        width: double.infinity,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: _heightScale * 40,
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
                                                    image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/pool.png'),
                                                  fit: BoxFit.fill,
                                                )),
                                              )
                                            : Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal:
                                                        _widthScale * 30),
                                                height: _heightScale * 197,
                                                width: _widthScale * 315,
                                                decoration: BoxDecoration(
                                                    color: white(context)
                                                        .withOpacity(0.39),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          event[index]
                                                              ['eventPic'],
                                                        ),
                                                        fit: BoxFit.cover)),
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
                                                "${event[index]["Date"]} ,"
                                                    " ${event[index]["meetingTime"]}"),
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
