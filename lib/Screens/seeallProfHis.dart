import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/delete_company.dart';
import 'package:heybuddy/api/delete_university.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';

class SeeAllHistoryProfOnly extends StatefulWidget {
  // var uniqueid;
  // SeeAllHistoryProfOnly({required this.uniqueid});
  const SeeAllHistoryProfOnly({Key? key}) : super(key: key);

  @override
  _SeeAllHistoryProfOnlyState createState() => _SeeAllHistoryProfOnlyState();
}

class _SeeAllHistoryProfOnlyState extends State<SeeAllHistoryProfOnly> {
  @override
  void initState() {
    super.initState();
    onTap();
  }

  List z = [];
  List x = [];
  var xy;
  var tkn = datam.read('f');
  var response;
  List vv = [];
  // List pp = [];
  onTap() async {
    response = await getdata(tkn);
    // pp = response;
    return response;
    // setState(() {
    //   vv = [...vv, ...response];
    //   // response;
    // });
  }
  // var output;
  // onTap() async {
  //   output = await UniqueUser.uniqueUser(widget.uniqueid);
  //   return output;
  // }

  getgh() async {
    // x = List.generate(
    //     response["skills"] != null ? response["skills"].length : 0,
    // (index) => response["skills"].length.toString());
    z = response["company"];
    print("val of z is$z");
    return z;
  }

  var y;
  getcompanylength() async {
    y = response["company"].length;
    print("val of x is$y");
    return y;
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

  Future showAlertDialog(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            insetPadding: EdgeInsets.symmetric(horizontal: 30),
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_widthScale * 12),
            ),
            title: Text(
              "Do you want delete this professional history",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 16, color: black(context)),
              ),
            ),
            actions: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _widthScale * 20.0),
                    child: Container(
                      width: double.infinity,
                      height: _heightScale * 45,
                      child: ElevatedButton(
                          onPressed: () {
                            // onSubmitttt();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: text6,
                            shape: new RoundedRectangleBorder(
                              borderRadius:
                                  new BorderRadius.circular(_widthScale * 10.0),
                            ),
                          ),
                          child: Text(
                            'Confirm',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: _widthScale * 18),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: _heightScale * 10,
                  ),
                ],
              ),
            ],
          );
        });
  }

  var iii = false;
  var delprofessionalhistory;
  del(var id, var ii) async {
    setState(() {
      ii = true;
      iii = ii;
    });
    print("deluniis$id");
    delprofessionalhistory = await DeleteCompany.delete(id, tkn);
    if (mounted) {
      setState(() {
        onTap();
        ii = false;
        iii = ii;
      });
    }
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
          "Professional History",
          style: GoogleFonts.poppins(
              color: black(context), fontSize: _widthScale * 18),
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
                                            height: _heightScale * 700,
                                            width: double.infinity,
                                            child: ListView.builder(
                                                // physics:
                                                //     NeverScrollableScrollPhysics(),
                                                itemCount: y != null ? y : 0,
                                                itemBuilder: (context, index) {
                                                  return topics(
                                                      "assets/Employment.png",
                                                      // response["company"] != []
                                                      //     ?
                                                      response["company"][index]
                                                                  ['title'] ==
                                                              ""
                                                          ? "Not Mentioned Yet"
                                                          : response["company"]
                                                              [index]['title'],
                                                      // : "Enter Your Details",
                                                      response["company"][index]
                                                          ['company_name'],
                                                      response["company"][index]
                                                                  ['year'] ==
                                                              0
                                                          ? '${response["company"][index]['month']} months'
                                                          : '${response["company"][index]['year']} Yrs' +
                                                              ' ${response["company"][index]['month']} months',
                                                      index);
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

  Widget topics(String img, String title, String subtitle, String time, int i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Stack(
      // alignment: Alignment.topRight,
      children: [
        Container(
          // margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.only(
              top: _heightScale * 10, bottom: _heightScale * 10),
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
                  Text(
                    getCapitalizeStringaa(title),
                    style: GoogleFonts.poppins(fontSize: _widthScale * 16),
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
                          style:
                              GoogleFonts.poppins(fontSize: _widthScale * 12)),
                      SizedBox(
                        height: _heightScale * 2,
                      ),
                      Row(
                        children: [
                          Text(time, style: GoogleFonts.poppins(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: _widthScale * 25.0, top: _heightScale * 25),
              child: GestureDetector(
                onTap: () {
                  // showAlertDialog(context);
                  del(response["company"][i]['_id'], iii);
                },
                child: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
