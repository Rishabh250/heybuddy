import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/bank_details.dart';
import 'package:heybuddy/api/anonymous.dart';
import 'package:heybuddy/api/anonymousget.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/dark_theme_provider.dart';
import 'package:heybuddy/shared_preference/darkmode.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool darkmode = false;
  @override
  void initState() {
    super.initState();
    // intoggle();
    getData();
    // getdataanonmymous();
    // tttoggle(anon);
  }

  bool isSwitch = false;
  tttoggle(var x) {
    if (x == "true") {
      // setState(() {
      isSwitch1 = true;
      // });
    } else if (x == "false") {
      // setState(() {
      isSwitch1 = false;
      // });
    }
  }

  bool isSwitch1 = false;
  var tkn = datam.read('f');
  var output;

  intoggle(String xx) async {
    output = await Anonynmous.choice(xx, tkn);
    // await tttoggle(anon);
    return output;
  }

  var responseaa;
  List vv = [];
  // List pp = [];
  getData() async {
    responseaa = await getdata(tkn);
    // pp = response;
    return responseaa;
  }

  var passval;
  navi() async {
    passval = await responseaa['upiid'];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BankDetails(
                  id: passval,
                )));
  }

  var anon;
  getdataanonmymous() async {
    anon = await getanonymous(tkn);
    print("vvvvvvv$anon");
    if (anon == "true") {
      if (mounted) {
        setState(() {
          isSwitch1 = true;
          EasyLoading.dismiss();
        });
      }
    } else if (anon == "false") {
      if (mounted) {
        setState(() {
          isSwitch1 = false;

          EasyLoading.dismiss();
        });
      }
    }
    // isSwitch1 = anon;
    print("dpppppp$isSwitch1");
    print("anon is $anon");
    print("$anon");
    return anon;
  }

  bool _isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<DarkThemeProvider>(context, listen: true);
    _isDarkTheme = themeProvider.liteTheme;
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar(context),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: black(context),
          ),
        ),
        title: Text(
          "Setting",
          style: GoogleFonts.poppins(
              color: black(context), fontSize: _widthScale * 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: FutureBuilder(
              future: getdataanonmymous(),
              builder: (context, snapShot) {
                // return FutureBuilder(
                //     future: tttoggle(anon),
                //     builder: (context, snapShot) {
                return Column(
                  children: [
                    SizedBox(
                      height: _heightScale * 54,
                    ),
                    Row(
                      children: [
                        // Image.asset("vall.png"),
                        SizedBox(
                          width: _widthScale * 15,
                        ),
                        Icon(
                          Icons.person_add_disabled,
                          color: text6,
                        ),
                        SizedBox(
                          width: _widthScale * 20,
                        ),
                        Text(
                          "Anonymous",
                          style: GoogleFonts.poppins(
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: _widthScale * 95,
                        ),
                        Switch(
                          value: isSwitch1,
                          onChanged: (value) async {
                            print("switch is $isSwitch1");
                            print("switch after $isSwitch1");
                            if (value == true) {
                              print("lllll$isSwitch1");
                              intoggle("true");
                              EasyLoading.show();
                              showAlertDialogss(context);
                              getdataanonmymous();
                              // setState(() {
                              //   isSwitch1 = value;
                              // });
                            } else if (value == false) {
                              intoggle("false");
                              EasyLoading.show();

                              getdataanonmymous();
                              // setState(() {
                              //   isSwitch1 = value;
                              // });
                            }
                          },
                          inactiveTrackColor: Colors.blue[100],
                          activeTrackColor: textFieldColor(context),
                          activeColor: text6,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: _heightScale * 60,
                    ),
                    Row(
                      children: [
                        // Image.asset("vall.png"),
                        SizedBox(
                          width: _widthScale * 15,
                        ),
                        Icon(
                          Icons.dark_mode,
                          color: text6,
                        ),
                        SizedBox(
                          width: _widthScale * 20,
                        ),
                        Text(
                          "Dark Mode",
                          style: GoogleFonts.poppins(
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: _widthScale * 95,
                        ),

                        Switch(
                          onChanged: (bool value) {
                            setState(() {
                              themeProvider.changeTheme(value);
                            });
                          },
                          value: _isDarkTheme,
                          inactiveTrackColor: Colors.blue[100],
                          activeTrackColor: textFieldColor(context),
                          activeColor: text6,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _heightScale * 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => BankDetails()));

                        navi();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: _widthScale * 15,
                          ),
                          Text(
                            "Bank Details",
                            style: GoogleFonts.poppins(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: _widthScale * 135,
                          ),
                          Image.asset(
                            "assets/Arrow 80.png",
                            height: _heightScale * 20,
                            width: _widthScale * 20,
                            color: black(context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _heightScale * 60,
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         darkmode = !darkmode;
                    //         darkk!.setLogin(true);
                    //         darkmode
                    //             ? AdaptiveTheme.of(context).setLight()
                    //             : AdaptiveTheme.of(context).setDark();
                    //       });
                    //     },
                    //     child: Text("sssLight"))
                  ],
                );
                // });
              }),
        ),
      ),
    );
  }

  Future showAlertDialogss(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_widthScale * 12),
            ),
            title: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Information :",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18,
                            color: black(context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.close)),
                  ],
                ),
                SizedBox(
                  height: _heightScale * 10,
                ),
                Text(
                  "Enabling anonymous will make your name and profile picture hidden ",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: 14, color: black(context)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
