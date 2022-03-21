import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/login_signinphone.dart';
import 'package:heybuddy/Screens/logoName.dart';
import 'package:heybuddy/Screens/resetpasswordemail_Screen.dart';
import 'package:heybuddy/api/profileget_api.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/color&font/textStyle.dart';
import 'package:heybuddy/main.dart';
import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:heybuddy/shared_preference/user.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
//   var token = userData['token'];
//   setToken() {
//   token = userData['token'];
// }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginPreference = LoginPreference();
    uperCheck = UpperCheck();
    innerCheck = InnerCheck();
    // chooseLogin();
    // innerCheckLogin();
    // upperCheckLogin();
    // innerCheckLoginn();
    // getData();
    // chooseLogin();
    // innerCheckLogin();
    // upperCheckLogin();
  }

  var tkn = datam.read('f');
  var val;
  var inCheck;
  var upCheck;
  var inCheckk;
  // chooseLogin() async {
  //   val = await loginPreference?.getLoginStatus();
  //   // await innerCheckLogin();
  // }

  // innerCheckLogin() async {
  //   inCheck = await innerCheck?.getLogin();
  //   print("incheckkkk$inCheck");
  // }

  // innerCheckLoginn() async {
  //   inCheckk = await innerCheck?.getLoginn();
  //   print("incheckkkkp$inCheckk");
  // }

  // upperCheckLogin() async {
  //   upCheck = await uperCheck?.getLoginStatus();
  // }
  void showToast() {
    print("is toast comin");
    Fluttertoast.showToast(
      msg: 'Logged In SuccessFully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // timeInSecForIos: 1,
      backgroundColor: text6,
      textColor: white(context),
    );
  }

  var response;
  final storage = new FlutterSecureStorage();
  _onsubmit(BuildContext context) async {
    var firetkn = await firebaseMessaging.getToken();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("fcmToken", firetkn.toString());
    print("tkn is $firetkn");
    var check;
    check = await loginPreference?.getLoginStatus();
    print("fhghd$check");
    //checkStatus(check);
    // var response = await SignIn.signIn(_email.text, _password.text, firetkn);

    if (_email.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter email-id"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (!_email.text.contains('@') || !_email.text.contains('.')) {
      const snackBar = SnackBar(
        content: Text("Enter valid email-id"),
        backgroundColor: text6,
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (_password.text.isEmpty) {
      const snackBar = SnackBar(
        backgroundColor: text6,
        content: Text("Enter password"),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else {
      var response = await SignIn.signIn(_email.text, _password.text, firetkn);
      if (response == true) {
        await login?.setLogin(true);
        if (mounted) {
          setState(() {
            isLoading1 = true;
          });
        }
        // showToast();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Nav1(
                      selectedIndex: 0,
                    )),
            (route) => false);

        print("hh");
        // print("ttttt1${tokenProfile?.token}");
        // getData();
        // print("ttttt${tokenProfile?.token}");
        print("jj");
      } else if (response == "User Not exists") {
        const snackBar = SnackBar(
          content: Text("Invalid email-id"),
          backgroundColor: text6,
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isLoading1 = false;
        });
        // login?.setLogin(false);
      } else if (response == "Password not Matching") {
        const snackBar = SnackBar(
          content: Text("Wrong Password"),
          backgroundColor: text6,
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isLoading1 = false;
        });
        // login?.setLogin(false);
      }
    }
    // else if (response == false) {
    //     const snackBar = SnackBar(
    //       content: Text("User Not Exist"),
    //       duration: Duration(milliseconds: 2000),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     setState(() {
    //       isLoading1 = false;
    //     });
    //     // login?.setLogin(false);
    //   }
  }

  // Future getData() async {
  //   response = await getdetails(tkn);
  //   // Provider.of<Choose>(context, listen: false).changeFavs(response);
  //   print("resssssss$response");
  //   if (response == 'professional') {
  //     // loginPreference?.setLoginStatus(false);
  //     innerCheck?.setLoginn(true);
  //     innerCheck?.setLogin(false);
  //     print("beech1");
  //     return response;
  //   } else if (response == 'aspirant') {
  //     print("bee22");
  //     innerCheck?.setLogin(true);
  //     innerCheck?.setLoginn(false);
  //     // loginPreference?.setLoginStatus(true);
  //     return response;
  //   }
  // }

  bool _passwordVisible = false;
  bool isLoading1 = false;
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    // return FutureBuilder(
    //     future: getData(),
    //     builder: (context, snapShot) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: Column(
            children: [
              logoName(),
              SizedBox(
                height: _heightScale * 77.53,
              ),
              Row(
                children: [
                  Text(
                    "Welcome",
                    style: CustomTextStyle.Blue1(context),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 10,
              ),
              Row(
                children: [
                  Text(
                    "Log In",
                    style: CustomTextStyle.Blue1(context),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 24,
              ),
              TextField(
                controller: _email,
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: black(context)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textFieldColor(context),
                  hintText: 'Enter your registered email',
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 16,
                          color: text12.withOpacity(0.5))),
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
              SizedBox(
                height: _heightScale * 4,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: _widthScale * 16.0),
                    child: Text(
                      "Enter your registered email",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: text2(context),
                            fontSize: _widthScale * 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 32,
              ),
              TextField(
                obscureText: !_passwordVisible, //true,
                controller: _password,
                autofocus: false,
                style: TextStyle(
                    fontSize: _widthScale * 15.0, color: black(context)),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    size: _widthScale * 20,
                  ),
                  filled: true,
                  fillColor: textFieldColor(context),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,

                      color: text6,
                      size: _widthScale * 20,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  hintText: 'Enter Password',
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: _widthScale * 16,
                        color: text12.withOpacity(0.5)),
                  ),
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
              SizedBox(
                height: _heightScale * 4,
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: _widthScale * 16),
              //       child: Text(
              //         "Enter Password",
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               fontSize: _widthScale * 13,
              //               color: text2(context),
              //               fontWeight: FontWeight.w600),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: _heightScale * 4,
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetEmailScreen()));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: _widthScale * 16),
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 13,
                              decoration: TextDecoration.underline,
                              color: text6,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _heightScale * 32,
              ),
              Container(
                height: _widthScale * 56,
                width: double.infinity, //340,
                child: ElevatedButton(
                    onPressed: () async {
                      // getData();
                      if (isLoading1) return;
                      setState(() {
                        isLoading1 = true;
                      });
                      // await Future.delayed(Duration(seconds: 2));
                      await _onsubmit(context);
                      // await getData();
                      // await chooseLogin();
                      // await innerCheckLogin();
                      // await innerCheckLoginn();
                      // print("dppp$inCheck");
                      // print("ankitttt$inCheckk");
                      // await upperCheckLogin();
                      // setState(() {
                      // isLoading1 = false;
                      // });

                      //       Navigator.pushAndRemoveUntil(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) => Nav1(

                      //         )),
                      // (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: isLoading1 ? text6.withOpacity(0.4) : text6,
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadius.circular(_widthScale * 10.0),
                      ),
                    ),
                    child: isLoading1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: _heightScale * 20,
                                width: _widthScale * 20,
                                child: CircularProgressIndicator(
                                  color: white(context),
                                ),
                              ),
                              SizedBox(
                                width: _widthScale * 20,
                              ),
                              Text("Please Wait...")
                            ],
                          )
                        : Text(
                            'Log in',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: _widthScale * 18,
                                    fontWeight: FontWeight.bold)),
                          )),
              ),
              SizedBox(
                height: _heightScale * 25,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginSignInPhone()));
                  },
                  child: Text(
                    "Log In With OTP",
                    style: GoogleFonts.poppins(
                      decoration: TextDecoration.underline,
                      fontSize: _widthScale * 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: MediaQuery.of(context).size.height * 0.02,
              //     ),
              //     Container(
              //       height: 1,
              //       width: MediaQuery.of(context).size.width * 0.3,
              //       color: row,
              //     ),
              //     Text(
              //       "  Or Continue with ",
              //       style: GoogleFonts.poppins(
              //         textStyle: TextStyle(color: text5, fontSize: 12),
              //       ),
              //     ),
              //     Container(
              //       height: 1,
              //       width: MediaQuery.of(context).size.width * 0.3,
              //       color: row,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.048,
              // ),
              // Row(
              //   children: [
              //     Image.asset(
              //       "assets/googlephoto.jpg",
              //     ),
              //     SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              //     Image.asset(
              //       "assets/Rectangle 390.jpg",
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        ),
      ),
    );
    // });
  }
}

class Choose extends ChangeNotifier {
  String favs = 'a';
  //String get fav => _fav;
  void changeFavs(String newFavs) {
    favs = newFavs;
    notifyListeners();
  }
}
