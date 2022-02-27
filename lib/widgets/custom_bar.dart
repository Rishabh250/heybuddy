import 'package:flutter/material.dart';
import 'package:heybuddy/Screens/calendar.dart';
import 'package:heybuddy/Screens/homePage.dart';
import 'package:heybuddy/Screens/loginScreen.dart';
import 'package:heybuddy/Screens/notifications.dart';
import 'package:heybuddy/Screens/professionaluserprofile.dart';
import 'package:heybuddy/Screens/profile.dart';
import 'package:heybuddy/Screens/welcome.dart';
import 'package:heybuddy/api/getProfessionalUsers.dart';
import 'package:heybuddy/api/notification.dart';
import 'package:heybuddy/api/profileget_api.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/main.dart';
import 'package:heybuddy/shared_preference/innercheck_shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference.dart';
import 'package:heybuddy/shared_preference/shared_preference_login.dart';
import 'package:heybuddy/shared_preference/upercheck_sharedpreference.dart';
import 'package:heybuddy/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class Nav1 extends StatefulWidget {
  var selectedIndex;
  Nav1({required this.selectedIndex});
  @override
  _Nav1State createState() => _Nav1State();
}

class _Nav1State extends State<Nav1> {
  var isSelected = false;

  // int _selectedIndex = 0;
  // List<Widget> _widgetOptions = <Widget>[
  //   HomePage(),
  //   Calendar(),
  //   NotificationsPage(),
  //   ProfileScreen(),
  // ];

  void _onItemTap(int index) {
    setState(() {
      // _selectedIndex = index;
      isSelected = true;
      //isSelected++;
    });
  }

  var val;
  var inCheck;
  var upCheck;
  var inCheckk;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginPreference = LoginPreference();
    uperCheck = UpperCheck();
    innerCheck = InnerCheck();
    // getData();
    chooseLogin();
    innerCheckLogin();
    innerCheckLoginn();
    upperCheckLogin();
    // notificatio();
    getData();
  }

  var notif;
  notificatio() async {
    notif = await notification(tkn);
    localNotification.testNotification();
    print("hitted is $notif");
    return notif;
  }

  chooseLogin() async {
    val = await loginPreference?.getLoginStatus();
    // await innerCheckLogin();
  }

  innerCheckLogin() async {
    inCheck = await innerCheck?.getLogin();
    setState(() {
      print("incheckkkk$inCheck");
    });
  }

  innerCheckLoginn() async {
    inCheckk = await innerCheck?.getLoginn();
    print("incheckp$inCheckk");
  }

  upperCheckLogin() async {
    upCheck = await uperCheck?.getLoginStatus();
  }

  var response;
  var tkn = datam.read('f');
  Future getData() async {
    response = await getdetails(tkn);
    // Provider.of<Choose>(context, listen: false).changeFavs(response);
    print("resssssss$response");
    if (response == 'professional') {
      // loginPreference?.setLoginStatus(false);
      innerCheck?.setLoginn(true);
      innerCheck?.setLogin(false);
      print("beech1");
      return response;
    } else if (response == 'aspirant') {
      print("bee22");
      innerCheck?.setLogin(true);
      innerCheck?.setLoginn(false);
      // loginPreference?.setLoginStatus(true);
      return response;
    }
  }

  var res;

  getUsers(page) async {
    res = await getProfessionalData(page);
  }

  @override
  Widget build(BuildContext context) {
    //    Future<void> getData() async {
    //   response = await getdetails(tokenProfile?.token);
    //   print("resssssss$response");
    //   if (response == 'professional') {
    //     // loginPreference?.setLoginStatus(false);
    //     innerCheck?.setLogin(false);
    //     print("beech1");
    //   } else if (response == 'aspirant') {
    //     print("bee22");
    //     innerCheck?.setLogin(true);
    //     // loginPreference?.setLoginStatus(true);
    //   }
    // }
    print("pdd ${val}");
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    // var word = Provider.of<Favourite>(context).fav;
    //  var checks = Provider.of<Choose>(context).favs;
    // print("worddddd${word}");
    // print("upcheck${upCheck}");
    // print("valllll${val}");
    print("incheck$inCheck");
    print("kk$inCheckk");
    // print("bhaiiiiiiii${widget.data}");
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      Calendar(),
      NotificationsPage(),
      // word == 'I am a professional'
      inCheck == false ? ProfessionalUserProfile() : ProfileScreen(),
      // upCheck == true
      //     ? (val == false ? ProfessionalUserProfile() : ProfileScreen())
      //     : inCheck == true
      //         //  : (inCheck == true||inCheckk == false)
      //         ? ProfileScreen()
      //         : inCheck == null
      //             ? CircularProgressIndicator()
      //             : ProfessionalUserProfile()

      // upCheck == true
      //     ? (val == false ? ProfessionalUserProfile() : ProfileScreen())
      //     : ((inCheckk == true) && (inCheck == false))
      //         ? ProfessionalUserProfile()
      //         : ((inCheck == true) || (inCheckk == false))
      //             ? ProfileScreen()
      //             : ProfessionalUserProfile(),
      // val == false ? ProfessionalUserProfile() : ProfileScreen(),
    ];
    var size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: getData(),
        builder: (context, snapShot) {
          snapShot.data == 'aspirant' ? inCheck = true : inCheck = false;
          return Scaffold(
            drawer: CustomAppDrawer(),
            appBar: widget.selectedIndex == 4
                ? null
                : AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: appbar(context),
                    title: Builder(builder: (context) {
                      return Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Container(
                                // color: Colors.yellow,
                                height: _heightScale * 30,
                                width: _widthScale * 35,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: Image.asset(
                                      "assets/Vector.png",
                                      height: _heightScale * 16.85,
                                      width: _widthScale * 18,
                                      color: black(context),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: _widthScale * 84, //120,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Nav1(selectedIndex: 0)),
                                  (route) => true);
                            },
                            child: Image.asset(
                              "assets/hort2.png",
                              height: _heightScale * 25,
                              width: _widthScale * 115,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
            body: Center(
              child: _widgetOptions.elementAt(widget.selectedIndex),
            ),
            bottomNavigationBar: FutureBuilder(
                future: getUsers(1),
                builder: (context, snapShot) {
                  return res == null
                      ? Container(
                          height: _heightScale * 78,
                          width: _widthScale * 330,
                          color: backgroundColor,
                        )
                      : Container(
                          height: _heightScale * 78,
                          width: _widthScale * 330,
                          margin: EdgeInsets.only(
                              left: _widthScale * 15,
                              right: _widthScale * 15,
                              bottom: _widthScale * 8),
                          decoration: BoxDecoration(
                            color: text6,
                            borderRadius: BorderRadius.all(
                                Radius.circular(_widthScale * 15)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: _widthScale * 10,
                                  ),
                                  Expanded(
                                      child: buildNavBarItem(Icons.home_rounded,
                                          Icons.home_outlined, 0)),
                                  Expanded(
                                      child: buildNavBarItem(
                                          Icons.calendar_today_rounded,
                                          Icons.calendar_today_outlined,
                                          1)),
                                  Expanded(
                                      child: buildNavBarItem(
                                          Icons.notifications_on,
                                          Icons.notifications_on_outlined,
                                          2)),
                                  // if(response.data=='aspirant')
                                  Expanded(
                                      child: buildNavBarItem(
                                          Icons.account_circle,
                                          Icons.account_circle_outlined,
                                          3)),
                                  SizedBox(
                                    width: _widthScale * 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                }),
          );
        });
  }

  Widget buildNavBarItemProfile(IconData icon, IconData icon2, int index) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return GestureDetector(
      onTap: () {
        // widget.onChange(index);
        setState(() {
          widget.selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: _heightScale * 24.0),
            child: Image.asset(
              index == widget.selectedIndex
                  ? "assets/fourtabicon2.png"
                  : "assets/fourtabicon.png",
              width: index != widget.selectedIndex
                  ? _widthScale * 28
                  : _widthScale * 25,
              color: white(context),
              height: index != widget.selectedIndex
                  ? _heightScale * 28
                  : _heightScale * 25,
            ),
            //  Icon(
            //   widget.selectedIndex == index ? icon : icon2, color: white,
            //   // color: index == _selectedIndex ? Colors.black(context) : Colors.grey,
            //   size: _widthScale * 25,
            // ),
          ),
          SizedBox(
            height: _widthScale * 10.5,
          ),
          Container(
            height: _heightScale * 5,
            width: _widthScale * 16,
            decoration: BoxDecoration(
              color: index == widget.selectedIndex ? white(context) : text6,
              borderRadius: BorderRadius.all(Radius.circular(_widthScale * 2)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, IconData icon2, int index) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return GestureDetector(
      onTap: () {
        // widget.onChange(index);
        setState(() {
          widget.selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: _heightScale * 24.0),
            child: Icon(
              widget.selectedIndex == index ? icon : icon2,
              color: whites, //white(context),
              // color: index == _selectedIndex ? Colors.black(context) : Colors.grey,
              size: _widthScale * 25,
            ),
          ),
          SizedBox(
            height: _widthScale * 10.5,
          ),
          Container(
            height: _heightScale * 5,
            width: _widthScale * 16,
            decoration: BoxDecoration(
              color: index == widget.selectedIndex ? whites : text6,
              borderRadius: BorderRadius.all(Radius.circular(_widthScale * 2)),
            ),
          ),
        ],
      ),
    );
  }
}
