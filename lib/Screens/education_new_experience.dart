import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/update_profile_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/custom_drop_down_button.dart';
import 'package:intl/intl.dart';

class EducationFormFill extends StatefulWidget {
  const EducationFormFill({Key? key}) : super(key: key);

  @override
  _EducationFormFillState createState() => _EducationFormFillState();
}

class _EducationFormFillState extends State<EducationFormFill> {
  TextEditingController _name = TextEditingController();
  TextEditingController _qualification = TextEditingController();
  var pickedDate;
  var newDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var val = datam.read('f');
  var output;
  onSubmit() async {
    //  var bd = fff.read('l');
    // print("valof bdis$bd");
    output = await UpdateProfileuniversity.updateProfile(
        _name.text, _qualification.text, val);

    print("bbbbbb$val");
    Navigator.pop(context);
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => ProfessionalUserProfile()));
  }

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
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbar(context), // white(context).withOpacity(0.6),
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
          "Add Education",
          style: GoogleFonts.poppins(
              color: black(context),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.78,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: _heightScale * 44,
                      ),
                      Row(
                        children: [
                          Text(
                            "Add Your Education Details",
                            style: GoogleFonts.poppins(
                                fontSize: _widthScale * 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 15,
                      ),
                      fields("School / University Name*",
                          "Enter your School / University name"),
                      fieldss(
                          "Your Qualifications*", "Enter your Qualification"),
                      //fields("Year*", "Enter your Year"),
                      //fields("Location*", "Enter company location"),
                      SizedBox(
                        height: _heightScale * 25,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 0,
              ),
              Container(
                height: _widthScale * 56,
                width: _widthScale * 340,
                child: ElevatedButton(
                    onPressed: () {
                      if (_name.text.isEmpty) {
                        const snackBar = SnackBar(
                          content: Text("Enter School/University Name"),
                          backgroundColor: text6,
                          duration: Duration(milliseconds: 2000),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (_qualification.text.isEmpty) {
                        const snackBar = SnackBar(
                          content: Text("Enter Your Qualification Details"),
                          backgroundColor: text6,
                          duration: Duration(milliseconds: 2000),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        onSubmit();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: text6,
                      shape: new RoundedRectangleBorder(
                        borderRadius:
                            new BorderRadius.circular(_widthScale * 10.0),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _widthScale * 18)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget fields(String title, String name) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        SizedBox(
          height: _heightScale * 30,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _widthScale * 10.0),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: text2(context),
                      fontSize: _widthScale * 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 13,
        ),
        TextField(
          controller: _name,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: white(context).withOpacity(0.5),
            hintText: name,
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

  Widget fieldss(String title, String name) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        SizedBox(
          height: _heightScale * 30,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _widthScale * 10.0),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: text2(context),
                      fontSize: _widthScale * 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 13,
        ),
        TextField(
          controller: _qualification,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: white(context).withOpacity(0.5),
            hintText: name,
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
}
