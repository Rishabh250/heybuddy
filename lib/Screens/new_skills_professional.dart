import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/company.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/update_profile_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/user_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../api/suggestions_api/skills.dart';

class NewSkills extends StatefulWidget {
  const NewSkills({Key? key}) : super(key: key);

  @override
  _NewSkillsState createState() => _NewSkillsState();
}

class _NewSkillsState extends State<NewSkills> {
  List collage = ["Search your skills"];
  var pickedDate;
  var newDate;
  bool checkSchool = false;
  bool isVisible = false;
  bool isVisiblebtn = true;
  TextEditingController _cont = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  GetSkillApi getSkillsApi = GetSkillApi();

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

  var val = datam.read('f');
  var response;
  List vv = [];
  // List pp = [];
  onTap() async {
    response = await getdata(val);
    // pp = response;
    return response;
    // setState(() {
    //   vv = [...vv, ...response];
    //   // response;
    // });
  }

  var x;
  getgf() async {
    // x = List.generate(
    //     response["skills"] != null ? response["skills"].length : 0,
    // (index) => response["skills"].length.toString());
    x = response["skills"].length;
    print("val of x is$x");
    return x;
  }

  var z;
  getgh() async {
    // x = List.generate(
    //     response["skills"] != null ? response["skills"].length : 0,
    // (index) => response["skills"].length.toString());
    z = response["skills"];
    print("val of z is$z");
    return z;
  }

  onSubmit() async {
    //  var bd = fff.read('l');
    // print("valof bdis$bd");
    var res = await UpdateProfileskills.updateProfile(
      // "General Conversation,${this.userModel.skills.toString().replaceAll("[", "").replaceAll("]", "")}",
      "${this.userModel.skills.toString().toLowerCase().replaceAll("[", "").replaceAll("]", "")}",
      val,
    );

    // print("bbbbbb$val");
    // Navigator.pop(context);
    // Navigator.pushReplacement(
    //   context, MaterialPageRoute(builder: (context) => ProfileScreen()));
    EasyLoading.dismiss();

    Navigator.pop(context);
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
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
          "Skills",
          style: GoogleFonts.poppins(
              color: black(context),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(child: Builder(builder: (context) {
        return FutureBuilder(
            future: onTap(),
            builder: (context, snapShot) {
              return response == null
                  ? Container(
                      height: _heightScale * 680,
                      width: double.infinity,
                      child: Center(child: CircularProgressIndicator()))
                  : Column(
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
                        SizedBox(height: _heightScale * 15),
                        Row(
                          children: [
                            SizedBox(
                              width: _widthScale * 24,
                            ),
                            Text(
                              "Your Skills",
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightScale * 24,
                        ),
                        FutureBuilder(
                            future: getgf(),
                            builder: (context, snapShot) {
                              return x == 0
                                  ? Container(
                                      height: _heightScale * 50,
                                      width: double.infinity,
                                      // color: Colors.yellow,
                                      child: Center(
                                          child: Text(
                                        "No Skills added",
                                        style: GoogleFonts.poppins(
                                            fontSize: _widthScale * 14,
                                            color: black(context)),
                                      )),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: x != null ? x : 0,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            child: button(
                                                getCapitalizeStringaa(
                                                    response["skills"][index]
                                                        ['name']),
                                                getCapitalizeStringaa(
                                                    response["skills"][index]
                                                            ['price']
                                                        .toString()),
                                                text6,
                                                white(context),
                                                index));
                                      });
                            }),
                      ],
                    );
            });
      })),
    );
  }

  Widget button(String time, String amt, Color col, Color col2, int i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: _widthScale * 20),
            height: _heightScale * 58,
            width: double.infinity,
            decoration: BoxDecoration(
                color: white(context).withOpacity(0.39),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color:
                        // isLoading == true ? white.withOpacity(0.39) :
                        text6)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _widthScale * 15.0, vertical: _heightScale * 12),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getCapitalizeStringaa(time),
                      style: GoogleFonts.poppins(
                          fontSize: _widthScale * 14,
                          color: text6,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ' | Rs $amt',
                      style: GoogleFonts.poppins(
                          fontSize: _widthScale * 14,
                          color: text6,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
        SizedBox(
          height: _heightScale * 15,
        )
      ],
    );
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
                          EasyLoading.show();
                          print("ggg${this.userModel.toJson()}");
                          print("ggg${this.userModel.generalConversation}");
                          print(
                              "abcdis${this.userModel.skills.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "")},General Conversation");
                          print(
                              "ggg${this.userModel.skills.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "")}");
                          onSubmit();
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
    var search;

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
            child: Visibility(
              visible: true,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                    color: white(context).withOpacity(1),
                    onPressed: () {
                      showModalBottomSheet(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          context: context,
                          builder: (builder) {
                            return Container(
                              height: 800,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              height: 100,
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    search = value;
                                                  });
                                                  getSkillsApi
                                                      .getUniList(search);

                                                  print(search);
                                                },
                                                // controller: _cont,

                                                autofocus: false,
                                                style: TextStyle(
                                                    fontSize:
                                                        _widthScale * 15.0,
                                                    color: black(context)),
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: white(context)
                                                      .withOpacity(0.5),
                                                  hintText: "Enter Your Skills",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              fontSize:
                                                                  _widthScale *
                                                                      16,
                                                              color: text12
                                                                  .withOpacity(
                                                                      0.8))),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: _widthScale *
                                                              14.0,
                                                          bottom: _heightScale *
                                                              8.0,
                                                          top: _heightScale *
                                                              8.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        BorderSide(color: col1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            _widthScale * 6),
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: textFieldColor(
                                                          context),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            _widthScale * 6),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 35,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Colors.green,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    collage[index] =
                                                        search.toString();
                                                    this
                                                            .userModel
                                                            .skills[index] =
                                                        search.toString();
                                                  });
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 400,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: FutureBuilder(
                                          future:
                                              getSkillsApi.getUniList(search),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            if (snapshot.hasData) {
                                              var data = snapshot.data;
                                              if (data.suggestions.length ==
                                                  0) {
                                                return Center(
                                                  child: search
                                                              .toString()
                                                              .isEmpty ||
                                                          search == null
                                                      ? Text(
                                                          "Serach your skills")
                                                      : Text("Not Found"),
                                                );
                                              }
                                            }

                                            if (snapshot.hasData) {
                                              var data = snapshot.data;
                                              return ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      data.suggestions.length,
                                                  itemBuilder:
                                                      (context, snapshot) {
                                                    return GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {
                                                            collage[index] =
                                                                data.suggestions[
                                                                    snapshot];
                                                            this
                                                                    .userModel
                                                                    .skills[
                                                                index] = data
                                                                    .suggestions[
                                                                snapshot];
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 20.0,
                                                                  left: 10,
                                                                  right: 10),
                                                          child: Text(
                                                              data.suggestions[
                                                                  snapshot]),
                                                        ));
                                                  });
                                            }

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 50.0),
                                              child: const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          collage[index],
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),
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
      ),
    );
  }

  void addEmailControl() {
    setState(() {
      this.userModel.skills.add("");
      collage.add("Search your skills");
    });
  }

  void removeEmailControl(index) {
    setState(() {
      if (this.userModel.skills.length > 1) {
        this.userModel.skills.removeAt(index);
        collage.removeAt(index);
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
