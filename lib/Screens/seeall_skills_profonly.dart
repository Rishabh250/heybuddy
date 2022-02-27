import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/deleteskill.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';

class SeeAllSkillsProfOnly extends StatefulWidget {
  // var uniqueid;
  // SeeAllHistoryProfOnly({required this.uniqueid});
  const SeeAllSkillsProfOnly({Key? key}) : super(key: key);

  @override
  _SeeAllSkillsProfOnlyState createState() => _SeeAllSkillsProfOnlyState();
}

class _SeeAllSkillsProfOnlyState extends State<SeeAllSkillsProfOnly> {
  @override
  void initState() {
    super.initState();
    onTap();
  }

  List z = [];
  // List x = [];
  var xy;
  var tkn = datam.read('f');
  var response;
  List vv = [];
  // List pp = [];
  onTap() async {
    response = await getdata(tkn);
    // pp = response;
    setState(() {
      iii = false;
    });
    return response;
    // setState(() {
    //   vv = [...vv, ...response];
    //   // response;
    // });
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

  getgh() async {
    // x = List.generate(
    //     response["skills"] != null ? response["skills"].length : 0,
    // (index) => response["skills"].length.toString());
    z = response["company"];
    print("val of z is$z");
    return z;
  }

  // var y;
  // getcompanylength() async {
  //   y = response["company"].length;
  //   print("val of y is$y");
  //   return y;
  // }

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

  var delskill;
  bool iii = false;

  del(var name) async {
    setState(() {
      // ii = true;
      iii = true;
    });
    delskill = await DeleteSkill.delete(name.toString().toLowerCase(), tkn);
    print("skill name is ${name.toString().toLowerCase()}");
    setState(() {
      onTap();
      // ii = false;
      // iii = ii;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white(context),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Styles.isDark ? whites.withOpacity(0.8) : text9,
          ),
        ),
        title: Text(
          "Skills",
          style: GoogleFonts.poppins(
              color:black(context), fontSize: _widthScale * 18),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: onTap(),
            builder: (context, snapShot) {
              return (response == null || iii == true)
                  ? Container(
                      height: _heightScale * 680,
                      width: double.infinity,
                      child: Center(child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        FutureBuilder(
                            future: getgf(),
                            builder: (context, snapShot) {
                              return x == 0
                                  ? Container(
                                      height: _heightScale * 50,
                                      width: double.infinity,
                                      // color: Colors.yellow,
                                      child: Center(
                                          child: Text(
                                        "No Skills added",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 14,
                                            color: black(context)),
                                      )),
                                    )
                                  : Container(
                                      height: _heightScale * 700,
                                      width: double.infinity,
                                      // _widthScale * 350, // double.infinity,
                                      child: ListView.builder(
                                          itemCount: x != null ? x : 0,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                child: button(
                                                    getCapitalizeStringaa(
                                                        response["skills"]
                                                            [index]['name']),
                                                    getCapitalizeStringaa(
                                                        response["skills"]
                                                                [index]['price']
                                                            .toString()),
                                                    text6,
                                                    white(context),
                                                    index));
                                          }),
                                    );
                            }),
                      ],
                    );
            }),
      ),
    );
  }

  Widget button(String time, String amt, Color col, Color col2, int i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        Stack(children: [
          Row(
            children: [
              SizedBox(
                width: _widthScale * 20,
              ),
              ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_widthScale * 5.0)),
                  child: Image.asset(
                    "assets/Skill Set.png",
                    height: _heightScale * 50,
                    width: _widthScale * 50,
                    fit: BoxFit.fill,
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: _widthScale * 20),
                height: _heightScale * 58,
                width: _widthScale * 250, //double.infinity,
                decoration: BoxDecoration(
                    color: white(context).withOpacity(0.39),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color:
                            // isLoading == true ? white.withOpacity(0.39) :
                            text6)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _widthScale * 15.0,
                      vertical: _heightScale * 12),
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
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: _widthScale * 45.0, top: _heightScale * 5),
                child: GestureDetector(
                  onTap: () {
                    del(time);
                  },
                  child: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ]),
        SizedBox(
          height: _heightScale * 15,
        )
      ],
    );
  }

  Widget buttons(String time, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Padding(
      padding: EdgeInsets.only(left: _widthScale * 20.0),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[50],
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(_widthScale * 8.0),
            child: Row(
              children: [
                Text(
                  time,
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14, color: whiteBox(context)),
                ),
              ],
            ),
          )),
    );
  }

  Widget buttonss(String time, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        Container(
            height: _heightScale * 38,
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
        SizedBox(
          height: _heightScale * 5,
        ),
      ],
    );
  }
}
