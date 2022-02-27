import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/profile.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/update_profile_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/custom_bar.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  var name;
  var image;
  EditProfile({required this.name, required this.image});
  // const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _name = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
    _name.text = widget.name;
  }

  var val = datam.read('f');

  // var tkn = datam.read('f');
  var responsephoto;
  getData() async {
    responsephoto = await getdata(val);
  }

  var imageFile;
  final picker = ImagePicker();
  // var fff = GetStorage();
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

  // var bd =
  //     '/data/user/0/com.example.heybuddy/cache/image_picker2981885554299762108.jpg';

  onSubmit() async {
    //  var bd = fff.read('l');
    // print("valof bdis$bd");
    var res = await UpdateProfilephoto.updateProfile(
        // _name.text.isEmpty ? widget.name : _name.text,
        val,
        imageFile);
    print("images is $res");
    print("bbbbbb$val");
    Navigator.pop(context);
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Nav1(
    //               selectedIndex: 3,
    //             )));
  }

  onSubmitname() async {
    //  var bd = fff.read('l');
    // print("valof bdis$bd");
    var ress = await UpdateProfilename.updateProfile(
      _name.text.isEmpty ? widget.name : _name.text,
      val,
      // imageFile == null ?File(null)  : imageFile
    );

    print("bbbbbb$val");
    Navigator.pop(context);
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Nav1(
    //               selectedIndex: 3,
    //             )));
  }

  onSubmitboth() async {
    var resss = await UpdateProfile.updateProfile(
        // _name.text.isEmpty ? widget.name :
        _name.text,
        val,
        imageFile);

    print("bbbbbb$val");
    Navigator.pop(context);
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Nav1(
    //               selectedIndex: 3,
    //             )));
  }

  responseCheck() {
    if (_name.text.isEmpty) {
      return onSubmit();
    } else if (imageFile == null) {
      return onSubmitname();
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
    // Widget spacevert = SizedBox(
    //   height: size.height * 0.04,
    // );
    Widget spacehort = SizedBox(
      width: size.width * 0.08,
    );
    Widget spacehort1 = SizedBox(
      width: size.width * 0.5,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );
    Widget spacevert2 = SizedBox(
      height: size.height * 0.4,
    );
    return Scaffold(
      // backgroundColor: backgroundColor1,
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
          "Edit Profile",
          style: GoogleFonts.poppins(
              color: whitebox(context),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: _widthScale * 10.0),
              child: TextButton(
                onPressed: () {
                  //onSubmit();
                  responseCheck();
                },
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(
                      color: text5, fontSize: _widthScale * 16),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapShot) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: responsephoto == null
                    ? Container(
                        height: _heightScale * 600,
                        width: double.infinity,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        children: [
                          SizedBox(height: _heightScale * 32),
                          Row(
                            children: [
                              Text(
                                "Hello " + "${widget.name}",
                                style: GoogleFonts.poppins(
                                    fontSize: _widthScale * 20,
                                    fontWeight: FontWeight.w500,
                                    color: whitebox(context)),
                              ),
                            ],
                          ),
                          SizedBox(height: _heightScale * 31),
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  imageFile == null
                                      ? //buildImages()
                                      responsephoto['profilePic'] == ""
                                          ? (responsephoto['gender'] ==
                                                      "Male" ||
                                                  responsephoto['gender'] ==
                                                      "Other")
                                              ? Image.asset(
                                                  'assets/Men Professional.png',
                                                  height: _heightScale * 90,
                                                  width: _widthScale * 90,
                                                )
                                              : Image.asset(
                                                  'assets/Female Professional.png',
                                                  height: _heightScale * 90,
                                                  width: _widthScale * 90,
                                                )
                                          : Container(
                                              height: _heightScale * 90,
                                              width: _widthScale * 90,
                                              decoration: BoxDecoration(
                                                // border: Border.all()
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        responsephoto[
                                                            'profilePic']),
                                                    fit: BoxFit.fill),
                                              ),
                                            )
                                      // Container(
                                      //     height: _heightScale * 90,
                                      //     width: _widthScale * 90,
                                      //     decoration: BoxDecoration(
                                      //       // border: Border.all()
                                      //       shape: BoxShape.circle,
                                      //       image:
                                      //           DecorationImage(
                                      //               image: NetworkImage(widget.image),
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
                              spacehort1,
                            ],
                          ),
                          SizedBox(height: _heightScale * 28),
                          fields("Full Name", "Enter Your full name"),
                          // fields("Male", "Select Your Gender"),
                          // fields("xyz@gmail.com", "Your E-Mail"),
                          // fields("98******32", "Your Phone number"),
                        ],
                      ),
              );
            }),
      ),
    );
  }

  Widget fields(String title, String info) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        // SizedBox(
        //   height: _heightScale * 30,
        // ),
        TextFormField(
          controller: _name,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor(context),
            hintText: title,
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
        SizedBox(
          height: _heightScale * 13,
        ),
        Row(
          children: [
            SizedBox(
              width: _widthScale * 15,
            ),
            Text(
              info,
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
          height: _heightScale * 25,
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
