import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/detail_searchpage.dart';
import 'package:heybuddy/Screens/userprofile.dart';
import 'package:heybuddy/api/search_api.dart';
import 'package:heybuddy/api/unique_user.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  TextEditingController _controller = TextEditingController();
  var res;
  // List res = [];
  List data = [];
  int page = 1;
  List filterUsers = [];
  // List resultsList = [];
  var name = "";
  void _onRefresh() async {
    print("vjbdvjhdbvjif");
    page = 1;
    getSearch(page, name);
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  void _onLoading(context) async {
    print("loadedede");
    page += 1;
    getSearch(page, _controller.text);
  }

  @override
  void initState() {
    super.initState();
    // getSearch(page, name);
  }

  getSearch(page, name) async {
    res = await getSearchUsers(page, name);
    if (mounted) {
      setState(() {
        filterUsers = res;
      });
    }
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

  var output;
  var imggg = "https://identix.state.gov/qotw/images/no-photo.gif";
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: appbar(context), // backgroundColor,
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
          "Search",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: black(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 20,
              ),
              Container(
                child: TextField(
                  controller: _controller,
                  onChanged: (val) {
                    setState(() {
                      print(val);
                      getSearch(page, val);
                      print("Name is getting printed$val");
                    });
                  },
                  autofocus: true,
                  style: TextStyle(
                      fontSize: _widthScale * 15.0, color: black(context)),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: _widthScale * 10.0, right: _widthScale * 10),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    // prefix: Padding(
                    //   padding: const EdgeInsets.only(left: 10.0, right: 10),
                    //   child: Image.asset("assets/Search.png"),
                    // ),
                    // suffix: Padding(
                    //   padding: const EdgeInsets.only(right: 20.0),
                    //   child: Theme(
                    //     data: Theme.of(context).copyWith(canvasColor: white),
                    //     child: DropdownButtonHideUnderline(
                    //       child: DropdownButton(
                    //         // disabledHint: true,
                    //         focusColor: white,
                    //         isExpanded: false,
                    //         value: valueChoose,
                    //         onChanged: (newValue) {
                    //           setState(() {
                    //             valueChoose = newValue.toString();
                    //             print(valueChoose);
                    //           });
                    //         },
                    //         dropdownColor: white,
                    //         icon: Icon(
                    //           Icons.filter_list_alt,
                    //           color: blue,
                    //         ),
                    //         items: _locations.map((location) {
                    //           return new DropdownMenuItem<String>(
                    //             value: location,
                    //             child: new Text(
                    //               "",
                    //               style: GoogleFonts.poppins(color: black(context)),
                    //             ),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    suffix: Padding(
                      padding: EdgeInsets.only(right: _widthScale * 18.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSearchPage()));
                        },
                        child: Image.asset(
                          "assets/filter.png",
                          height: _heightScale * 20,
                          width: _widthScale * 20,
                        ),
                      ),
                    ),

                    filled: true,
                    fillColor: white(context).withOpacity(0.39),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 14,
                          color: text12.withOpacity(0.8)),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: _widthScale * 14.0,
                        bottom: _widthScale * 8.0,
                        top: _widthScale * 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: text8),
                      borderRadius: BorderRadius.circular(_widthScale * 6),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: text8),
                      borderRadius: BorderRadius.circular(_widthScale * 6),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 29,
              ),
              filterUsers.isEmpty
                  ? Container(
                      height: _heightScale * 230,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Please search ",
                          style: GoogleFonts.poppins(
                              fontSize: 14 * _widthScale,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                  : Container(
                      width: double.infinity,
                      height: _heightScale * 630,
                      child: FutureBuilder(
                          future: getSearch(page, _controller.text),
                          builder: (context, snapShot) {
                            return
                                // SmartRefresher(
                                //   controller: refreshController,
                                //   enablePullUp: true,
                                //   enablePullDown: false,
                                //   onRefresh: _onRefresh,
                                //   onLoading: () => _onLoading(context),
                                //   child:
                                ListView.builder(
                                    itemCount:
                                        res != null ? filterUsers.length : 0,
                                    itemBuilder: (BuildContext context, index) {
                                      List ggg = [];
                                      ggg = filterUsers[index]['company'];
                                      return box2(
                                        // "assets/Ellipse 9.png",
                                        // res != null
                                        //     ? filterUsers[index]
                                        //                 ['profilePic'] !=
                                        //             ""
                                        //         ? filterUsers[index]
                                        //             ['profilePic']
                                        //         : imggg
                                        //     :
                                        "",
                                        // "Manideep Mittapelli",
                                        res != null
                                            ? filterUsers[index]['name']
                                            : "",
                                        // "Sr Technical Program Manager",
                                        ggg.isEmpty
                                            ? "Not Mentioned"
                                            : filterUsers[index]['company'][0]
                                                ['title'],
                                        // "a",
                                        "assets/Education.png",
                                        // res != null
                                        //     ? filterUsers[index]['university'] !=
                                        //             null
                                        //         ? filterUsers[index]['university']
                                        //         : "Not Added by Professional Yet"
                                        //     :
                                        "",
                                        ggg.isEmpty
                                            ? "Not Mentioned"
                                            : filterUsers[index]['company'][0]
                                                ['company_name'],
                                        // "b",
                                        // "assets/Rectangle 704.png",
                                        index,
                                      );
                                    });
                            // );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }

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
        // nm = name;
        // ti = university;
        // setState(() {
        //   isPress = true;
        // });
        // output = await UniqueUser.uniqueUser(res[i]['phone']);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => UserProfile(
        //             name: name, img: img, uniqueid: res[i]['phone'], i: i)));
        // print("iii$i");
        // setState(() {
        //   isPress = false;
        // });
      },
      child: Column(
        children: [
          Container(
            height: _heightScale * 135,
            width: double.infinity, //_widthScale * 316,
            decoration: BoxDecoration(
              // color: Colors.yellow,
              color:
                  white(context).withOpacity(0.39), // white.withOpacity(0.39),
              borderRadius: BorderRadius.all(Radius.circular(_widthScale * 20)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: _widthScale * 15,
                ),
                // CircleAvatar(
                //   radius: _widthScale * 40,
                //   backgroundImage: AssetImage(img),
                // ),
                GestureDetector(
                  onTap: () async {
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
                                name: name,
                                img: img,
                                uniqueid: res[i]['phone'],
                                i: i)));
                    print("iii$i");
                    setState(() {
                      isPress = false;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      res != null
                          ? filterUsers[i]['anonymous'] == 'false'
                              ? filterUsers[i]['profilePic'] != ""
                                  ? Container(
                                      height: _heightScale * 80,
                                      width: _widthScale * 65,
                                      decoration: BoxDecoration(
                                          color:
                                              white(context).withOpacity(0.39),
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
                ),
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
                            res[i]['anonymous'] == 'true' ? "Anonymous" : name),
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
                    //       width: _widthScale * 20,
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
          GestureDetector(
            child: Container(
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
                                name: name,
                                img: img,
                                uniqueid: res[i]['phone'],
                                i: i)));
                    print("iii$i");
                    setState(() {
                      isPress = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: res[i]['available'] == 'false'
                        ? name == nm && i == ti
                            ? isPress == true
                                ? text6.withOpacity(0.1)
                                : text6
                            : text6
                        : Colors.grey,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: text6),
                    ),
                  ),
                  child: Text(
                    res[i]['available'] == 'true' ? "Not Available" : "Connect",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 18, color: white(context)),
                    ),
                  )),
            ),
          ),
          SizedBox(height: _heightScale * 25),
        ],
      ),
    );
  }
}
