import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/slotConfirmation.dart';
import 'package:http/http.dart' as http;
import 'package:heybuddy/api/getProfessionalUsers.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/widgets/custom_drop_down_button.dart';
import 'package:intl/intl.dart';
import '../api/email_verification.dart';
import '../provider/styles.dart';

class SlotBookTime extends StatefulWidget {
  var i;
  String fcm;
  SlotBookTime({required this.i, required this.fcm});
  // const SlotBookTime({Key? key}) : super(key: key);

  @override
  _SlotBookTimeState createState() => _SlotBookTimeState();
}

class _SlotBookTimeState extends State<SlotBookTime> {
  var tkn = datam.read('f');
  String price = "";
  TextEditingController _topics = TextEditingController();
  var pickedDate;
  var newDate;
  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    onTap();
    getText();
  }

  var res;
  List vv = [];
  getUsers(page) async {
    res = await getProfessionalData(page);
    vv = res;
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    newDate = await showDatePicker(
      context: context,
      initialDate: pickedDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => pickedDate = newDate);
  }

  var todaydate = DateTime.now().day.toInt();
  var todaymonth = DateTime.now().month.toInt();
  var todayyear = DateTime.now().year.toInt();
  var ffff;
  var ffff1;
  var ffff2;
  String getText() {
    if (pickedDate == null) {
      return 'Select Date';
    } else {
      ffff = DateFormat('dd').format(pickedDate);
      ffff1 = DateFormat('MM').format(pickedDate);
      ffff2 = DateFormat('yyyy').format(pickedDate);
      print("today isf $ffff");
      print("today isf1 $ffff1");
      print("today isf2 $ffff2");
      print("today is date $todaydate");
      print("today is month $todaymonth");
      print("today is year $todayyear");

      return DateFormat('MM-dd-yyyy').format(pickedDate);

      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  var output;
  onTap() async {
    output = await UniqueUser.uniqueUser(widget.i);
    getBookingPrice(output['user'][0]['_id'], _value);

    return output;
  }

  var x;
  var x2;
  getgf() async {
    x = List.generate(
        output['user'][0]["skills"] != null
            ? output['user'][0]["skills"].length
            : 0,
        (index) => output['user'][0]["skills"][index]['name']);

    return x;
  }

  var _value = "general conversation";

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    // getgf();
    // print("x is $x");
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );

    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );

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
          "Book Session",
          style: TextStyle(
              color: Styles.isDark ? text7 : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      // backgroundColor: backgroundColor,
      body: FutureBuilder(
          future: onTap(),
          builder: (context, snapShot) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Column(
                  children: [
                    SizedBox(height: _heightScale * 20),
                    fields("Add topics to discuss"),
                    SizedBox(height: _heightScale * 10),
                    Row(
                      children: [
                        Text(
                          "Select Skills for Discussion",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: _heightScale * 16),
                    // fields("Java"),
                    FutureBuilder(
                        future: getgf(),
                        builder: (context, snapShot) {
                          return Container(
                              child: CustomDropDownButton(
                                  widthScale: 20,
                                  hintText: //res[widget.i]["skills"] != null
                                      "General Conversation",
                                  items: x != null ? x : [], //getgf(),
                                  onChange: (var xx) {
                                    print("object: " +
                                        output['user'][0]['_id'].toString());

                                    {
                                      setState(() {
                                        _value = xx;
                                      });
                                    }
                                    getBookingPrice(
                                        output['user'][0]['_id'], _value);
                                  },
                                  value: _value));
                        }),
                    SizedBox(height: _heightScale * 15),
                    Row(
                      children: [
                        Text(
                          "Select Date",
                          style: GoogleFonts.poppins(
                              fontSize: _widthScale * 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: _heightScale * 12),
                    Container(
                      //margin: EdgeInsets.only(left: 20, right: 20),
                      height: _heightScale * 56,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: white(context).withOpacity(0.5),
                        borderRadius:
                            BorderRadius.all(Radius.circular(_widthScale * 6)),
                      ),
                      child: ListTile(
                        title: Text(
                          getText(),
                          style:
                              GoogleFonts.poppins(fontSize: _widthScale * 16),
                        ),
                        // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                        trailing: InkWell(
                            onTap: () => pickDate(context),
                            child: Image.asset(
                              "assets/Group 804.png",
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    SizedBox(height: _heightScale * 16),
                    fieldss("Total Amount :", "Rs $price/-"),
                    SizedBox(
                      height: _heightScale * 160,
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: _heightScale * 56,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
            onPressed: () {
              if (_topics.text.isEmpty) {
                print("today is ffff$ffff");
                print("today is today$todaydate");
                const snackBar = SnackBar(
                  content: Text("Fill the topic First."),
                  duration: Duration(milliseconds: 2000),
                  backgroundColor: text6,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (int.parse(ffff) < todaydate ||
                  int.parse(ffff1) < todaymonth ||
                  int.parse(ffff2) < todayyear) {
                print("today is ffff$ffff");
                print("today is today$todaydate");
                const snackBar = SnackBar(
                  content: Text("Choose Future Date"),
                  duration: Duration(milliseconds: 2000),
                  backgroundColor: text6,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                print("object" + _value);
                print("object" +
                    output['user'][0]["skills"][0]['price'].toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SlotConfirm(
                              i: output['user'][0]["phone"],
                              topics: _topics.text.trim(),
                              date: getText(),
                              lang: _value,
                              fcmToken: widget.fcm,
                              price: int.parse(price),
                            )));
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
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            )),
      ),
    );
  }

  Widget fieldss(String title, String name) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 16,
        ),

        Container(
          color: white(context).withOpacity(0.5),
          height: _heightScale * 48,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(
              left: _widthScale * 16.0,
              //  top: _heightScale * 16,
              // bottom: _heightScale * 16
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: _widthScale * 16,
                        color: black(context), // text12.withOpacity(0.8),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: _heightScale * 20,
        ),
      ],
    );
  }

  Widget fields(String title) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 30,
        // ),Tex Text(
        Text(
          "Session Notes*",
          style: GoogleFonts.poppins(
              fontSize: _widthScale * 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            "Note : Mention only the points that you would like to discuss in this session",
            style: GoogleFonts.poppins(
                fontSize: _widthScale * 8, fontWeight: FontWeight.w300)),
        TextField(
          controller: _topics,
          keyboardType: TextInputType.text,
          autofocus: false,
          minLines: 1,
          maxLines: 5,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            // suffix: Padding(
            //   padding: EdgeInsets.only(right: _widthScale * 10.0),
            //   child: Icon(Icons.arrow_drop_down_sharp),
            // ),
            fillColor: white(context).withOpacity(0.5),
            hintText: title,
            hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: _widthScale * 16,
                    color: text12.withOpacity(0.8))),
            contentPadding: EdgeInsets.only(
                left: _widthScale * 14.0,
                bottom: _heightScale * 8.0,
                top: _heightScale * 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: col1),
              borderRadius: BorderRadius.circular(_widthScale * 6),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: textFieldColor(context),
              ),
              borderRadius: BorderRadius.circular(_widthScale * 6),
            ),
          ),
        ),
      ],
    );
  }

  Widget button(String time, Color col, Color col2) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: col,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            time,
            style: GoogleFonts.poppins(fontSize: 14, color: col2),
          ),
        ));
  }

  getBookingPrice(String userID, lang) async {
    try {
      http.Response res = await http.post(
          Uri.parse(
              'https://heybuddybackend.herokuapp.com/api/user/getSkillPrice'),
          headers: {
            "x-access-token": tkn.toString(),
          },
          body: {
            "id": userID.toString(),
            "skill": "$lang"
          });
      print("resbody${json.decode(res.body)['price']}");

      setState(() {
        price = json.decode(res.body)['price'].toString();
      });
      if (res.statusCode == 200) {
      } else {
        print("rescode${res.statusCode}");
        print("resbody${res.body}");
      }
    } catch (e) {
      print("resbody${e.toString()}");
    }
  }
}
