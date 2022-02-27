import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/userprofile.dart';
import 'package:heybuddy/api/getProfessionalUsers.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopProfessional extends StatefulWidget {
  const TopProfessional({Key? key}) : super(key: key);

  @override
  _TopProfessionalState createState() => _TopProfessionalState();
}

class _TopProfessionalState extends State<TopProfessional> {
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
    // TODO: implement initState
    super.initState();
    getUsers(page);
    // UserSecureStorage();
    //  UserSecureStorage.getToken();
  }

  getUsers(page) async {
    res = await getProfessionalData(page);
    setState(() {
      filterUsers = res;
    });
    // setState(() {
    //   //   data = response;
    //   if (page > 1) {
    //     print("me chla");
    //     data.addAll(res);
    //     filterUsers = [
    //       ...filterUsers,
    //       ...res,
    //     ];
    //     refreshController.loadComplete();
    //   } else {
    //     print("Done");
    //     filterUsers = res;
    //   }
    //   EasyLoading.dismiss();
    // });
  }

  var output;
// List z = [];
//   getgh() async {
//     z = ["company"];
//     print("val of x is$z");
//     return z;
//   }
  var x;
  getgf() async {
    // x = List.generate(
    //     res[widget.i]["skills"] != null ? res[widget.i]["skills"].length : 0,
    //     (index) => res[widget.i]["skills"]);
    // // xy = res[widget.i]["skills"].length;
    // print("val of x is$x");
    // x = output[0]["skills"];
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
        body: SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _heightScale * 40,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Styles.isDark ? whites.withOpacity(0.8) : text9,
                  ),
                ),
                SizedBox(
                  width: _widthScale * 10,
                ),
                Text("Top Professionals",
                    style: GoogleFonts.poppins(fontSize: _widthScale * 18)),
              ],
            ),
            SizedBox(
              height: _heightScale * 54,
            ),
            res == null
                ? Container(
                    height: _heightScale * 600,
                    width: double.infinity,
                    child: Center(child: CircularProgressIndicator()))
                : Container(
                    width: double.infinity,
                    height: _heightScale * 650,
                    //color: black(context),
                    child: FutureBuilder(
                        future: getUsers(page),
                        builder: (context, snapShot) {
                          return ListView.builder(
                            itemCount:
                                filterUsers.isNotEmpty ? filterUsers.length : 0,
                            itemBuilder: (BuildContext context, int index) {
                              print("vvv is${filterUsers[index]['company']}");
                              List ggg = [];
                              ggg = filterUsers[index]['company'];
                              return GestureDetector(
                                onTap: () async {
                                  // output = await UniqueUser.uniqueUser(
                                  //     res[index]['phone']);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => UserProfile(
                                  //             img: filterUsers[index]
                                  //                         ["profilePic"] ==
                                  //                     ""
                                  //                 ? imggg
                                  //                 : filterUsers[index]
                                  //                     ["profilePic"],
                                  //             uniqueid: filterUsers[index]
                                  //                 ['phone'],
                                  //             // bio: res[index]["bio"] == null
                                  //             //     ? "Bio not added yet by professional"
                                  //             //     : res[index]["bio"],
                                  //             name: filterUsers[index]
                                  //                 ["name"],
                                  //             i: index)));
                                },
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
          ],
        ),
      )),
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

    return Column(
      children: [
        Container(
          height: _heightScale * 140,
          width: _widthScale * 316,
          decoration: BoxDecoration(
            // color: Colors.yellow,
            color: white(context).withOpacity(0.39),
            borderRadius: BorderRadius.all(Radius.circular(_widthScale * 20)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _widthScale * 18,
              ),
              // CircleAvatar(
              //   radius: _widthScale * 40,
              //   backgroundImage: AssetImage(img),
              // ),
              Stack(
                alignment: Alignment.topRight,
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
                ],
              ),
              SizedBox(
                width: _widthScale * 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   width: _widthScale * 20,
                  // ),
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
                  // SizedBox(
                  //   height: _heightScale * 5.96,
                  // ),
                  // Image.asset(
                  //   img3,
                  //   height: _heightScale * 30,
                  //   width: _widthScale * 107,
                  // ),
                  Text(img3,
                      style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                      )),
                  SizedBox(
                    height: _widthScale * 10,
                  ),
                  Text("Bookings : " + booking,
                      style: GoogleFonts.poppins(
                        fontSize: _widthScale * 12,
                      )),
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
                      fontSize: _widthScale * 18, color: black(context)),
                ),
              )),
        ),
        SizedBox(height: _heightScale * 25),
      ],
    );
  }
}
