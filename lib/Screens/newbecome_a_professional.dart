import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/education_becomeaprofessional.dart';
import 'package:heybuddy/Screens/education_new_experience.dart';
import 'package:heybuddy/Screens/experience_becomeaprofessional.dart';
import 'package:heybuddy/Screens/languages_becomeprofessional.dart';
import 'package:heybuddy/Screens/new_languages.dart';
import 'package:heybuddy/Screens/new_skills_professional.dart';
import 'package:heybuddy/Screens/onboarding_Screen.dart';
import 'package:heybuddy/Screens/professional_history_new_experience.dart';
import 'package:heybuddy/Screens/skills_becomeaprofessional.dart';
import 'package:heybuddy/api/become_a_professionals.dart';
import 'package:heybuddy/api/becomeaprofessional.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/token_preference.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:heybuddy/widgets/custom_drop_down_button.dart';
import 'package:heybuddy/widgets/new_language_model.dart';
import 'package:heybuddy/widgets/new_skills_add.dart';
import 'package:intl/intl.dart';

class BecomeProfessionalFormFill extends StatefulWidget {
  const BecomeProfessionalFormFill({Key? key}) : super(key: key);

  @override
  _BecomeProfessionalFormFillState createState() =>
      _BecomeProfessionalFormFillState();
}

class _BecomeProfessionalFormFillState
    extends State<BecomeProfessionalFormFill> {
  TextEditingController _title = TextEditingController();
  TextEditingController _companyname = TextEditingController();

  TextEditingController _schoolname = TextEditingController();
  TextEditingController _qualification = TextEditingController();
  GlobalKey<FormState> globalFormKeylang = GlobalKey<FormState>();
  GlobalKey<FormState> globalFormKeyskill = GlobalKey<FormState>();
  late LanguageModel2 userModel = new LanguageModel2(
    new List<String>.empty(growable: true),
  );

  late Skills2 newskill = new Skills2(
    new List<String>.empty(growable: true),
  );

  @override
  void initState() {
    super.initState();

    userModel.skills.add("");
    newskill.skills.add("");
  }

  var tkn = datam.read('f');
  var becomepro;
  onSubmitttt(var check) async {
    // becomepro = await BecomeaProfessional.professional(tkn);
    if (_schoolname.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter Your Schaool Name "),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_qualification.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter Your Company title "),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_title.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter Your Company title "),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_companyname.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter Your Company title "),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (validateAndSaveskills() == false) {
      const snackBar = SnackBar(
        content: Text("Enter Skills"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (validateAndSave() == false) {
      const snackBar = SnackBar(
        content: Text("Enter Language"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if (isCheckbox == false) {
        becomepro = await BecomeaProfessionals.professional(
            "${this.newskill.skills.toString().toLowerCase().replaceAll("[", "").replaceAll("]", "")}",
            "${this.userModel.skills.toString().toLowerCase().replaceAll("[", "").replaceAll("]", "")}",
            _title.text,
            _companyname.text,
            "$_valuestart-01-$_startYear",
            "$_valueend-01-$_endYear",
            _schoolname.text,
            _qualification.text,
            tkn);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen()),
            (route) => false);
        login?.cleartTokenPreferenceData();
        loginPreference?.cleartTokenPreferenceData();
        tokenPreference.cleartTokenPreferenceData();
        innerCheck?.cleartTokenPreferenceData();
        uperCheck?.cleartTokenPreferenceData();
        innerCheck?.cleartTokenPreferenceDataa();
        datam.remove('f');
        datam.erase();
      } else if (isCheckbox == true) {
        becomepro = await BecomeaProfessionals.professional(
            "${this.newskill.skills.toString().toLowerCase().replaceAll("[", "").replaceAll("]", "")}",
            "${this.userModel.skills.toString().toLowerCase().replaceAll("[", "").replaceAll("]", "")}",
            _title.text,
            _companyname.text,
            "$_valuestart-01-$_startYear",
            " ",
            _schoolname.text,
            _qualification.text,
            tkn);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen()),
            (route) => false);
        login?.cleartTokenPreferenceData();
        loginPreference?.cleartTokenPreferenceData();
        tokenPreference.cleartTokenPreferenceData();
        innerCheck?.cleartTokenPreferenceData();
        uperCheck?.cleartTokenPreferenceData();
        innerCheck?.cleartTokenPreferenceDataa();
        datam.remove('f');
        datam.erase();
      }
    }
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
              "Do you want to become a professional",
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
                            onSubmitttt(isCheckbox);
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
  // professional history

  List itemsstart = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List itemsend = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String _valuestart = "January";
  onChangestart(newVal) {
    setState(() {
      _valuestart = newVal;
    });
  }

  String _valueend = "January";
  onChangeend(newVal) {
    setState(() {
      _valueend = newVal;
    });
  }

  String _startYear = "2022";
  onChangestartYear(newValstartYear) {
    setState(() {
      _startYear = newValstartYear;
    });
  }

  String _endYear = "2022";
  onChangeendYear(newValendYear) {
    setState(() {
      _endYear = newValendYear;
    });
  }

  bool isCheckbox = false;
  //
  bool expandprofessionalhistory = false;
  bool expandeducationhistory = false;
  bool expandskills = true;
  bool expandlanguages = true;

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
            color: Styles.isDark ? whites : text9,
          ),
        ),
        title: Text(
          "Become a Professional",
          style: GoogleFonts.poppins(
              color: whitebox(context),
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
                height: size.height * 0.76,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: _heightScale * 44,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            expandeducationhistory = !expandeducationhistory;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Add Your Education Details",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 18,
                                    color: text6,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    expandeducationhistory =
                                        !expandeducationhistory;
                                  });
                                },
                                child: Icon(
                                  expandeducationhistory
                                      ? Icons.arrow_drop_down_sharp
                                      : Icons.arrow_drop_up,
                                  color: text6,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _heightScale * 15,
                      ),
                      expandeducationhistory == false
                          ? Container()
                          : Column(
                              children: [
                                fieldsschoolname("School / University Name*",
                                    "Enter your School / University name"),
                                fieldsqualification("Your Qualifications*",
                                    "Enter your Qualification"),
                                //fields("Year*", "Enter your Year"),
                                //fields("Location*", "Enter company location"),
                              ],
                            ),
                      SizedBox(
                        height: _heightScale * 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            expandprofessionalhistory =
                                !expandprofessionalhistory;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Add Your Professional History",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 18,
                                    color: text6,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    expandprofessionalhistory =
                                        !expandprofessionalhistory;
                                  });
                                },
                                child: Icon(
                                  expandprofessionalhistory
                                      ? Icons.arrow_drop_down_sharp
                                      : Icons.arrow_drop_up,
                                  color: text6,
                                ))
                          ],
                        ),
                      ),
                      expandprofessionalhistory == false
                          ? Container()
                          : Column(
                              children: [
                                SizedBox(
                                  height: _heightScale * 15,
                                ),
                                fieldstitle("Title*", "Enter your title"),
                                fieldscompanyname(
                                    "Company Name*", "Enter your Company Name"),
                                SizedBox(
                                  height: _heightScale * 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: _widthScale * 10,
                                    ),
                                    Text(
                                      "Start Year*",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: text2(context),
                                            fontSize: _widthScale * 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _heightScale * 13,
                                ),
                                Container(
                                  height: _heightScale * 56,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: white(context).withOpacity(0.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(_widthScale * 6)),
                                  ),
                                  child: CustomDropDownButton(
                                      widthScale: 1,
                                      hintText: "",
                                      items: itemsYearstart,
                                      onChange: onChangestartYear,
                                      value: _startYear),
                                ),
                                SizedBox(
                                  height: _heightScale * 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: _widthScale * 10,
                                    ),
                                    Text(
                                      "Start Month*",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: text2(context),
                                            fontSize: _widthScale * 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: _heightScale * 13,
                                ),
                                Container(
                                  height: _heightScale * 56,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: white(context).withOpacity(0.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(_widthScale * 6)),
                                  ),
                                  child: CustomDropDownButton(
                                      widthScale: 1,
                                      hintText: "",
                                      items: itemsstart,
                                      onChange: onChangestart,
                                      value: _valuestart),
                                ),
                                SizedBox(
                                  height: _heightScale * 20,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: isCheckbox,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isCheckbox = value!;
                                          });
                                        }),
                                    Text("I am Currently Working"),
                                  ],
                                ),
                                SizedBox(
                                  height: _heightScale * 20,
                                ),
                                isCheckbox == false
                                    ? Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: _widthScale * 10,
                                              ),
                                              Text(
                                                "End Year*",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: text2(context),
                                                      fontSize:
                                                          _widthScale * 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: _heightScale * 13,
                                          ),
                                          Container(
                                            height: _heightScale * 56,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              color: white(context)
                                                  .withOpacity(0.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      _widthScale * 6)),
                                            ),
                                            child: CustomDropDownButton(
                                                widthScale: 1,
                                                hintText: "",
                                                items: itemsYearend,
                                                onChange: onChangeendYear,
                                                value: _endYear),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 30,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: _widthScale * 10,
                                              ),
                                              Text(
                                                "End Month*",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: text2(context),
                                                      fontSize:
                                                          _widthScale * 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: _heightScale * 13,
                                          ),
                                          Container(
                                            height: _heightScale * 56,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              color: white(context)
                                                  .withOpacity(0.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      _widthScale * 6)),
                                            ),
                                            child: CustomDropDownButton(
                                                widthScale: 1,
                                                hintText: "",
                                                items: itemsend,
                                                onChange: onChangeend,
                                                value: _valueend),
                                          ),
                                          SizedBox(
                                            height: _heightScale * 30,
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                      SizedBox(
                        height: _heightScale * 32,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              // onTap: () {
                              //   setState(() {
                              //     expandlanguages = !expandlanguages;
                              //   });
                              // },
                              child: Text(
                                "Add Your Languages",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 18,
                                    color: text6,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          // InkWell(
                          //     onTap: () {
                          //       setState(() {
                          //         expandlanguages = !expandlanguages;
                          //       });
                          //     },
                          //     child: Icon(
                          //       expandlanguages
                          //           ? Icons.arrow_drop_down_sharp
                          //           : Icons.arrow_drop_up,
                          //       color: text6,
                          //     ))
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 15,
                      ),
                      expandlanguages == false
                          ? Container()
                          : Column(
                              children: [
                                _uiWidget(),
                              ],
                            ),
                      // SizedBox(
                      //   height: _heightScale * 25,
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              // onTap: () {
                              //   setState(() {
                              //     expandskills = !expandskills;
                              //   });
                              // },
                              child: Text(
                                "Add Your Skills",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 18,
                                    color: text6,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          // InkWell(
                          // onTap: () {
                          //   setState(() {
                          //     expandskills = !expandskills;
                          //   });
                          // },
                          //     child: Icon(
                          //   expandskills
                          //       ? Icons.arrow_drop_down_sharp
                          //       : Icons.arrow_drop_up,
                          //   color: text6,
                          // ))
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 15,
                      ),
                      expandskills == false
                          ? Container()
                          : Column(
                              children: [
                                _uiWidgetskills(),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 10,
              ),
              Container(
                height: _widthScale * 56,
                width: _widthScale * 340,
                child: ElevatedButton(
                    onPressed: () async {
                      // if (validateAndSaveskills()) {
                      //   print("ggg${this.newskill.toJson()}");
                      //   // print("ggg${this.userModel.generalConversation}");
                      //   print(
                      //       "abcdis${this.newskill.skills.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "")}");
                      //   print(
                      //       "ggg${this.newskill.skills.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "")}");
                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) => SlotConfirm()));
                      // } else {
                      //   print("data not save");
                      // }
                      // onSubmit();
                      onSubmitttt(isCheckbox);
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

  Widget _uiWidget() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return new Form(
      key: globalFormKeylang,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    "Languages*",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: text2(context),
                          fontSize: _widthScale * 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 15,
              ),
              emailsContainerUI(),
              SizedBox(
                height: _heightScale * 25,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              //   child: Container(
              //     height: _widthScale * 56,
              //     width: _widthScale * 340,
              //     child: ElevatedButton(
              //         onPressed: () async {
              //           if (validateAndSave()) {
              //           } else {
              //             print("data not save");
              //           }
              //           // onSubmit();
              //         },
              //         style: ElevatedButton.styleFrom(
              //           primary: text6,
              //           shape: new RoundedRectangleBorder(
              //             borderRadius:
              //                 new BorderRadius.circular(_widthScale * 10.0),
              //           ),
              //         ),
              //         child: Text(
              //           'Save',
              //           style: GoogleFonts.poppins(
              //               textStyle: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: _widthScale * 18)),
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailsContainerUI() {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this.userModel.skills.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Row(children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: emailUI(index),
              ),
            ]),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  Widget emailUI(index) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            validator: (onValidateVal) {
              if (onValidateVal!.isEmpty) {
                return 'Languages ${index + 1} can\'t be empty.';
              }

              return null;
            },
            onSaved: (onSavedVal) => {
              this.userModel.skills[index] = onSavedVal!,
            },
            autofocus: false,
            style:
                TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
            decoration: InputDecoration(
              filled: true,
              fillColor: white(context).withOpacity(0.5),
              hintText: "Enter Your Languages",
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
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.green,
              ),
              onPressed: () {
                addEmailControl();
              },
            ),
          ),
          visible: index == this.userModel.skills.length - 1,
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.redAccent,
              ),
              onPressed: () {
                removeEmailControl(index);
              },
            ),
          ),
          visible: index > 0,
        )
      ],
    );
  }

  void addEmailControl() {
    setState(() {
      this.userModel.skills.add("");
    });
  }

  void removeEmailControl(index) {
    setState(() {
      if (this.userModel.skills.length > 1) {
        this.userModel.skills.removeAt(index);
      }
    });
  }

  bool validateAndSave() {
    final form = globalFormKeylang.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget fieldstitle(String title, String name) {
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
          controller: _title,
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

  Widget fieldscompanyname(String title, String name) {
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
          controller: _companyname,
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

  Widget fieldsschoolname(String title, String name) {
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
          controller: _schoolname,
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

  Widget fieldsqualification(String title, String name) {
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

  List itemsYearstart = [
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
    '1999',
    '1998',
    '1997',
    '1996',
    '1995',
    '1994',
    '1993',
    '1992',
    '1991',
    '1990',
    '1989',
    '1988',
    '1987',
    '1986',
    '1985',
    '1984',
    '1983',
    '1982',
    '1981',
    '1980',
    '1979',
    '1978',
    '1977',
    '1976',
    '1975',
    '1974',
    '1973',
    '1972',
    '1971',
    '1970',
    '1969',
    '1968',
    '1967',
    '1966',
    '1965',
    '1964',
    '1963',
    '1962',
    '1961',
    '1960',
    '1959',
    '1958',
    '1957',
    '1956',
    '1955',
    '1954',
    '1953',
    '1952',
    '1951',
    '1950',
  ];

  List itemsYearend = [
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
    '1999',
    '1998',
    '1997',
    '1996',
    '1995',
    '1994',
    '1993',
    '1992',
    '1991',
    '1990',
    '1989',
    '1988',
    '1987',
    '1986',
    '1985',
    '1984',
    '1983',
    '1982',
    '1981',
    '1980',
    '1979',
    '1978',
    '1977',
    '1976',
    '1975',
    '1974',
    '1973',
    '1972',
    '1971',
    '1970',
    '1969',
    '1968',
    '1967',
    '1966',
    '1965',
    '1964',
    '1963',
    '1962',
    '1961',
    '1960',
    '1959',
    '1958',
    '1957',
    '1956',
    '1955',
    '1954',
    '1953',
    '1952',
    '1951',
    '1950',
  ];

  Widget _uiWidgetskills() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return new Form(
      key: globalFormKeyskill,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    "Skills*",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: text2(context),
                          fontSize: _widthScale * 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 15,
              ),
              emailsContainerUIskills(),
              SizedBox(
                height: _heightScale * 25,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              //   child: Container(
              //     height: _widthScale * 56,
              //     width: _widthScale * 340,
              //     child: ElevatedButton(
              //         onPressed: () async {
              //           if (validateAndSave()) {
              //           } else {
              //             print("data not save");
              //           }
              //           // onSubmit();
              //         },
              //         style: ElevatedButton.styleFrom(
              //           primary: text6,
              //           shape: new RoundedRectangleBorder(
              //             borderRadius:
              //                 new BorderRadius.circular(_widthScale * 10.0),
              //           ),
              //         ),
              //         child: Text(
              //           'Save',
              //           style: GoogleFonts.poppins(
              //               textStyle: TextStyle(
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: _widthScale * 18)),
              //         )),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailsContainerUIskills() {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this.newskill.skills.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Row(children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: emailUIskills(index),
              ),
            ]),
          ],
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  Widget emailUIskills(index) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextFormField(
            validator: (onValidateVal) {
              if (onValidateVal!.isEmpty) {
                return 'Skills ${index + 1} can\'t be empty.';
              }

              return null;
            },
            onSaved: (onSavedVal) => {
              this.newskill.skills[index] = onSavedVal!,
            },
            autofocus: false,
            style:
                TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
            decoration: InputDecoration(
              filled: true,
              fillColor: white(context).withOpacity(0.5),
              hintText: "Enter Your Skills",
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
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.green,
              ),
              onPressed: () {
                addEmailControlskills();
              },
            ),
          ),
          visible: index == this.newskill.skills.length - 1,
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.redAccent,
              ),
              onPressed: () {
                removeEmailControlskills(index);
              },
            ),
          ),
          visible: index > 0,
        )
      ],
    );
  }

  void addEmailControlskills() {
    setState(() {
      this.newskill.skills.add("");
    });
  }

  void removeEmailControlskills(index) {
    setState(() {
      if (this.newskill.skills.length > 1) {
        this.newskill.skills.removeAt(index);
      }
    });
  }

  bool validateAndSaveskills() {
    final form = globalFormKeyskill.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
