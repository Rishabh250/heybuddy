import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/userprofile.dart';
import 'package:heybuddy/api/skills_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';

class SkillToUser extends StatefulWidget {
  var name;
  SkillToUser({required this.name});
  // const SkillToUser({Key? key}) : super(key: key);

  @override
  _SkillToUserState createState() => _SkillToUserState();
}

class _SkillToUserState extends State<SkillToUser> {
  List responses = [];
  var response;
  _onSubmit(BuildContext context) async {
    response = await Skills.userSkills(widget.name);
    setState(() {
      responses = response;
    });
  }

  String getCapitalizeString(String input) {
    final List<String> splitStr = input.split(' ');
    for (int i = 0; i < splitStr.length; i++) {
      splitStr[i] =
          '${splitStr[i][0].toUpperCase()}${splitStr[i].substring(1)}';
    }
    final output = splitStr.join(' ');
    return output;
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: black(context),
          ),
        ),
        title: Text(
          "Users",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: black(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder(
            future: _onSubmit(context),
            builder: (context, snapShot) {
              // builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: _heightScale * 40,
                    ),
                    // response==null
                    // ? Container(
                    //     height: _heightScale * 600,
                    //     width: double.infinity,
                    //     child: Center(child: CircularProgressIndicator()))
                    //     :
                    responses.isNotEmpty
                        ? Container(
                            // color: Colors.yellow,
                            height: _heightScale * 700,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount:
                                    response != null ? response.length : 0,
                                itemBuilder: (BuildContext context, index) {
                                  List ggg = [];
                                  ggg = responses[index]['company'];
                                  return box2(
                                    response != null
                                        ? responses[index]['profilePic'] == ""
                                            ? imggg
                                            : responses[index]['profilePic']
                                        : "",
                                    // "Manideep Mittapelli",
                                    response != null
                                        ? responses[index]['name']
                                        : "",
                                    ggg.isEmpty
                                        ? "Not Mentioned"
                                        : responses[index]['company'][0]
                                                    ['title'] ==
                                                ""
                                            ? "Not Mentioned"
                                            : responses[index]['company'][0]
                                                ['title'],
                                    // response != null
                                    //     ? '${response[index]['company'][index]['company_name']}, ' +
                                    //         '${response[index]['company'][index + 1]['company_name']}'
                                    //     : "j",
                                    "assets/Education.png",
                                    // responses[index]['university'] != ""
                                    //     ? responses[index]['university']
                                    //     :
                                    'Not Mentioned Yet',
                                    ggg.isEmpty
                                        ? "Not Mentioned"
                                        : responses[index]['company'][0]
                                            ['company_name'],
                                    index,
                                  );
                                }))
                        : response == null
                            ? Container(
                                height: _heightScale * 600,
                                width: double.infinity,
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : Container(
                                height: _heightScale * 600,
                                width: double.infinity,
                                child: Center(
                                    child: Text(
                                  "No Users Found...",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )))
                  ],
                ),
              );
            }),
      ),
    );
  }

  var out;
  var ti;
  bool isTap = false;
  var nm;
  bool isPress = false;
  Widget box2(String img, String name, String role, String img2,
      String university, String img3, int i) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return GestureDetector(
      onTap: () async {
        // nm = img3;
        // setState(() {
        //   isPress = true;
        // });
        // out = await UniqueUser.uniqueUser(responses[i]['phone']);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => UserProfile(
        //             name: name,
        //             img: img,
        //             uniqueid: responses[i]['phone'],
        //             i: i)));
        // print("iii$i");
        // setState(() {
        //   isPress = false;
        // });
      },
      child: Column(
        children: [
          Container(
            height: _heightScale * 135,
            width: _widthScale * 316,
            decoration: BoxDecoration(
              // color: Colors.yellow,
              color: img3 == nm
                  ? isPress == true
                      ? text6.withOpacity(0.1)
                      : white(context).withOpacity(0.39)
                  : white(context).withOpacity(0.39), // white.withOpacity(0.39),
              borderRadius: BorderRadius.all(Radius.circular(_widthScale * 20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: _widthScale * 18,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    response != null
                        ? responses[i]['anonymous'] == "false"
                            ? responses[i]['profilePic'] == ""
                                ? (responses[i]['gender'] == "Male" ||
                                        responses[i]['gender'] == "Other")
                                    ? Image.asset(
                                        'assets/Men Professional.png',
                                        height: _heightScale * 80,
                                        width: _widthScale * 65,
                                      )
                                    : Image.asset(
                                        'assets/Female Professional.png',
                                        height: _heightScale * 80,
                                        width: _widthScale * 65,
                                      )
                                : Container(
                                    height: _heightScale * 80,
                                    width: _widthScale * 65,
                                    decoration: BoxDecoration(
                                        color: white(context).withOpacity(0.39),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              responses[i]['profilePic'],
                                            ),
                                            fit: BoxFit.cover)),
                                  )
                            : (responses[i]['gender'] == "Male" ||
                                    responses[i]['gender'] == "Other")
                                ? Image.asset(
                                    'assets/Men Professional.png',
                                    height: _heightScale * 80,
                                    width: _widthScale * 65,
                                  )
                                : Image.asset(
                                    'assets/Female Professional.png',
                                    height: _heightScale * 80,
                                    width: _widthScale * 65,
                                  )
                        : Container(),
                    //          Image.asset(
                    //   'assets/Men Professional.png',
                    //   height: _heightScale * 60,
                    //   width: _widthScale * 60,
                    // ),
                    responses[i]['verified'] == 'true'
                        ? Image.asset(
                            "assets/verify.png",
                            color: Colors.green,
                            height: _heightScale * 20,
                            width: _widthScale * 20,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ],
                ),
                // CircleAvatar(
                //   radius: _widthScale * 40,
                //   backgroundImage: AssetImage(img),
                // ),
                SizedBox(
                  width: _widthScale * 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: _widthScale * 20,
                    ),
                    Text(
                        getCapitalizeStringaa(
                            responses[i]['anonymous'] == 'true'
                                ? "Anonymous"
                                : name),
                        style: GoogleFonts.poppins(
                          fontSize: _widthScale * 14,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: _heightScale * 10,
                    ),
                    Text(getCapitalizeStringaa(role),
                        style: GoogleFonts.poppins(
                          fontSize: _widthScale * 12,
                        )),
                    SizedBox(
                      height: _heightScale * 9,
                    ),
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: _widthScale * 30,
                    //     ),
                    //     Image.asset(
                    //       img2,
                    //       // color: blue,
                    //       height: _heightScale * 25,
                    //       width: _widthScale * 25,
                    //     ),
                    //     SizedBox(
                    //       width: _widthScale * 8.96,
                    //     ),
                    //     Text(university,
                    //         style: GoogleFonts.poppins(
                    //           fontSize: _widthScale * 12,
                    //         )),
                    //   ],
                    // ),
                    SizedBox(
                      height: _heightScale * 5.96,
                    ),
                    // Image.asset(
                    //   img3,
                    //   height: _heightScale * 30,
                    //   width: _widthScale * 107,
                    // ),
                    Text(getCapitalizeStringaa(img3),
                        style: GoogleFonts.poppins(
                          fontSize: _widthScale * 12,
                        )),
                    SizedBox(
                      height: _widthScale * 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: _heightScale * 42,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  nm = name;
                  ti = i;
                  setState(() {
                    isPress = true;
                  });
                  out = await UniqueUser.uniqueUser(responses[i]['phone']);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfile(
                              name: name,
                              img: img,
                              uniqueid: responses[i]['phone'],
                              i: i)));
                  print("iii$i");
                  setState(() {
                    isPress = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: name == nm && i == ti
                      ? isPress == true
                          ? text6.withOpacity(0.1)
                          : text6
                      : text6,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: text6),
                  ),
                ),
                child: Text(
                  "Connect",
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: _widthScale * 18, color: white(context)),
                  ),
                )),
          ),
          SizedBox(height: _heightScale * 25),
        ],
      ),
    );
  }
}
