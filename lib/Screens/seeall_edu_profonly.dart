import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/delete_university.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';

class SeeAllEducationProfOnly extends StatefulWidget {
  // var uniqueid;
  // SeeAllHistoryProfOnly({required this.uniqueid});
  const SeeAllEducationProfOnly({Key? key}) : super(key: key);

  @override
  _SeeAllEducationProfOnlyState createState() =>
      _SeeAllEducationProfOnlyState();
}

class _SeeAllEducationProfOnlyState extends State<SeeAllEducationProfOnly> {
  @override
  void initState() {
    super.initState();
    onTap();
  }

  // List z = [];
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

  // getgh() async {
  //   z = response["company"];
  //   print("val of z is$z");
  //   return z;
  // }

  // var y;
  // getcompanylength() async {
  //   y = response["company"].length;
  //   print("val of x is$y");
  //   return y;
  // }
  List zz = [];
  gethh() async {
    zz = response["education"];
    print("val of zz is$zz");
    return zz;
  }

  var yy;
  geteducationlength() async {
    yy = response["education"].length;
    print("val of y is$yy");
    return yy;
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

  bool iii = false;
  var deleteducation;
  del(var id, bool ii) async {
    setState(() {
      ii = true;
      iii = ii;
    });
    print("deluniis$id");
    deleteducation = await DeleteUniversity.delete(id, tkn);
    setState(() {
      onTap();
      ii = false;
      iii = ii;
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
          "Education",
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
                            future: geteducationlength(),
                            builder: (context, snapShot) {
                              return FutureBuilder(
                                  future: gethh(),
                                  builder: (context, snapShot) {
                                    return zz.isEmpty
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
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: yy != null ? yy : 0,
                                                itemBuilder: (context, index) {
                                                  return topics(
                                                      "assets/Employment.png",
                                                      response["education"]
                                                                      [index]
                                                                  ['uni'] ==
                                                              ""
                                                          ? "Not Mentioned Yet"
                                                          : response[
                                                                  "education"]
                                                              [index]['uni'],
                                                      response["education"]
                                                          [index]['course'],
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

  Widget topics(String img, String title, String subtitle, int i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          padding: EdgeInsets.only(
              top: _heightScale * 10, bottom: _heightScale * 10),
          decoration: BoxDecoration(
            color: white(context).withOpacity(0.39),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
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
                  height: _heightScale * 6,
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Column(
                  children: [
                    Text(getCapitalizeStringaa(subtitle),
                        style: GoogleFonts.poppins(fontSize: _widthScale * 12)),
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
        GestureDetector(
          onTap: () {
            del(response["education"][i]['_id'], iii);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: _widthScale * 25.0, top: _heightScale * 25),
                child: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
