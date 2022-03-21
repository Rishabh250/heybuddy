import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/reffered.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as https;
import '../color&font/colors.dart';
import '../provider/styles.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({Key? key}) : super(key: key);

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  var getValues = Get.arguments;
  String appLink = "";

  @override
  void initState() {
    print("CODERTETT" + getValues[0]['code'].toString());
    getappLink();
    super.initState();
  }

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );
    Widget spacehort = SizedBox(
      width: size.width * 0.06,
    );
    Widget spacehort1 = SizedBox(
      width: size.width * 0.2,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );
    Widget spacevert2 = SizedBox(
      height: size.height * 0.03,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: appbar(context),
        title: Builder(builder: (context) {
          return Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    // color: Colors.yellow,
                    height: _heightScale * 30,
                    width: _widthScale * 35,
                    child: Center(
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Styles.isDark ? Colors.white : Colors.black,
                          )),
                    ),
                  )),
              SizedBox(
                width: _widthScale * 84, //120,
              ),
              Image.asset(
                "assets/hort2.png",
                height: _heightScale * 25,
                width: _widthScale * 115,
              ),
            ],
          );
        }),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(controller: _controller, children: [
          Image.asset('assets/referimage.png'),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text("Referral Code : ${getValues[0]['code']}",
                style: GoogleFonts.poppins(
                    fontSize: _widthScale * 20, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Share.share(
                  "Hey!,This is ${getValues[1]['name']} download this cool app 'Hitikit' using this $appLink and use my referral code : ${getValues[0]['code']}");
            },
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text("Share",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: _widthScale * 20,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text("Referred Users : ",
              style: GoogleFonts.poppins(
                  fontSize: _widthScale * 20, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 30,
          ),
          FutureBuilder(
              future: fetchResponds(getValues[2]['token']),
              builder: (context, AsyncSnapshot snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapShot.hasData) {
                  var data = snapShot.requireData;
                  return ListView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                      itemCount: data.refferStatus.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data.refferStatus[index].user.name,
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("Booking Made : ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            data.refferStatus[index]
                                                        .bookingMade ==
                                                    "false"
                                                ? "No"
                                                : "Yes",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text("Cashback Status : ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            data.refferStatus[index]
                                                        .cashbackStatus ==
                                                    "false"
                                                ? "Not Processed"
                                                : "Processed",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }
                return Container();
              })
        ]),
      ),
    );
  }

  getappLink() async {
    try {
      var response = await https.get(
        Uri.parse('https://heybuddybackend.herokuapp.com/api/getRefferalLink'),
      );

      setState(() {
        appLink = json.decode(response.body)["link"];
      });

      print('RRRRRRRRRRRRRRRRRRtt : $appLink');

      if (response.statusCode == 200) {
        return appLink;
      } else if (response.statusCode == 400) {
      } else {
        return null;
      }
    } catch (e) {
      print("RRRRRRRRRRRRRRRRRR" + e.toString());
    }
  }
}
