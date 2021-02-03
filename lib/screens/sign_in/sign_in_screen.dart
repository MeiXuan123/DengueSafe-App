import 'package:flutter/material.dart';
import 'package:flutter_app/reportcases.dart';
import 'components/body.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Login",
          style: GoogleFonts.openSansCondensed(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
        ),),centerTitle: true,
      ),
      body: Body(),
    );
  }
}
