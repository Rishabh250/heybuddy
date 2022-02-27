import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';

class SeeAllSkills extends StatefulWidget {
  var uniqueid;
  SeeAllSkills({required this.uniqueid});
  // const SeeAllHistory({Key? key}) : super(key: key);

  @override
  _SeeAllSkillsState createState() => _SeeAllSkillsState();
}

class _SeeAllSkillsState extends State<SeeAllSkills> {
  @override
  void initState() {
    super.initState();
    onTap();
  }

  List z = [];
  List x = [];
  var xy;

  var output;
  onTap() async {
    output = await UniqueUser.uniqueUser(widget.uniqueid);
    return output;
  }

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

  getgf() async {
    x = output['user'][0]["skills"];
    return x;
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

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar(context), //white(context),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Styles.isDark ? whites : text9,
          ),
        ),
        title: Text(
          "Skills",
          style: GoogleFonts.poppins(
              color: black(context), fontSize: _widthScale * 18),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: onTap(),
            builder: (context, snapShot) {
              return output == null
                  ? Container(
                      height: _heightScale * 680,
                      width: double.infinity,
                      child: Center(child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        SizedBox(
                          height: _heightScale * 20,
                        ),
                        FutureBuilder(
                            future: getgf(),
                            builder: (context, snapShot) {
                              return x.isEmpty
                                  ? Container(
                                      height: _heightScale * 50,
                                      width:
                                          _widthScale * 375, //double.infinity,
                                      // color: Colors.yellow,
                                      child: Center(
                                          child: Text(
                                        "No Skills added",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 14,
                                            color: black(context)),
                                      )),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: _widthScale * 20.0),
                                      child: Container(
                                        height: _heightScale * 700,
                                        width: double.infinity,
                                        // _widthScale * 300, // double.infinity,
                                        child: ListView.builder(
                                            itemCount: output['user'][0]
                                                        ["skills"] !=
                                                    null
                                                ? output['user'][0]["skills"]
                                                    .length
                                                : 0,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                  child: button(
                                                      output['user'][0]
                                                              ["skills"][index]
                                                          ['name'],
                                                      output['user'][0]
                                                                  ["skills"]
                                                              [index]['price']
                                                          .toString(),
                                                      text6,
                                                      white(context)));
                                            }),
                                      ),
                                    );
                            }),
                      ],
                    );
            }),
      ),
    );
  }

  Widget button(String time, String amt, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(_widthScale * 5.0)),
                child: Image.asset(
                  "assets/Skill Set.png",
                  height: _heightScale * 50,
                  width: _widthScale * 50,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: _widthScale * 20,
            ),
            Container(
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
                    vertical: _heightScale * 15),
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
              ),
            ),
          ],
        ),
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

    return ElevatedButton(
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
        ));
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
}
