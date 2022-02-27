import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/professional_profile.dart';
import 'package:heybuddy/Screens/professionaluserprofile.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/update_profile_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditBioFormFill extends StatefulWidget {
  var bio;
  var image;
  EditBioFormFill({required this.bio, required this.image});
  // const EditBioFormFill({Key? key}) : super(key: key);

  @override
  _EditBioFormFillState createState() => _EditBioFormFillState();
}

class _EditBioFormFillState extends State<EditBioFormFill> {
  TextEditingController _name = TextEditingController();
  var pickedDate;
  var newDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name.text = widget.bio;
    pickedDate = DateTime.now();
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    newDate = await showDatePicker(
      context: context,
      initialDate: pickedDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => pickedDate = newDate);
  }

  String getText() {
    if (pickedDate == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd/MM/yyyy').format(pickedDate);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  var val = datam.read('f');
  //  var tkn = datam.read('f');
  var response;
  List vv = [];
  // List pp = [];
  getData() async {
    response = await getdata(val);
    // pp = response;
    return response;
    // setState(() {
    //   vv = [...vv, ...response];
    //   // response;
    // });
  }

  var imageFile;
  final picker = ImagePicker();
  chooseImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    var ghj;
    setState(() {
      imageFile = File(pickedFile!.path);

      print("pathis$imageFile");
    });
    ghj = imageFile;
    //  fff.write("l", ghj);
  }

  onSubmit() {
    //  var bd = fff.read('l');
    // print("valof bdis$bd");
    var res = UpdateProfileimg.updateProfile(
        // _name.text.isEmpty ? widget.name : _name.text,
        val,
        imageFile);
    print("images is $res");
    print("bbbbbb$val");
    Navigator.pop(context);
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => ProfessionalUserProfile()));
    // Navigator.pop(context);
  }

  // onSubmit() {
  //   //  var bd = fff.read('l');
  //   // print("valof bdis$bd");
  //   var res = UpdateProfilephoto.updateProfile(
  //       // _name.text.isEmpty ? widget.name : _name.text,
  //       val,
  //       imageFile);

  //   print("bbbbbb$val");
  //   // Navigator.pop(context);
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => ProfessionalUserProfile()));
  // }

  onSubmitbio() {
    //  var bd = fff.read('l');
    // print("valof bdis$bd");
    var ress = UpdateProfilebio.updateProfile(
      _name.text.isEmpty ? widget.bio : _name.text,
      val,
      // imageFile == null ?File(null)  : imageFile
    );

    print("bbbbbb$val");
    Navigator.pop(context);
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => ProfessionalUserProfile()));
  }

  onSubmitboth() {
    var resss = UpdateProfileimgandbio.updateProfile(
        // _name.text.isEmpty ? widget.name :
        _name.text,
        val,
        imageFile);

    print("bbbbbb$val");
    Navigator.pop(context);
    // Navigator.pushReplacement(context,
    // MaterialPageRoute(builder: (context) => ProfessionalUserProfile()));
  }

  responseCheck() {
    if (_name.text.isEmpty) {
      return onSubmit();
    } else if (imageFile == null) {
      return onSubmitbio();
    } else {
      return onSubmitboth();
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_widthScale * 12),
            ),
            title: Text(
              "Choose Your Image",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 22, color: black(context)),
              ),
            ),
            actions: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: _widthScale * 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                chooseImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: text6,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  side: BorderSide(color: text6),
                                ),
                              ),
                              child: Text(
                                "Camera",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: white(context)),
                                ),
                              ))),
                      SizedBox(
                        width: _widthScale * 20,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                chooseImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: text6,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  side: BorderSide(color: text6),
                                ),
                              ),
                              child: Text(
                                "Gallery",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 18, color: white(context)),
                                ),
                              ))),
                      SizedBox(
                        width: _widthScale * 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _heightScale * 15,
                  ),
                ],
              ),
            ],
          );
        });
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
        backgroundColor: white(context).withOpacity(0.6),
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
          "Edit",
          style: GoogleFonts.poppins(
              color: black(context),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapShot) {
                return response == null
                    ? Container(
                        height: _heightScale * 650,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                    : Column(
                        children: [
                          Container(
                            height: size.height * 0.8,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: _heightScale * 44,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Edit Your Bio",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _heightScale * 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          imageFile == null
                                              ? //buildImages()
                                              response['anonymous'] == "false"
                                                  ? response['profilePic'] != ""
                                                      ? Container(
                                                          height:
                                                              _heightScale * 90,
                                                          width:
                                                              _widthScale * 90,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: white(
                                                                          context)
                                                                      .withOpacity(
                                                                          0.39),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(
                                                                        response[
                                                                            'profilePic'],
                                                                      ),
                                                                      fit: BoxFit.cover)),
                                                        )
                                                      : (response['gender'] ==
                                                                  "Male" ||
                                                              response[
                                                                      'gender'] ==
                                                                  "Other")
                                                          ? Image.asset(
                                                              'assets/Men Professional.png',
                                                              height:
                                                                  _heightScale *
                                                                      90,
                                                              width:
                                                                  _widthScale *
                                                                      90,
                                                            )
                                                          : Image.asset(
                                                              'assets/Female Professional.png',
                                                              height:
                                                                  _heightScale *
                                                                      90,
                                                              width:
                                                                  _widthScale *
                                                                      90,
                                                            )
                                                  : (response['gender'] ==
                                                              "Male" ||
                                                          response['gender'] ==
                                                              "Other")
                                                      ? Image.asset(
                                                          'assets/Men Professional.png',
                                                          height:
                                                              _heightScale * 90,
                                                          width:
                                                              _widthScale * 90,
                                                        )
                                                      : Image.asset(
                                                          'assets/Female Professional.png',
                                                          height:
                                                              _heightScale * 90,
                                                          width:
                                                              _widthScale * 90,
                                                        )
                                              // Container(
                                              //     height: _heightScale * 95,
                                              //     width: _widthScale * 95,
                                              //     decoration: BoxDecoration(
                                              //       // border: Border.all()
                                              //       shape: BoxShape.circle,
                                              //       image:

                                              //           DecorationImage(
                                              //               image:
                                              //                   NetworkImage(widget.image),
                                              //               fit: BoxFit.fill),
                                              //     ),
                                              //   )
                                              //: buildImages2(),
                                              : buildImages(),
                                          // CircleAvatar(
                                          //     radius: _widthScale * 40,
                                          //     backgroundImage: AssetImage(
                                          //       "assets/vall.png",
                                          //     ),
                                          //   ),
                                          GestureDetector(
                                            onTap: () {
                                              showAlertDialog(context);
                                              // onSubmit();
                                            },
                                            child: Image.asset(
                                              "assets/addphoto.png",
                                              height: _heightScale * 25,
                                              width: _widthScale * 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _heightScale * 15,
                                  ),

                                  fields("Bio*", "Enter your new bio"),
                                  SizedBox(
                                    height: _heightScale * 15,
                                  ),

                                  // fields("Languages*", "Add Language"),
                                  //fields("Add Professional Experience*",
                                  //   "Enter your Experience"),
                                  // fields("Add your Education*", "Enter your Education"),
                                  // fields("Add Skills*", "Enter your skills"),
                                  SizedBox(
                                    height: _heightScale * 30,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       width: _widthScale * 10,
                                  //     ),
                                  //     Text(
                                  //       "Start Date*",
                                  //       style: GoogleFonts.poppins(
                                  //         textStyle: TextStyle(
                                  //             color: text2(context),
                                  //             fontSize: _widthScale * 13,
                                  //             fontWeight: FontWeight.w500),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: _heightScale * 13,
                                  // ),
                                  // Container(
                                  //   height: _heightScale * 56,
                                  //   width: double.maxFinite,
                                  //   decoration: BoxDecoration(
                                  //     color: white.withOpacity(0.5),
                                  //     borderRadius: BorderRadius.all(
                                  //         Radius.circular(_widthScale * 6)),
                                  //   ),
                                  //   child: ListTile(
                                  //     title: Text(
                                  //       getText(),
                                  //       style: GoogleFonts.poppins(
                                  //           color: text12.withOpacity(0.8),
                                  //           fontSize: _widthScale * 16),
                                  //     ),
                                  //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                                  //     trailing: InkWell(
                                  //         onTap: () => pickDate(context),
                                  //         child: Image.asset(
                                  //           "assets/Group 804.png",
                                  //           height: _heightScale * 20,
                                  //           width: _widthScale * 20,
                                  //         )),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: _heightScale * 30,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       width: _widthScale * 10,
                                  //     ),
                                  //     Text(
                                  //       "End Date*",
                                  //       style: GoogleFonts.poppins(
                                  //         textStyle: TextStyle(
                                  //             color: text2(context),
                                  //             fontSize: _widthScale * 13,
                                  //             fontWeight: FontWeight.w500),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: _heightScale * 13,
                                  // ),
                                  // Container(
                                  //   height: _heightScale * 56,
                                  //   width: double.maxFinite,
                                  //   decoration: BoxDecoration(
                                  //     color: white.withOpacity(0.5),
                                  //     borderRadius: BorderRadius.all(
                                  //         Radius.circular(_widthScale * 6)),
                                  //   ),
                                  //   child: ListTile(
                                  //     title: Text(getText(),
                                  //         style: GoogleFonts.poppins(
                                  //             color: text12.withOpacity(0.8),
                                  //             fontSize: _widthScale * 16)),
                                  //     // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                                  //     trailing: InkWell(
                                  //         onTap: () => pickDate(context),
                                  //         child: Image.asset("assets/Group 804.png")),
                                  //   ),
                                  // ),
                                  //   fields("Headline*", ""),
                                  //   fields("Industry*", ""),
                                  //   fields("Description*", ""),
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
                                onPressed: () {
                                  // onSubmit();
                                  responseCheck();
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => SlotConfirm()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: text6,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        _widthScale * 10.0),
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
                      );
              }),
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
          minLines: 1,
          maxLines: 10,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor(context),
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

  Widget buildImages() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Container(
      height: _heightScale * 90,
      width: _widthScale * 90,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: FileImage(imageFile), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(_widthScale * 60))),
    );
  }
}
