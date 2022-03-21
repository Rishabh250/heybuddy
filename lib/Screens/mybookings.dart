// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/mybookings.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../provider/styles.dart';

class MyBookings extends StatefulWidget {
  var joinDate;
  MyBookings({Key? key, required this.joinDate}) : super(key: key);

  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getYear();
  }

  var tkn = datam.read('f');
  var response;
  var res;
  // List res = [];
  getData() async {
    res = await mybookings(tkn, currentYear);
    // res = response;
    return res;
  }

  var month;

  bbb(index) {
    if (index == 11) {
      month = "January";
      // isExpand = isExpand11;
      // return month;
    } else if (index == 10) {
      month = "February";
      // isExpand = isExpand10;
      // return month;
    } else if (index == 9) {
      month = "March";
      // isExpand = isExpand9;
      // return month;
    } else if (index == 8) {
      month = "April";
      // isExpand = isExpand8;
      // return month;
    } else if (index == 7) {
      month = "May";
      // isExpand = isExpand7;
      // return month;
    } else if (index == 6) {
      month = "June";
      // isExpand = isExpand6;
      // return month;
    } else if (index == 5) {
      month = "July";
      // isExpand = isExpand5;
      // return month;
    } else if (index == 4) {
      month = "August";
      // isExpand = isExpand4;
      // return month;
    } else if (index == 3) {
      month = "September";
      // isExpand = isExpand3;
      // return month;
    } else if (index == 2) {
      month = "October";
      // isExpand = isExpand2;
      // return month;
    } else if (index == 1) {
      month = "November";
      // isExpand = isExpand1;
      // return month;
    } else if (index == 0) {
      month = "December";
      // isExpand = isExpand0;
      // return month;
    }
  }

  String currentYear = DateTime.now().year.toString();

  var _items = [""];

  getYear() {
    for (int i = widget.joinDate; i <= int.parse(currentYear); i++) {
      _items.add(i.toString());
    }
    _items.remove("");
    print("RTRTR" + "${_items}");
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
  bool isExpand = false;
  bool isExpand0 = false;
  bool isExpand1 = false;
  bool isExpand2 = false;
  bool isExpand3 = false;
  bool isExpand4 = false;
  bool isExpand5 = false;
  bool isExpand6 = false;
  bool isExpand7 = false;
  bool isExpand8 = false;
  bool isExpand9 = false;
  bool isExpand10 = false;
  bool isExpand11 = false;
  // vvv(val) {
  //   setState(() {
  //     val = !val;
  //   });
  // }
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
    var word = Provider.of<Favourite>(context).fav;
    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );
    Widget spacehort = SizedBox(
      width: size.width * 0.08,
    );
    Widget spacehort2 = SizedBox(
      width: size.width * 0.1,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.015,
    );
    return Scaffold(
      // backgroundColor: Colors.transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent, //backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: text9,
          ),
        ),
        title: Text(
          "My Bookings",
          style: GoogleFonts.poppins(
              color: Color.fromRGBO(34, 50, 99, 1),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapShot) {
                return res == null
                    ? Container(
                        height: _heightScale * 600,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                    : res['data'].isEmpty
                        ? Container(
                            height: _heightScale * 550,
                            width: double.infinity,
                            child: Center(
                              child: Text("No Bookings till Now!"),
                            ),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: _heightScale * 28,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 51, 221, 243),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 8, bottom: 8),
                                      child: Text(
                                        "Select year : ",
                                        style: GoogleFonts.poppins(
                                            color: Styles.isDark
                                                ? Colors.white
                                                : Color.fromRGBO(34, 50, 99, 1),
                                            fontSize: _widthScale * 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 30.0, top: 8, bottom: 8),
                                      child: DropdownButton(
                                        borderRadius: BorderRadius.circular(20),
                                        elevation: 8,
                                        underline: SizedBox(),
                                        value: currentYear,
                                        items:
                                            _items.toSet().map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: GoogleFonts.poppins(
                                                  color: Color.fromARGB(
                                                      255, 12, 12, 12),
                                                  fontSize: _widthScale * 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            currentYear = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              res['data'][11].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);
                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand0 = !isExpand0;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "January, " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][11].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 9.53,
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand0 == false
                                              ? Container()
                                              : res['data'][11].isEmpty
                                                  ? Container()
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][11]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              11]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                res['data'][11]
                                                                        [index1]
                                                                    ['orderId'],
                                                                res['data'][11][index1]
                                                                            [
                                                                            'professionalname'] !=
                                                                        null
                                                                    ? getCapitalizeStringaa(res['data'][11]
                                                                            [
                                                                            index1]
                                                                        [
                                                                        'professionalname'])
                                                                    : "No Name",
                                                                res['data'][11][
                                                                            index1]
                                                                        ['Date']
                                                                    .toString()
                                                                    .replaceRange(
                                                                        10,
                                                                        24,
                                                                        ""),
                                                                res['data'][11]
                                                                        [index1]
                                                                    ['topic'],
                                                                res['data'][11]
                                                                        [index1]
                                                                    ['amount'],
                                                              );
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][10].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand1 = !isExpand1;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "February, " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][10].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand1 == false
                                              ? Container()
                                              : res['data'][10].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][10]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              return Appointments(
                                                                  res['data'][10]
                                                                          [index1]
                                                                      ['name'],
                                                                  res['data'][10][index1]['professionalname'] !=
                                                                          null
                                                                      ? getCapitalizeStringaa(res['data'][10]
                                                                              [index1][
                                                                          'professionalname'])
                                                                      : "No Name",
                                                                  res['data'][10]
                                                                          [index1]
                                                                      ['Date'],
                                                                  res['data'][10]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][10]
                                                                          [index1]
                                                                      ['amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][9].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand2 = !isExpand2;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "March, " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][9].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand2 == false
                                              ? Container()
                                              : res['data'][9].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][9]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              9]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][9]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][9]
                                                                          [index1]
                                                                      [
                                                                      'professionalname'],
                                                                  finalDate,
                                                                  res['data'][9]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][9]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][8].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand3 = !isExpand3;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "April, " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][8].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand3 == false
                                              ? Container()
                                              : res['data'][8].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][8]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              8]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][8]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][8]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][8]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][8]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][7].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand4 = !isExpand4;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "May, " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][7].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand4 == false
                                              ? Container()
                                              : res['data'][7].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][7]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              7]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][7]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][7]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][7]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][7]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][6].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand5 = !isExpand5;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "June, " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][6].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand5 == false
                                              ? Container()
                                              : res['data'][6].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][6]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              6]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][6]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][6]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][6]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][6]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][5].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand6 = !isExpand6;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "July, " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][5].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand6 == false
                                              ? Container()
                                              : res['data'][5].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][5]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              5]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][5]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][5]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][5]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][5]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][4].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand7 = !isExpand7;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "August , " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][4].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand7 == false
                                              ? Container()
                                              : res['data'][4].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][4]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              4]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][4]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][4]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][4]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][4]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][3].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand8 = !isExpand8;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "September , " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][3].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand8 == false
                                              ? Container()
                                              : res['data'][3].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][3]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              3]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][3]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][3]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][3]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][3]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][2].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand9 = !isExpand9;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "October , " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][2].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand9 == false
                                              ? Container()
                                              : res['data'][2].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][2]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              2]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][2]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][2]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][2]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][2]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][1].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand10 = !isExpand10;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "November , " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][1].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand10 == false
                                              ? Container()
                                              : res['data'][1].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][1]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              1]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][1]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][1]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][1]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][1]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                              res['data'][0].isEmpty
                                  ? Container()
                                  : Container(
                                      // height: _heightScale * 100,
                                      width: _widthScale * 374,
                                      child:
                                          // ListView.builder(
                                          //     itemCount: res.isEmpty ? 0 : res.length,
                                          //     itemBuilder: (BuildContext ctx, index) {
                                          //       bbb(index);

                                          //       return
                                          Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: HexColor("68CDEE"),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isExpand11 = !isExpand11;
                                                  });
                                                  // vvv(val);
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/bookIcon.png"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    //spacehort2,
                                                    Text(
                                                      // month != null
                                                      //     ? month
                                                      //     :
                                                      "December , " +
                                                          res['year']
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  _widthScale *
                                                                      18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        "(${(res['data'][0].length)})",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize:
                                                                    _widthScale *
                                                                        18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 16.47,
                                          ),
                                          isExpand11 == false
                                              ? Container()
                                              : res['data'][0].isEmpty
                                                  ? Container(
                                                      height: _heightScale * 80,
                                                      width: double.infinity,
                                                      child: Center(
                                                        child: Text(
                                                            "Nothing to show !"),
                                                      ))
                                                  : Column(
                                                      children: [
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemCount:
                                                                res['data'][0]
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index1) {
                                                              var date = res['data']
                                                                              [
                                                                              0]
                                                                          [
                                                                          index1]
                                                                      ['Date']
                                                                  .split('-');
                                                              var mon =
                                                                  int.parse(
                                                                      date[1]);
                                                              var getDate0 =
                                                                  date[2][0];
                                                              var getDate1 =
                                                                  date[2][1];
                                                              var getDate =
                                                                  getDate0 +
                                                                      getDate1;

                                                              var finalDate =
                                                                  getDate +
                                                                      " " +
                                                                      months[mon -
                                                                          1] +
                                                                      ', ' +
                                                                      date[0];
                                                              return Appointments(
                                                                  res['data'][0]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  res['data'][0]
                                                                          [index1]
                                                                      [
                                                                      'orderId'],
                                                                  finalDate,
                                                                  res['data'][0]
                                                                          [index1]
                                                                      ['topic'],
                                                                  res['data'][0]
                                                                          [
                                                                          index1]
                                                                      [
                                                                      'amount']);
                                                            }),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              _heightScale * 20,
                                                          color:
                                                              backgroundColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              _heightScale * 40,
                                                        ),
                                                      ],
                                                    ),
                                        ],
                                      ),
                                      // }),
                                    ),
                            ],
                          );
              }),
        ),
      ),
    );
  }

  Widget Appointment(String id, String date, String topic) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Booking Id : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              id,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 12,
        ),
        Row(
          children: [
            Text(
              "Date : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              date,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 12,
        ),
        Row(
          children: [
            Text(
              "Topic : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12,
                  color: black(context),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              topic,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 12, color: black(context)),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 35,
        ),
      ],
    );
  }

  Widget Appointments(
      String id, String name, String date, String topic, int amount) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(230, 236, 236, 236),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 8, right: 8, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Date : ",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color: black(context),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12, color: black(context)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Booking Id : ",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color: black(context),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    id,
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12, color: black(context)),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 2,
              ),
              Row(
                children: [
                  Text(
                    "Professional Name: ",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color: black(context),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12, color: black(context)),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 2,
              ),
              Row(
                children: [
                  Text(
                    "Topic : ",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color: black(context),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    topic,
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12, color: black(context)),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 2,
              ),
              Row(
                children: [
                  Text(
                    "Amount : ",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color: black(context),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "₹ $amount",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12, color: black(context)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
