import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';

class SeeAllHistory extends StatefulWidget {
  var uniqueid;
  SeeAllHistory({required this.uniqueid});
  // const SeeAllHistory({Key? key}) : super(key: key);

  @override
  _SeeAllHistoryState createState() => _SeeAllHistoryState();
}

class _SeeAllHistoryState extends State<SeeAllHistory> {
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

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:appbar(context),// white(context),
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
          "Professional History",
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
                                                style: GoogleFonts.poppins(
                                                    fontSize: _widthScale * 14,
                                                    color: black(context)),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            // color: Colors.yellow,
                                            height: _heightScale * 700,
                                            width: double.infinity,
                                            child: ListView.builder(
                                                itemCount: y != null ? y : 0,
                                                itemBuilder: (context, index) {
                                                  return topics(
                                                      "assets/Employment.png",
                                                      // response["company"] != []
                                                      //     ?
                                                      output['user'][0]["company"][index]
                                                                  ['title'] ==
                                                              ""
                                                          ? "Not Mentioned"
                                                          : output['user'][0]
                                                                  ["company"]
                                                              [index]['title'],
                                                      // : "Enter Your Details",
                                                      output['user'][0]
                                                              ["company"][index]
                                                          ['company_name'],
                                                      output['user'][0]["company"]
                                                                      [index]
                                                                  ['year'] ==
                                                              0
                                                          ? '${output['user'][0]["company"][index]['month']} months'
                                                          : '${output['user'][0]["company"][index]['year']} Yrs' +
                                                              ' ${output['user'][0]["company"][index]['month']} months');
                                                }),
                                          );
                                  });
                            }),
                      ],
                    );
            }),
      ),
    );
  }

  Widget topics(String img, String title, String subtitle, String time) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: _widthScale * 10),
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
              Row(
                children: [
                  Text(
                    getCapitalizeStringaa(title),
                    style: GoogleFonts.poppins(fontSize: _widthScale * 16),
                  ),
                ],
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
                      style: GoogleFonts.poppins(
                          fontSize: _widthScale * 12, color: text10)),
                  SizedBox(
                    height: _heightScale * 2,
                  ),
                  Row(
                    children: [
                      Text(time,
                          style:
                              GoogleFonts.poppins(fontSize: 12, color: text10)),
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
}
