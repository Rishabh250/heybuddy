import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heybuddy/Screens/setting.dart';
import 'package:heybuddy/api/signup_api.dart';
import 'package:heybuddy/api/upi.dart';
import 'package:heybuddy/color&font/colors.dart';

class BankDetails extends StatefulWidget {
  // const BankDetails({Key? key}) : super(key: key);
  var id;
  BankDetails({required this.id});
  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  TextEditingController _cont = TextEditingController();
  var output;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cont.text = widget.id; //output['data']['upiid'];
  }

  var tkn = datam.read('f');
  id() async {
    if (_cont.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter your UPI Id"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (!_cont.text.contains('@')) {
      const snackBar = SnackBar(
        content: Text("Enter your valid upi id"),
        duration: Duration(milliseconds: 2000),
        backgroundColor: text6,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      output = await Upi.choice(_cont.text, tkn);
      Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Setting()));
    }
    // return output;
  }
// submit(){

// }
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;
    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );

    Widget spacevert1 = SizedBox(
      height: size.height * 0.08,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar(context),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: black(context),
          ),
        ),
        title: Text(
          "Bank Details",
          style: GoogleFonts.poppins(
              color: black(context), fontSize: _widthScale * 18),
        ),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: _widthScale * 10.0),
              child: TextButton(
                onPressed: () {
                  id();
                },
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(
                      color: black(context), fontSize: _widthScale * 16),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _widthScale * 30),
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 54,
              ),
              fields("Enter Your UPI Id", "q123@ybl", _cont),
            ],
          ),
        ),
      ),
    );
  }

  Widget fields(String title, String name, TextEditingController cont) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: text2(context),
                    fontSize: _widthScale * 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 20,
        ),
        TextField(
          controller: cont,
          autofocus: false,
          style: TextStyle(fontSize: _widthScale * 15.0, color: black(context)),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor(context),
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
        SizedBox(
          height: _heightScale * 20,
        ),
      ],
    );
  }
}
