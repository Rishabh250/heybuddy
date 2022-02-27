import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/skills_to_user.dart';
import 'package:heybuddy/api/getProfessionalUsers.dart';
import 'package:heybuddy/api/skills_api.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopSkills extends StatefulWidget {
  const TopSkills({Key? key}) : super(key: key);

  @override
  _TopSkillsState createState() => _TopSkillsState();
}

class _TopSkillsState extends State<TopSkills> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    // getSkills();
    _onRefresh();
    super.initState();
  }

  bool isLoading = false;
  void _onRefresh() async {
    print("vjbdvjhdbvjif");
    // page = 1;
    // getSkills();
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  // var response;
  // getSkills() async {
  //   response = await getSkillsData();
  // }
  var responses;
  onSubmit(BuildContext context, titl) async {
    responses = await Skills.userSkills(titl);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SkillToUser(
                  name: titl,
                )));
  }

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
        padding: EdgeInsets.symmetric(horizontal: _widthScale * 16),
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
                Text("Top Skills",
                    style: GoogleFonts.poppins(fontSize: _widthScale * 18)),
              ],
            ),

            SizedBox(
              height: _heightScale * 54,
            ),
            // isLoading == true
            //     ? Container(
            //         height: _heightScale * 600,
            //         width: double.infinity,
            //         child: Center(child: Text("Please Wait...")))
            //     :
            Container(
              width: double.infinity,
              height: _heightScale * 650,
              //color: black(context),
              child: ListView.builder(
                  itemCount: skills.length,
                  itemBuilder: (BuildContext context, index) {
                    return topics(skills[index]);
                  }),
            ),
          ],
        ),
      )),
    ));
  }

  var ti;
  Widget topics(var title) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            ti = title;
            setState(() {
              isLoading = true;
            });

            await onSubmit(context, title);
            setState(() {
              isLoading = false;
            });
          },
          child: Container(
            padding: EdgeInsets.only(
                top: _heightScale * 10, bottom: _heightScale * 15),
            decoration: BoxDecoration(
                color: title == ti
                    ? isLoading == true
                        ? text6.withOpacity(0.1)
                        : white(context).withOpacity(0.39)
                    : white(context).withOpacity(0.39),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                    color:
                        // isLoading == true ? white.withOpacity(0.39) :
                        text6)),
            child: ListTile(
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
                    height: _widthScale * 9,
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.people,
                    color: blue(context),
                    size: _widthScale * 18,
                  ),
                  SizedBox(
                    width: _widthScale * 7.93,
                  ),
                  Text("Click to see no. of users",
                      style: GoogleFonts.poppins(fontSize: 12, color:Styles.isDark ? whites.withOpacity(0.8) :  text10))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: _heightScale * 5,
        ),
      ],
    );
  }
}

List skills = [
  "Java",
  "3D Animation",
  "Amazon Web Services",
  "Android Development",
  "AngularJS",
  "Artificial Intelligence",
  "ASP.NET",
  "Automated Software Testing",
  "Big Data Analytics",
  "Blockchain",
  "Blueprism",
  "C++",
  "Cloud Computing",
  "Core Java",
  "CSS",
  "Cyber Security",
  "Data Science",
  "DevOps",
  "Flutter",
  "Full Stack Developer",
  "Google AdSense",
  "Google Cloud",
  "HTML",
  "Income Tax",
  "Internal Audit",
  "Internet of Things",
  "IOS Development",
  "IT Audit",
  "IT Automation",
  ".NET",
  "Javascript",
  "Machine Learning",
  "Manual Testing",
  "Microsoft Azure",
  "MySQL",
  "Node.js",
  "PHP",
  "Python",
  "React Native",
  "React.js",
  "Robotic Process Automation",
  "Selenium",
  "SEO",
  "Tax Audits",
  "UI Path",
  "User Interface Design",
  "Video Editing",
  "Virtual Reality",
  "Visual Basic .NET",
  "Web Development"
];
