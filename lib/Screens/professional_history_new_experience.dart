import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/api/add_company.dart';
import 'package:heybuddy/api/signin_api.dart';
import 'package:heybuddy/api/suggestions_api/company_suggestions.dart';
import 'package:heybuddy/color&font/colors.dart';
import 'package:heybuddy/provider/styles.dart';
import 'package:heybuddy/widgets/custom_drop_down_button.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

String collage = "Search your comapny name";

class ProffesionalHistoryFormFill extends StatefulWidget {
  const ProffesionalHistoryFormFill({Key? key}) : super(key: key);

  @override
  _ProffesionalHistoryFormFillState createState() =>
      _ProffesionalHistoryFormFillState();
}

class _ProffesionalHistoryFormFillState
    extends State<ProffesionalHistoryFormFill> {
  TextEditingController _title = TextEditingController();
  TextEditingController _companyname = TextEditingController();
  var pickedDate;
  var newDate;
  var pickedDateend;
  var endDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickedDate = DateTime.now();
  }

  var token = datam.read('f');
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

  Future pickDateend(BuildContext context) async {
    final initialDate = DateTime.now();
    endDate = await showDatePicker(
      context: context,
      initialDate: pickedDateend ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (endDate == null) return;

    setState(() => pickedDateend = endDate);
  }

  String getText() {
    if (pickedDate == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd-MM-yyyy').format(pickedDate);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  String getTexts() {
    if (pickedDateend == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd-MM-yyyy').format(pickedDateend);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  var output;
  // onSubmit() async {
  //   output = await UpdateCompany.updatecompany(
  //       _title.text, _companyname.text, getText(), getTexts(), token);
  //   Navigator.pop(context);
  // }

  onSubmit(var check) async {
    // output = await UpdateCompany.updatecompany(_title.text, _companyname.text,
    //     "01-$_valuestart-$_startYear", "01-$_valueend-$_endYear", token);

    if (check == true) {
      print("currently working");
      output = await UpdateCompany.updatecompany(
          _title.text, collage, "$_valuestart-01-$_startYear", " ", token);
      EasyLoading.dismiss();

      Navigator.pop(context);
    } else if (check == false) {
      EasyLoading.dismiss();

      if (_valuestart == _valueend && _startYear == _endYear) {
        const snackBar = SnackBar(
          content: Text("Starting month cannot be same as end month"),
          backgroundColor: text6,
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      print("currently working not");
      output = await UpdateCompany.updatecompany(_title.text, collage,
          "$_valuestart-01-$_startYear", "$_valueend-01-$_endYear", token);
      Navigator.pop(context);
    }
    setState(() {
      collage = 'Search your comapny name';
    });
  }

  List itemsstart = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List itemsend = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String _valuestart = "January";
  onChangestart(newVal) {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      _valuestart = newVal;
    });
  }

  String _valueend = "January";
  onChangeend(newVal) {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      _valueend = newVal;
    });
  }

  String _startYear = "2022";

  onChangestartYear(newValstartYear) {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      _startYear = newValstartYear;
    });
  }

  String _endYear = "2022";
  onChangeendYear(newValendYear) {
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      _endYear = newValendYear;
    });
  }

  bool isCheckbox = false;
  bool checkSchool = false;
  bool isVisible = false;
  bool isVisiblebtn = true;
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appbar(context), //white(context).withOpacity(0.6),
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
          "Add Professional History",
          style: GoogleFonts.poppins(
              color: black(context),
              fontSize: _widthScale * 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.78,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: _heightScale * 44,
                        ),
                        Row(
                          children: [
                            Text(
                              "Add Your Professional History",
                              style: GoogleFonts.poppins(
                                  fontSize: _widthScale * 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: _heightScale * 15,
                        ),
                        fields("Title*", "Enter your title"),
                        fieldss("Company Name*", "Enter your Company Name"),
                        //fields("Year*", "Enter your Year"),
                        //fields("Location*", "Enter company location"),
                        SizedBox(
                          height: _heightScale * 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: _widthScale * 10,
                            ),
                            Text(
                              "Start Year*",
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
                          height: _heightScale * 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          child: Container(
                            height: _heightScale * 56,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: white(context).withOpacity(0.5),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(_widthScale * 6)),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              child: CustomDropDownButton(
                                  widthScale: 1,
                                  hintText: "",
                                  items: itemsYearstart,
                                  onChange: onChangestartYear,
                                  value: _startYear),
                            ),
                            // child: ListTile(
                            //   title: Text(
                            //     getText(),
                            //     style: GoogleFonts.poppins(
                            //         color: text12.withOpacity(0.8),
                            //         fontSize: _widthScale * 16),
                            //   ),
                            //   // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                            //   trailing: InkWell(
                            //       onTap: () => pickDate(context),
                            //       child: Image.asset(
                            //         "assets/Group 804.png",
                            //         height: _heightScale * 20,
                            //         width: _widthScale * 20,
                            //       )),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: _heightScale * 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: _widthScale * 10,
                            ),
                            Text(
                              "Start Month*",
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
                          height: _heightScale * 13,
                        ),
                        Container(
                          height: _heightScale * 56,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: white(context).withOpacity(0.5),
                            borderRadius: BorderRadius.all(
                                Radius.circular(_widthScale * 6)),
                          ),
                          child: CustomDropDownButton(
                              widthScale: 1,
                              hintText: "",
                              items: itemsstart,
                              onChange: onChangestart,
                              value: _valuestart),
                          // child: ListTile(
                          //   title: Text(getTexts(),
                          //       style: GoogleFonts.poppins(
                          //           color: text12.withOpacity(0.8),
                          //           fontSize: _widthScale * 16)),
                          //   // title: Text("${pickedDate.year},${pickedDate!.month},${pickedDate!.day}"),
                          //   trailing: InkWell(
                          //       onTap: () => pickDateend(context),
                          //       child: Image.asset("assets/Group 804.png")),
                          // ),
                        ),
                        SizedBox(
                          height: _heightScale * 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheckbox,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckbox = value!;
                                  });
                                }),
                            Text("I am Currently Working"),
                          ],
                        ),
                        SizedBox(
                          height: _heightScale * 20,
                        ),
                        isCheckbox == false
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: _widthScale * 10,
                                      ),
                                      Text(
                                        "End Year*",
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
                                    height: _heightScale * 13,
                                  ),
                                  Container(
                                    height: _heightScale * 56,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: white(context).withOpacity(0.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(_widthScale * 6)),
                                    ),
                                    child: CustomDropDownButton(
                                        widthScale: 1,
                                        hintText: "",
                                        items: itemsYearend,
                                        onChange: onChangeendYear,
                                        value: _endYear),
                                  ),
                                  SizedBox(
                                    height: _heightScale * 30,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: _widthScale * 10,
                                      ),
                                      Text(
                                        "End Month*",
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
                                    height: _heightScale * 13,
                                  ),
                                  Container(
                                    height: _heightScale * 56,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: white(context).withOpacity(0.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(_widthScale * 6)),
                                    ),
                                    child: CustomDropDownButton(
                                        widthScale: 1,
                                        hintText: "",
                                        items: itemsend,
                                        onChange: onChangeend,
                                        value: _valueend),
                                  ),
                                  SizedBox(
                                    height: _heightScale * 30,
                                  ),
                                ],
                              )
                            : Container(),
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
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => SlotConfirm()));

                        if (_title.text.isEmpty) {
                          const snackBar = SnackBar(
                            content: Text("Enter Title"),
                            backgroundColor: text6,
                            duration: Duration(milliseconds: 2000),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (collage.isEmpty) {
                          const snackBar = SnackBar(
                            content: Text("Enter Company Name"),
                            backgroundColor: text6,
                            duration: Duration(milliseconds: 2000),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          EasyLoading.show();
                          onSubmit(isCheckbox);
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
                )
              ],
            ),
          ),
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
          controller: _title,
          autofocus: true,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: white(context).withOpacity(0.5),
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

  Widget fieldss(String title, String name) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    ScrollController scrollController = ScrollController();
    CompanyApi comapnyApi = CompanyApi();
    var search;

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
        Visibility(
          visible: isVisible,
          child: TextField(
            onChanged: (value) {
              collage = value;
            },
            autofocus: false,
            style:
                TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
            decoration: InputDecoration(
              filled: true,
              fillColor: white(context).withOpacity(0.5),
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
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Visibility(
            visible: isVisiblebtn,
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
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      search = value;
                                      comapnyApi.getUniList(search);
                                    });
                                  },
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: _widthScale * 15.0,
                                      color: black(context)),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: white(context).withOpacity(0.5),
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
                                      borderRadius: BorderRadius.circular(
                                          _widthScale * 6),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: textFieldColor(context),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          _widthScale * 6),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 400,
                                  width: MediaQuery.of(context).size.width,
                                  child: FutureBuilder(
                                    future: comapnyApi.getUniList(search),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (snapshot.hasData) {
                                        var data = snapshot.data;
                                        if (data.suggestions.length == 0) {
                                          return Center(
                                            child: search.toString().isEmpty ||
                                                    search == null
                                                ? Text(
                                                    "Serach your company name")
                                                : Text("Not Found"),
                                          );
                                        }
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: data.suggestions.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      collage = data
                                                          .suggestions[index];
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 20.0,
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(data
                                                        .suggestions[index]),
                                                  ));
                                            });
                                      }
                                      print("RR $collage");

                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 50.0),
                                        child: const Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          )),
                        );
                      });
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      "$collage",
                      textAlign: TextAlign.left,
                    ),
                  ),
                )),
          ),
        ),
        Row(
          children: [
            Checkbox(
              activeColor: Color.fromARGB(255, 17, 199, 255),
              checkColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onChanged: (bool? value) {
                setState(() {
                  checkSchool = !checkSchool;
                  isVisible = !isVisible;
                  isVisiblebtn = !isVisiblebtn;
                });
              },
              value: checkSchool,
            ),
            Text(
              "Can't find comapny name",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: _widthScale * 16,
                      color: text12.withOpacity(0.8))),
            ),
          ],
        ),
      ],
    );
  }

  List itemsYearstart = [
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
    '1999',
    '1998',
    '1997',
    '1996',
    '1995',
    '1994',
    '1993',
    '1992',
    '1991',
    '1990',
    '1989',
    '1988',
    '1987',
    '1986',
    '1985',
    '1984',
    '1983',
    '1982',
    '1981',
    '1980',
    '1979',
    '1978',
    '1977',
    '1976',
    '1975',
    '1974',
    '1973',
    '1972',
    '1971',
    '1970',
    '1969',
    '1968',
    '1967',
    '1966',
    '1965',
    '1964',
    '1963',
    '1962',
    '1961',
    '1960',
    '1959',
    '1958',
    '1957',
    '1956',
    '1955',
    '1954',
    '1953',
    '1952',
    '1951',
    '1950',
  ];

  List itemsYearend = [
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
    '1999',
    '1998',
    '1997',
    '1996',
    '1995',
    '1994',
    '1993',
    '1992',
    '1991',
    '1990',
    '1989',
    '1988',
    '1987',
    '1986',
    '1985',
    '1984',
    '1983',
    '1982',
    '1981',
    '1980',
    '1979',
    '1978',
    '1977',
    '1976',
    '1975',
    '1974',
    '1973',
    '1972',
    '1971',
    '1970',
    '1969',
    '1968',
    '1967',
    '1966',
    '1965',
    '1964',
    '1963',
    '1962',
    '1961',
    '1960',
    '1959',
    '1958',
    '1957',
    '1956',
    '1955',
    '1954',
    '1953',
    '1952',
    '1951',
    '1950',
  ];
}
