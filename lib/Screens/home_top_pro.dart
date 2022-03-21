// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/userprofile.dart';
import 'package:heybuddy/api/getProfessionalUsers.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopProfessional02 extends StatefulWidget {
  const TopProfessional02({Key? key}) : super(key: key);

  @override
  _TopProfessionalState createState() => _TopProfessionalState();
}

class _TopProfessionalState extends State<TopProfessional02> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  var val;
  var res;
  List data = [];
  List filter = [];
  List filterUsers = [];
  List resultsList = [];
  var responsejob;
  int page = 1;
  void _onRefresh() async {
    print("vjbdvjhdbvjif");
    page = 1;
    getUsers(page);
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  void _onLoading(context) async {
    print("loadedede");
    //getJobs(page, valueChoose);
    page += 1;
    getUsers(page);
  }

  @override
  void initState() {
    super.initState();
    getUsers(page);
  }

  getUsers(page) async {
    res = await getProfessionalData(page);
    if (mounted) {
      setState(() {
        filterUsers = res;
      });
    }
  }

  var output;

  var x;
  getgf() async {
    return x;
  }

  String getCapitalizeStringaa(String str) {
    if (str.length <= 1) {
      return str.toUpperCase();
    }
    return '${str[0].toUpperCase()}${str.substring(1)}';
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

  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
        body: res == null
            ? Container(
                height: _heightScale * 600,
                width: double.infinity,
                child: Center(child: CircularProgressIndicator()))
            : Container(
                width: double.infinity,
                height: _heightScale * 700,
                //color: black(context),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                      future: getUsers(page),
                      builder: (context, snapShot) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: filterUsers.isNotEmpty
                              ? filterUsers.length > 4
                                  ? 4
                                  : filterUsers.length
                              : 0,
                          itemBuilder: (BuildContext context, int index) {
                            print("vvv is${filterUsers[index]['company']}");
                            List ggg = [];
                            ggg = filterUsers[index]['company'];
                            return GestureDetector(
                              onTap: () async {},
                              child: box2(
                                  "assets/Ellipse 9.png",
                                  // filterUsers[index]['profilePic'] != ""
                                  //     ? filterUsers[index]['profilePic']
                                  //     : imggg,
                                  // res != null ? res[index]['name'] : '',
                                  getCapitalizeStringaa(res != null
                                      ? filterUsers[index]['name']
                                      : ""),
                                  getCapitalizeStringaa(ggg.isEmpty
                                      ? "Not Mentioned"
                                      : filterUsers[index]['company'][0]
                                          ['title']),
                                  "assets/Education.png",
                                  // filterUsers[index]['university'] != ""
                                  //     ? filterUsers[index]['university']
                                  //     :
                                  'Not Mentioned Yet',
                                  getCapitalizeStringaa(ggg.isEmpty
                                      ? "Not Mentioned"
                                      : filterUsers[index]['company'][0]
                                          ['company_name']),
                                  index,
                                  filterUsers[index]['successful_session']
                                      .toString()),
                            );
                          },
                        );
                      }),
                ),
              ));
  }

  Widget userTile(var img, var title, var title2) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(_widthScale * 5.0)),
          child: Image.asset(
            img,
            height: _heightScale * 58,
            width: _widthScale * 55,
            fit: BoxFit.fill,
          )),
      title: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: _widthScale * 16),
              ),
            ],
          ),
          SizedBox(
            height: _widthScale * 6,
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Column(
            children: [
              Text(title2,
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 12, color: text10)),
            ],
          ),
        ],
      ),
    );
  }

  var ti;
  bool isTap = false;
  var nm;
  bool isPress = false;
  Widget box2(String img, String name, String role, String img2,
      String university, String img3, int i, String booking) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.yellow,
                  color: white(context).withOpacity(0.39),
                  borderRadius:
                      BorderRadius.all(Radius.circular(_widthScale * 20)),
                ),
                child: Column(
                  children: [
                    filterUsers[i]['anonymous'] == 'false'
                        ? filterUsers[i]['profilePic'] != ""
                            ? Container(
                                height: _heightScale * 80,
                                width: _widthScale * 65,
                                decoration: BoxDecoration(
                                    color: white(context).withOpacity(0.39),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          filterUsers[i]['profilePic'],
                                        ),
                                        fit: BoxFit.cover)),
                              )
                            : (filterUsers[i]['gender'] == "Male" ||
                                    filterUsers[i]['gender'] == "Other")
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
                        : (filterUsers[i]['gender'] == "Male" ||
                                filterUsers[i]['gender'] == "Other")
                            ? Image.asset(
                                'assets/Men Professional.png',
                                height: _heightScale * 80,
                                width: _widthScale * 65,
                              )
                            : Image.asset(
                                'assets/Female Professional.png',
                                height: _heightScale * 80,
                                width: _widthScale * 65,
                              ),
                    filterUsers[i]['verified'] == 'true'
                        ? Image.asset(
                            "assets/verify.png",
                            height: _heightScale * 20,
                            width: _widthScale * 20,
                            color: Colors.green,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    // SizedBox(
                    //   width: _widthScale * 20,
                    // ),
                    SizedBox(
                      height: _heightScale * 10,
                    ),
                    Text(res[i]['anonymous'] == 'true' ? "Anonymous" : name,
                        style: GoogleFonts.poppins(
                          fontSize: _widthScale * 14,
                          fontWeight: FontWeight.bold,
                        )),

                    SizedBox(
                      height: _heightScale * 10,
                    ),
                    Text(role,
                        style: GoogleFonts.poppins(
                          fontSize: _widthScale * 12,
                        )),
                    SizedBox(
                      height: _heightScale * 10,
                    ),

                    Text(img3,
                        style: GoogleFonts.poppins(
                          fontSize: _widthScale * 12,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: _heightScale * 42,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                  onPressed: () async {
                    nm = name;
                    ti = i;
                    setState(() {
                      isPress = true;
                    });
                    output = await UniqueUser.uniqueUser(res[i]['phone']);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfile(
                                img: filterUsers[i]["profilePic"] == ""
                                    ? imggg
                                    : filterUsers[i]["profilePic"],
                                uniqueid: filterUsers[i]['phone'],
                                // bio: res[index]["bio"] == null
                                //     ? "Bio not added yet by professional"
                                //     : res[index]["bio"],
                                name: filterUsers[i]["name"],
                                i: i)));
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
                      textStyle: TextStyle(
                          fontSize: _widthScale * 18, color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
