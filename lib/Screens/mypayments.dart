// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/MyPayments.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../provider/styles.dart';

class MyPayments extends StatefulWidget {
  var joinDate;
  MyPayments({Key? key, required this.joinDate}) : super(key: key);

  @override
  _MyPaymentsState createState() => _MyPaymentsState();
}

class _MyPaymentsState extends State<MyPayments> {
  var getJan;
  var getFeb;
  var getMarch;
  var getApril;
  var getMay;
  var getJun;
  var getJul;
  var getAug;
  var getSep;
  var getOct;
  var getNov;
  var getDec;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("RTRTR" + "${widget.joinDate}");
    getData();
    getYear();
  }

  var _items = [""];

  getYear() {
    for (int i = widget.joinDate; i <= int.parse(currentYear); i++) {
      _items.add(i.toString());
    }
    _items.remove("");
    print("RTRTR" + "${_items}");
  }

  var tkn = datam.read('f');
  var response;
  var res;
  // List res = [];
  getData() async {
    res = await mypayment(tkn, currentYear);
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

  var currentYear = DateTime.now().year.toString();

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
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          "My Earnings",
          style: GoogleFonts.poppins(
              color:
                  Styles.isDark ? Colors.white : Color.fromRGBO(34, 50, 99, 1),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: Column(
            children: [
              SizedBox(
                height: 10,
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
                      padding:
                          const EdgeInsets.only(left: 30.0, top: 8, bottom: 8),
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
                      padding:
                          const EdgeInsets.only(right: 30.0, top: 8, bottom: 8),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 8,
                        underline: SizedBox(),
                        value: currentYear,
                        items: _items.toSet().map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 12, 12, 12),
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
              FutureBuilder(
                  future: getData(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    print("QWERTYUI : " + res['data'].toString());
                    if (res['data'][11].length > 0) {
                      getJan = (res['data'][11].length) - 2;
                    } else {
                      getJan = (res['data'][11].length);
                    }
                    if (res['data'][10].length > 0) {
                      getFeb = (res['data'][10].length) - 2;
                    } else {
                      getFeb = (res['data'][10].length);
                    }
                    if (res['data'][9].length > 0) {
                      getMarch = (res['data'][9].length) - 2;
                    } else {
                      getMarch = (res['data'][9].length);
                    }
                    if (res['data'][8].length > 0) {
                      getApril = (res['data'][8].length) - 2;
                    } else {
                      getApril = (res['data'][8].length);
                    }
                    if (res['data'][7].length > 0) {
                      getMay = (res['data'][7].length) - 2;
                    } else {
                      getMay = (res['data'][7].length);
                    }
                    if (res['data'][6].length > 0) {
                      getJun = (res['data'][6].length) - 2;
                    } else {
                      getJun = (res['data'][6].length);
                    }
                    if (res['data'][5].length > 0) {
                      getJul = (res['data'][5].length) - 2;
                    } else {
                      getJul = (res['data'][5].length);
                    }
                    if (res['data'][4].length > 0) {
                      getAug = (res['data'][4].length) - 2;
                    } else {
                      getAug = (res['data'][4].length);
                    }
                    if (res['data'][3].length > 0) {
                      getSep = (res['data'][3].length) - 2;
                    } else {
                      getSep = (res['data'][3].length);
                    }
                    if (res['data'][2].length > 0) {
                      getOct = (res['data'][2].length) - 2;
                    } else {
                      getOct = (res['data'][2].length);
                    }
                    if (res['data'][1].length > 0) {
                      getNov = (res['data'][1].length) - 2;
                    } else {
                      getNov = (res['data'][1].length);
                    }
                    if (res['data'][0].length > 0) {
                      getDec = (res['data'][0].length) - 2;
                    } else {
                      getDec = (res['data'][0].length);
                    }

                    return res == null
                        ? Container(
                            height: _heightScale * 600,
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ))
                        : res['data'][11][getJan] == 0 &&
                                res['data'][10][getFeb] == 0 &&
                                res['data'][9][getMarch] == 0 &&
                                res['data'][8][getApril] == 0 &&
                                res['data'][7][getMay] == 0 &&
                                res['data'][6][getJun] == 0 &&
                                res['data'][5][getJul] == 0 &&
                                res['data'][4][getAug] == 0 &&
                                res['data'][3][getSep] == 0 &&
                                res['data'][2][getOct] == 0 &&
                                res['data'][1][getNov] == 0 &&
                                res['data'][0][getDec] == 0
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
                                  res['data'][11][getJan] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][11][getJan]})",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand0 == false
                                                  ? Container()
                                                  : res['data'][11].isEmpty
                                                      ? Container()
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][11]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][11][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][11][index1][
                                                                            'orderId'],
                                                                        res['data'][11][index1]['Date'].toString().replaceRange(
                                                                            10,
                                                                            24,
                                                                            ""),
                                                                        res['data'][11][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][11]
                                                                                [index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][11][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][11][index1]
                                                                            ['professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][10][getFeb] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][10][getFeb]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand1 == false
                                                  ? Container()
                                                  : res['data'][10].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][10]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][10][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][10][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][10][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][10][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][10][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][10][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][9][getMarch] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][9][getMarch]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand2 == false
                                                  ? Container()
                                                  : res['data'][9].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][9]
                                                                              .length -
                                                                          2,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][9][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][9][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][9][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][9][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][9][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][9][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][8][getApril] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][8][getApril]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand3 == false
                                                  ? Container()
                                                  : res['data'][8].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][8]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][8][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][8][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][8][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][8][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][8][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][8][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][7][getMay] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][7][getMay]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand4 == false
                                                  ? Container()
                                                  : res['data'][7].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][7]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][7][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][7][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][7][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][7][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][7][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][7][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][6][getJun] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][6][getJun]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand5 == false
                                                  ? Container()
                                                  : res['data'][6].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][6]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][6][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][6][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][6][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][6][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][6][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][6][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][5][getJul] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][5][getJul]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand6 == false
                                                  ? Container()
                                                  : res['data'][5].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][5]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][5][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][5][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][5][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][5][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][5][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][5][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][4][getAug] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][4][getAug]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand7 == false
                                                  ? Container()
                                                  : res['data'][4].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][4]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][4][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][4][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][4][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][4][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][4][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][4][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][3][getSep] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][3][getSep]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand8 == false
                                                  ? Container()
                                                  : res['data'][3].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][3]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][3][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][3][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][3][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][3][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][3][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][3][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][2][getOct] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
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
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][2][getOct]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand9 == false
                                                  ? Container()
                                                  : res['data'][2].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][2]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][2][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][2][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][2][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][2][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][2][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][2][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][1][getNov] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isExpand10 =
                                                            !isExpand10;
                                                      });
                                                      // vvv(val);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][1][getNov]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand10 == false
                                                  ? Container()
                                                  : res['data'][1].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][1]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][1][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][1][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][1][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][1][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][1][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][1][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                  res['data'][0][getDec] == 0
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isExpand11 =
                                                            !isExpand11;
                                                      });
                                                      // vvv(val);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            "assets/coin.png"),
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
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize:
                                                                      _widthScale *
                                                                          18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20.0),
                                                          child: Text(
                                                            "₹ ${res['data'][0][getDec]}",
                                                            style: GoogleFonts.poppins(
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
                                              isExpand11 == false
                                                  ? Container()
                                                  : res['data'][0].isEmpty
                                                      ? Container(
                                                          height:
                                                              _heightScale * 80,
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                            child: Text(
                                                                "Nothing to show !"),
                                                          ))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      197,
                                                                      191,
                                                                      241,
                                                                      245),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemCount:
                                                                      res['data'][0]
                                                                              .length -
                                                                          1,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index1) {
                                                                    var date = res['data'][0][index1]
                                                                            [
                                                                            'Date']
                                                                        .split(
                                                                            '-');
                                                                    var mon = int
                                                                        .parse(date[
                                                                            1]);
                                                                    var getDate0 =
                                                                        date[2]
                                                                            [0];
                                                                    var getDate1 =
                                                                        date[2]
                                                                            [1];
                                                                    var getDate =
                                                                        getDate0 +
                                                                            getDate1;

                                                                    var finalDate = getDate +
                                                                        " " +
                                                                        months[mon -
                                                                            1] +
                                                                        ', ' +
                                                                        date[0];
                                                                    return Appointment(
                                                                        res['data'][0][index1]
                                                                            [
                                                                            'orderId'],
                                                                        finalDate,
                                                                        res['data'][0][index1]
                                                                            [
                                                                            'topic'],
                                                                        res['data'][0][index1]
                                                                            [
                                                                            'amount'],
                                                                        res['data'][0][2] ==
                                                                                true
                                                                            ? true
                                                                            : false,
                                                                        res['data'][0][index1]
                                                                            [
                                                                            'professionalCommission']);
                                                                  }),
                                                            ],
                                                          ),
                                                        ),
                                              SizedBox(
                                                height: _heightScale * 40,
                                              ),
                                            ],
                                          ),
                                          // }),
                                        ),
                                ],
                              );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget Appointment(String id, String date, String topic, int amount,
      bool amountDone, int proCom) {
    var getCommission = (proCom * 100) / amount;
    var getList = getCommission.toString().split(".");
    var getFinalCom = getList[0] + "." + getList[1];
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 8, right: 8, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Booking Id : ",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          id,
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black),
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
                              color:
                                  Styles.isDark ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black),
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
                              color:
                                  Styles.isDark ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          topic,
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _heightScale * 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Earning :₹ ",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$amount",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _heightScale * 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Payout Percentage : ",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "$getFinalCom%",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 12,
                              color:
                                  Styles.isDark ? Colors.black : Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            amountDone == true
                ? Text(
                    "Earning of this month has been processed",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color: Colors.green,
                        fontWeight: FontWeight.w600),
                  )
                : Text(
                    "Earning of this month has not been processed",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  )
          ],
        ),
      ),
    );
  }
}
