// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heybuddy/color&font/colors.dart';
// import 'package:intl/intl.dart';

// class BecomeProfessionalSkillsFormFill extends StatefulWidget {
//   const BecomeProfessionalSkillsFormFill({Key? key}) : super(key: key);

//   @override
//   _BecomeProfessionalSkillsFormFillState createState() =>
//       _BecomeProfessionalSkillsFormFillState();
// }

// class _BecomeProfessionalSkillsFormFillState
//     extends State<BecomeProfessionalSkillsFormFill> {
//   var pickedDate;
//   var newDate;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pickedDate = DateTime.now();
//   }

//   Future pickDate(BuildContext context) async {
//     final initialDate = DateTime.now();
//     newDate = await showDatePicker(
//       context: context,
//       initialDate: pickedDate ?? initialDate,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );

//     if (newDate == null) return;

//     setState(() => pickedDate = newDate);
//   }

//   String getText() {
//     if (pickedDate == null) {
//       return 'Select Date';
//     } else {
//       return DateFormat('dd/MM/yyyy').format(pickedDate);
//       // return '${date.month}/${date.day}/${date.year}';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

//     var size = MediaQuery.of(context).size;
//     Widget spacevert = SizedBox(
//       height: size.height * 0.04,
//     );
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: white.withOpacity(0.6),
//         elevation: 0,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: text9,
//           ),
//         ),
//         title: Text(
//           "Become a Professional",
//           style: GoogleFonts.poppins(
//               color: whitebox( context),
//               fontSize: _widthScale * 18,
//               fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: size.height * 0.8,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: _heightScale * 44,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Add Your Skills",
//                             style: GoogleFonts.poppins(
//                                 fontSize: _widthScale * 20,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: _heightScale * 15,
//                       ),
//                       // fields(
//                       //     "Add Languages Known*", "Enter languages you known"),
//                       // fields("Add Professional Experience*",
//                       //     "Enter your Experience"),
//                       // fields("Add your Education*", "Enter your Education"),
//                       fields("Add Skills*", "Enter your skills"),
//                       SizedBox(
//                         height: _heightScale * 30,
//                       ),
//                       // Row(
//                       //   children: [
//                       //     SizedBox(
//                       //       width: _widthScale * 10,
//                       //     ),
//                       //     Text(
//                       //       "Start Date*",
//                       //       style: GoogleFonts.poppins(
//                       //         textStyle: TextStyle(
//                       //             color: text2(context),
//                       //             fontSize: _widthScale * 13,
//                       //             fontWeight: FontWeight.w500),
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       // SizedBox(
//                       //   height: _heightScale * 13,
//                       // ),
//                       // Container(
//                       //   height: _heightScale * 56,
//                       //   width: double.maxFinite,
//                       //   decoration: BoxDecoration(
//                       //     color: white.withOpacity(0.5),
//                       //     borderRadius: BorderRadius.all(
//                       //         Radius.circular(_widthScale * 6)),
//                       //   ),
//                       //   child: ListTile(
//                       //     title: Text(
//                       //       getText(),
//                       //       style: GoogleFonts.poppins(
//                       //           color: text12.withOpacity(0.8),
//                       //           fontSize: _widthScale * 16),
//                       //     ),
//                       //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
//                       //     trailing: InkWell(
//                       //         onTap: () => pickDate(context),
//                       //         child: Image.asset(
//                       //           "assets/Group 804.png",
//                       //           height: _heightScale * 20,
//                       //           width: _widthScale * 20,
//                       //         )),
//                       //   ),
//                       // ),
//                       // SizedBox(
//                       //   height: _heightScale * 30,
//                       // ),
//                       // Row(
//                       //   children: [
//                       //     SizedBox(
//                       //       width: _widthScale * 10,
//                       //     ),
//                       //     Text(
//                       //       "End Date*",
//                       //       style: GoogleFonts.poppins(
//                       //         textStyle: TextStyle(
//                       //             color: text2(context),
//                       //             fontSize: _widthScale * 13,
//                       //             fontWeight: FontWeight.w500),
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       // SizedBox(
//                       //   height: _heightScale * 13,
//                       // ),
//                       // Container(
//                       //   height: _heightScale * 56,
//                       //   width: double.maxFinite,
//                       //   decoration: BoxDecoration(
//                       //     color: white.withOpacity(0.5),
//                       //     borderRadius: BorderRadius.all(
//                       //         Radius.circular(_widthScale * 6)),
//                       //   ),
//                       //   child: ListTile(
//                       //     title: Text(getText(),
//                       //         style: GoogleFonts.poppins(
//                       //             color: text12.withOpacity(0.8),
//                       //             fontSize: _widthScale * 16)),
//                       //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
//                       //     trailing: InkWell(
//                       //         onTap: () => pickDate(context),
//                       //         child: Image.asset("assets/Group 804.png")),
//                       //   ),
//                       // ),
//                       //   fields("Headline*", ""),
//                       //   fields("Industry*", ""),
//                       //   fields("Description*", ""),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: _heightScale * 10,
//               ),
//               Container(
//                 height: _widthScale * 56,
//                 width: _widthScale * 340,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(context,
//                       //     MaterialPageRoute(builder: (context) => SlotConfirm()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: text6,
//                       shape: new RoundedRectangleBorder(
//                         borderRadius:
//                             new BorderRadius.circular(_widthScale * 10.0),
//                       ),
//                     ),
//                     child: Text(
//                       'Save',
//                       style: GoogleFonts.poppins(
//                           textStyle: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: _widthScale * 18)),
//                     )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget fields(String title, String name) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

//     return Column(
//       children: [
//         SizedBox(
//           height: _heightScale * 30,
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: _widthScale * 10.0),
//               child: Text(
//                 title,
//                 style: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                       color: text2(context),
//                       fontSize: _widthScale * 13,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: _heightScale * 13,
//         ),
//         TextField(
//           maxLines: 5,
//           autofocus: false,
//           style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: white.withOpacity(0.5),
//             hintText: name,
//             hintStyle: GoogleFonts.poppins(
//                 textStyle: TextStyle(
//                     fontSize: _widthScale * 16,
//                     color: text12.withOpacity(0.8))),
//             contentPadding: EdgeInsets.only(
//                 left: _widthScale * 14.0,
//                 bottom: _heightScale * 8.0,
//                 top: _heightScale * 8.0),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: col1),
//               borderRadius: BorderRadius.circular(_widthScale * 6),
//             ),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: textFieldColor(context),
//               borderRadius: BorderRadius.circular(_widthScale * 6),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/widgets/user_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class BecomeProfessionalSkillsFormFill extends StatefulWidget {
  const BecomeProfessionalSkillsFormFill({Key? key}) : super(key: key);

  @override
  _BecomeProfessionalSkillsFormFillState createState() =>
      _BecomeProfessionalSkillsFormFillState();
}

class _BecomeProfessionalSkillsFormFillState
    extends State<BecomeProfessionalSkillsFormFill> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late UserModel userModel = new UserModel(
    "",
    // 18,
    new List<String>.empty(growable: true),
  );

  @override
  void initState() {
    super.initState();

    userModel.skills.add("");
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: white(context).withOpacity(0.6),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: text9,
            ),
          ),
          title: Text(
            "Skills",
            style: GoogleFonts.poppins(
                color: whiteBox(context),
                fontSize: _widthScale * 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 44,
              ),
              Row(
                children: [
                  SizedBox(
                    width: _widthScale * 24,
                  ),
                  Text(
                    "Add Your Skills",
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: _heightScale * 15,
              ),
              _uiWidget(),
            ],
          ),
        ));
  }

  Widget _uiWidget() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return new Form(
      key: globalFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: _widthScale * 24.0),
                    child: Text(
                      "General Conversation*",
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: white(context),
                    borderRadius: BorderRadius.circular(_widthScale * 6),
                  ),
                  height: _heightScale * 45,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: _widthScale * 16.0,
                      //  top: _heightScale * 16,
                      // bottom: _heightScale * 16
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "General Conversation",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: _widthScale * 16,
                                      color: black(context).withOpacity(0.8))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //  TextFormField(
                //   validator: (onValidateVal) {
                //     if (onValidateVal!.isEmpty) {
                //       return 'User Name can\'t be empty.';
                //     }

                //     return null;
                //   },
                //   onSaved: (onSavedVal) => {
                //     this.userModel.generalConversation = onSavedVal!,
                //   },
                //   // onEditingComplete: validateAndSave,
                //   autofocus: false,
                //   style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: white.withOpacity(0.5),
                //     hintText: "General Conversation",
                //     hintStyle: GoogleFonts.poppins(
                //         textStyle: TextStyle(
                //             fontSize: _widthScale * 16,
                //             color: text12.withOpacity(0.8))),
                //     contentPadding: EdgeInsets.only(
                //         left: _widthScale * 14.0,
                //         bottom: _heightScale * 8.0,
                //         top: _heightScale * 8.0),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: col1),
                //       borderRadius: BorderRadius.circular(_widthScale * 6),
                //     ),
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(color: textFieldColor(context),
                //       borderRadius: BorderRadius.circular(_widthScale * 6),
                //     ),
                //   ),
                // ),
              ),
              SizedBox(
                height: _heightScale * 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: _widthScale * 24.0),
                    child: Text(
                      "Skills*",
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
                height: _heightScale * 15,
              ),
              emailsContainerUI(),
              SizedBox(
                height: _heightScale * 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Container(
                  height: _widthScale * 56,
                  width: _widthScale * 340,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (validateAndSave()) {
                          print(this.userModel.toJson());
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SlotConfirm()));
                        } else {
                          print("data not save");
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
                ),
              ),
              // new Center(
              //   child: FormHelper.submitButton(
              //     "Save",
              //     () async {
              //       if (validateAndSave()) {
              //         print(this.userModel.toJson());
              //       }
              //     },
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextFormField(
              validator: (onValidateVal) {
                if (onValidateVal!.isEmpty) {
                  return 'Email ${index + 1} can\'t be empty.';
                }

                return null;
              },
              onSaved: (onSavedVal) => {
                this.userModel.skills[index] = onSavedVal!,
              },
              autofocus: false,
              style: TextStyle(
                  fontSize: _widthScale * 15.0, color: black(context)),
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
            //  FormHelper.inputFieldWidget(
            //   context,
            //   Icon(Icons.web),
            //   "email_$index",
            //   "",
            //   (onValidateVal) {
            //     if (onValidateVal.isEmpty) {
            //       return 'Email ${index + 1} can\'t be empty.';
            //     }

            //     return null;
            //   },
            //   (onSavedVal) => {
            //     this.userModel.emails[index] = onSavedVal,
            //   },
            //   initialValue: this.userModel.emails[index],
            //   obscureText: false,
            //   borderFocusColor: Theme.of(context).primaryColor,
            //   prefixIconColor: Theme.of(context).primaryColor,
            //   borderColor: Theme.of(context).primaryColor,
            //   borderRadius: 2,
            //   paddingLeft: 0,
            //   paddingRight: 0,
            //   showPrefixIcon: false,
            //   fontSize: 13,
            //   onChange: (val) {},
            // ),
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
      ),
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
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
