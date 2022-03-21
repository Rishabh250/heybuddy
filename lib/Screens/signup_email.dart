import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/emailverify.dart';
import 'package:heybuddy/Screens/onboarding_Screen.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/email_verification.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/main.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:heybuddy/widgets/custom_drop_down_button.dart';
import 'package:provider/provider.dart';

class SignUpEmail extends StatefulWidget {
  var phone;
  SignUpEmail({required this.phone});
  // const SignUpEmail({Key? key}) : super(key: key);

  @override
  _SignUpEmailState createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  var na;
  @override
  void initState() {
    super.initState();
    loginPreference = LoginPreference();
    // login = Login();
  }
//  if (_username.text.isEmpty) {
//       const snackBar = SnackBar(
//         content: Text("Enter username"),
//         duration: Duration(milliseconds: 2000),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else if (_username.text.length < 3) {
//       const snackBar = SnackBar(
//         content: Text("Enter valid username (minimum 4 words required)"),
//         duration: Duration(milliseconds: 2000),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }else {
//       var response = await LogIn.signIn(
//           _username.text, _password.text,);
//       print('tute');
//       print('${response.toString()}');

//           Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Nav1()));
  checkStatus(var ap) {
    setState(() {
      na = ap;
    });
  }

  bool isLoading1 = false;
  var apihitting;
  // apihit() async {
  //   var check;
  //   check = await loginPreference?.getLoginStatus();
  //   apihitting = await SignUp.signUp(
  //       check == true ? 'aspirant' : 'professional',
  //       _email.text,
  //       _name.text,
  //       _value,
  //       _password.text,
  //       widget.phone);
  //   // x = apihitting;
  //   return apihitting;
  // }
  String newrefCode = "";
  _onsubmit(BuildContext context) async {
    // var check;
    // check = await loginPreference?.getLoginStatus();
    // print("fhghd$check");
    // checkStatus(check);
    // var response = await SignUp.signUp(
    //     check == true ? 'aspirant' : 'professional',
    //     _email.text,
    //     _name.text,
    //     _value,
    //     _password.text,
    //     widget.phone);

    if (_name.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter username"),
        backgroundColor: text6,
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    }
    //  else if (_value == "Select Your Gender") {
    //   const snackBar = SnackBar(
    //     backgroundColor: text6,
    //     content: Text("Please select your gender"),
    //     duration: Duration(milliseconds: 2000),
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   setState(() {
    //     isLoading1 = false;
    //   });
    // }
    else if (_name.text.length < 4) {
      const snackBar = SnackBar(
        backgroundColor: text6,
        content: Text("Enter valid username (minimum 4 words required)"),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (_email.text.isEmpty) {
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
    } else if (_value == "Select Your Gender") {
      const snackBar = SnackBar(
        backgroundColor: text6,
        content: Text("Please select your gender"),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (_password.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter password"),
        backgroundColor: text6,
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (_confirmPassword.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter Confirm password"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (_password.text.length < 6) {
      const snackBar = SnackBar(
        backgroundColor: text6,
        content: Text("Please Create a strong password minimum of 6 letters"),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (_confirmPassword.text.length < 6) {
      const snackBar = SnackBar(
        backgroundColor: text6,
        content: Text("Please enter confirm password minimum of 6 letters"),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else if (_password.text != _confirmPassword.text) {
      const snackBar = SnackBar(
        content: Text("Confirm Password should be same."),
        backgroundColor: text6,
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isLoading1 = false;
      });
    } else {
      var check;
      check = await loginPreference?.getLoginStatus();
      print("fhghd$check");
      checkStatus(check);
      var emailc;
      emailc = await EmailVerification.verification(_email.text, _name.text);
      print("token is ${emailc['token']}");
      print("status is${emailc['status']} ");
      if (emailc['status'] == false) {
        const snackBar = SnackBar(
          content: Text("Email Already exist ! Please Enter different Email"),
          duration: Duration(milliseconds: 2000),
          backgroundColor: text6,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isLoading1 = false;
        });
      } else if (emailc['status'] == true) {
        if (refCode.text.isNotEmpty) {
          newrefCode = refCode.text.toString();
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmailVerifiy(
                      who: check == true ? 'aspirant' : 'professional',
                      email: _email.text,
                      name: _name.text,
                      gender: _value,
                      password: _password.text,
                      phone: widget.phone,
                      tkn: emailc['token'],
                      refCode: newrefCode,
                    )));

        setState(() {
          isLoading1 = false;
        });
      }
    }
    //  else {
    //   var check;
    //   check = await loginPreference?.getLoginStatus();
    //   print("fhghd$check");
    //   checkStatus(check);
    //   var response = await SignUp.signUp(
    //       check == true ? 'aspirant' : 'professional',
    //       _email.text,
    //       _name.text,
    //       _value,
    //       _password.text,
    //       widget.phone);
    //   if (response == true) {
    //     apihit();
    //     await login?.setLogin(true);
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => Nav1(
    //                   selectedIndex: 0,
    //                 )),
    //         (route) => false);
    //     setState(() {
    //       isLoading1 = false;
    //     });
    //   } else if (response == false) {
    //     print("is value printed");
    //     await login?.setLogin(false);
    //     print("hhhh");
    //     const snackBar = SnackBar(
    //       content: Text("Credentials already used! "),
    //       backgroundColor: text6,
    //       duration: Duration(milliseconds: 2000),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     setState(() {
    //       isLoading1 = false;
    //     });
    //   }
    // }

    // else if (apihitting == true) {
    //   apihit();
    //   await login?.setLogin(true);
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => Nav1(
    //                 selectedIndex: 0,
    //               )),
    //       (route) => false);
    // } else if (apihitting == false) {
    //   print("is value printed");
    //   await login?.setLogin(false);
    //   print("hhhh");
    //   const snackBar = SnackBar(
    //     content: Text("Credentials already used! "),
    //     backgroundColor: text6,
    //     duration: Duration(milliseconds: 2000),
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   // Future.delayed(Duration(seconds: 1));
    //   // Navigator.pushAndRemoveUntil(
    //   //     context,
    //   //     MaterialPageRoute(
    //   //         builder: (context) => MyApp(
    //   //               isC: true,
    //   //             )),
    //   //     (route) => false);
    // }
  }

  List items = ["Male", "Female", "Other", "Select Your Gender"];
  String _value = "Select Your Gender";
  onChange(newVal) {
    setState(() {
      _value = newVal;
    });
  }

  var word;
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var word = Provider.of<Favourite>(context).fav;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 53,
              ),
              Row(
                children: [
                  Text(
                    word == "I am a Aspirant"
                        ? "Welcome  Aspirant"
                        : "Welcome  Professional",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 20,
                          color: whiteBox(context),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 8,
              ),
              Row(
                children: [
                  Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 18, color: whiteBox(context)),
                    ),
                  ),
                ],
              ),
              fields(
                "Full Name",
                "Enter your Full Name",
                _name,
              ),
              fields("xyz@gmail.com", "Enter your email id", _email),
              fields4("Enter Referral Code", "Referral Code", refCode),

              // fieldsy("Gender", "Select Your Gender", _gender),
              Column(
                children: [
                  SizedBox(
                    height: _heightScale * 40,
                  ),
                  Container(
                    height: _heightScale * 56,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: textFieldColor(context), //white.withOpacity(0.5),
                      borderRadius:
                          BorderRadius.all(Radius.circular(_widthScale * 6)),
                    ),
                    child: CustomDropDownButton(
                        widthScale: 1,
                        hintText: "Select Your Gender",
                        items: items,
                        onChange: onChange,
                        value: _value),
                  ),
                  SizedBox(
                    height: _heightScale * 4,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: _widthScale * 16.0),
                        child: Text(
                          "Select Your gender",
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
                ],
              ),
              fields2("Enter Password", "Enter your Password", Icon(Icons.lock),
                  _password),
              fields3("Confirm Password", "Confirm Password", Icon(Icons.lock),
                  _confirmPassword),
              SizedBox(
                height: _heightScale * 35,
              ),
              Container(
                height: _widthScale * 56,
                width: double.infinity, //340,
                child: ElevatedButton(
                    onPressed: () {
                      if (isLoading1) return;
                      setState(() {
                        isLoading1 = true;
                      });
                      _onsubmit(context);
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Nav1()),
                      //     (route) => false);
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
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: _widthScale * 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
              ),
              SizedBox(
                height: _heightScale * 35,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fieldsy(String title, String info, var cont) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        SizedBox(
          height: _heightScale * 40,
        ),
        TextField(
          controller: cont,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor(context),
            hintText: title,
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
                info,
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
      ],
    );
  }

  Widget fields(String title, String info, var cont) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        SizedBox(
          height: _heightScale * 40,
        ),
        TextField(
          controller: cont,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor(context),
            hintText: title,
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
                info,
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
      ],
    );
  }

  TextEditingController refCode = TextEditingController();

  Widget fields4(String title, String info, var cont) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        SizedBox(
          height: _heightScale * 40,
        ),
        TextField(
          controller: cont,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor(context),
            hintText: title,
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
                info,
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
      ],
    );
  }

  Widget fields2(String title, String info, Icon icon, var cont) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        SizedBox(
          height: _heightScale * 40,
        ),
        TextField(
          controller: cont,
          autofocus: false,
          obscureText: !_passwordVisible1,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            prefixIcon: icon,
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible1 ? Icons.visibility : Icons.visibility_off,

                color: text6,
                size: _widthScale * 20,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible1 = !_passwordVisible1;
                });
              },
            ),
            fillColor: textFieldColor(context),
            hintText: title,
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
                info,
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
        // SizedBox(
        //   height: _heightScale * 32,
        // ),
      ],
    );
  }

  Widget fields3(String title, String info, Icon icon, var cont) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        SizedBox(
          height: _heightScale * 40,
        ),
        TextField(
          controller: cont,
          autofocus: false,
          obscureText: !_passwordVisible2,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            prefixIcon: icon,
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible2 ? Icons.visibility : Icons.visibility_off,

                color: text6,
                size: _widthScale * 20,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible2 = !_passwordVisible2;
                });
              },
            ),
            fillColor: textFieldColor(context),
            hintText: title,
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
                info,
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
        // SizedBox(
        //   height: _heightScale * 32,
        // ),
      ],
    );
  }
}

class Fa extends ChangeNotifier {
  String _fav = '';
  String get fav => _fav;
  void changeFav(String newFav) {
    _fav = newFav;
    notifyListeners();
  }
}
