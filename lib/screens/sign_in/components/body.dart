/**
 * 
 * This is for admin login
 * 
 * @author: Tricia Tan
 */
import 'package:flutter/material.dart';
//import 'package:flutter_app/components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                //Text(
                //"Welcome Back",
                //style: TextStyle(
                //color: Colors.black,
                //fontSize: getProportionateScreenWidth(28),
                //fontWeight: FontWeight.bold,
                //),
                //),
                Text(
                  "Login with your email and password ",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                LoginFormUI(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),

                SizedBox(height: getProportionateScreenHeight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
