/**
 * This makes a page that allows the user to choose between Student Mode and Admin Mode
 * 
 * @author: Tricia Tan
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/FAQUI.dart';
import 'package:flutter_app/MapAndStatisticsUI.dart';
import 'package:flutter_app/screens/login_success/login_success_screen.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

// This is the best practice
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Spacer();

    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Image.asset(
          "Assets/images/logo.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.1),
        Padding(padding: new EdgeInsets.all(1.0)),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          height: SizeConfig.screenHeight * 0.07,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              "Student",
              style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Align(
          alignment: Alignment.bottomCenter,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          height: SizeConfig.screenHeight * 0.07,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              "Admin",
              style: GoogleFonts.openSans(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
      ],
    );
  }
}
