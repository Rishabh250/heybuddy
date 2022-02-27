import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/api_profile.dart';
import 'package:heybuddy/api/deleteskill.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/update_profile_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/language_model.dart';
import 'package:heybuddy/widgets/user_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class NewLanguages extends StatefulWidget {
  const NewLanguages({Key? key}) : super(key: key);

  @override
  _NewLanguagesState createState() => _NewLanguagesState();
}

class _NewLanguagesState extends State<NewLanguages> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LanguageModel userModel = new LanguageModel(
    new List<String>.empty(growable: true),
  );

  @override
  void initState() {
    super.initState();

    userModel.skills.add("");
  }

  var val = datam.read('f');
  onSubmit() {
    //  var bd = fff.read('l');
    // print("valof bdis$bd");
    var res = UpdateProfileLanguages.updatelanguage(
      "${this.userModel.skills.toString().replaceAll("[", "").replaceAll("]", "")}",
      val,
    );

    Navigator.pop(context);
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  var tkn = datam.read('f');
  var response;
  List vv = [];
  // List pp = [];
  onTap() async {
    response = await getdata(tkn);
    setState(() {
      iii = false;
    });
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
    x = response["languages"].length;
    print("val of x is$x");
    return x;
  }

  var z;
  getgh() async {
    // x = List.generate(
    //     response["skills"] != null ? response["skills"].length : 0,
    // (index) => response["skills"].length.toString());
    z = response["languages"];
    print("val of z is$z");
    return z;
  }

  var y;
  getcompanylength() async {
    y = response["languages"].length;
    print("val of x is$y");
    return y;
  }

  var langname;
  del(var name) async {
    setState(() {
      // ii = true;
      iii = true;
    });
    langname = await Deletelanguage.delete(name.toString().toLowerCase(), tkn);
    print("del lang name is ${name.toString()}");
    setState(() {
      onTap();
      // ii = false;
      // iii = ii;
    });
  }

  bool iii = false;

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    // TextEditingController _cont = TextEditingController();
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
            "Languages",
            style: GoogleFonts.poppins(
                color: black(context),
                fontSize: _widthScale * 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: onTap(),
              builder: (context, snapShot) {
                return (response == null || iii == true)
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
                                "Add Your Languages",
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
                                "Your Languages",
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
                                                      response["languages"]
                                                          [index]),
                                                  text6,
                                                  white(context),
                                                  index));
                                        });
                              }),
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     physics: NeverScrollableScrollPhysics(),
                          //     itemCount: x != null ? x : 0,
                          //     itemBuilder: (context, index) {
                          //       return button( getCapitalizeStringaa(
                          //                                           response["skills"]
                          //                                               [index]), text6, white, index);
                          //     }),
                        ],
                      );
              }),
        ));
  }

  Widget button(String time, Color col, Color col2, int i) {
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
                  horizontal: _widthScale * 15.0, vertical: _heightScale * 15),
              child: Text(
                time,
                style: GoogleFonts.poppins(
                    fontSize: _widthScale * 14,
                    color: text6,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: _widthScale * 25.0, top: _heightScale * 5),
                child: GestureDetector(
                  onTap: () {
                    del(time);
                  },
                  child: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ]),
        SizedBox(
          height: _heightScale * 15,
        )
      ],
    );
  }

  Widget buttons(String time, Color col, Color col2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _widthScale * 20.0),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[50],
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(_widthScale * 8.0),
            child: Row(
              children: [
                Text(
                  time,
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14, color: whitebox(context)),
                ),
              ],
            ),
          )),
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
                      "Languages*",
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
                          print("ggg${this.userModel.toJson()}");
                          // print("ggg${this.userModel.generalConversation}");
                          print(
                              "abcdis${this.userModel.skills.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "")},General Conversation");
                          print(
                              "ggg${this.userModel.skills.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(" ", "")}");
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SlotConfirm()));
                          onSubmit();
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
              textInputAction: TextInputAction.next,
              validator: (onValidateVal) {
                if (onValidateVal!.isEmpty) {
                  return 'Language ${index + 1} can\'t be empty.';
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
              child: Builder(builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    // FocusScope.of(context).nextFocus();
                    addEmailControl();

                    FocusScope.of(context).nextFocus();
                  },
                );
              }),
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
    FocusScope.of(context).nextFocus();
    setState(() {
      this.userModel.skills.add("");
      // FocusScope.of(context).nextFocus();
    });
    // FocusScope.of(context).nextFocus();
    // FocusScope.of(context).nextFocus();
  }

  void removeEmailControl(index) {
    FocusScope.of(context).previousFocus();
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
