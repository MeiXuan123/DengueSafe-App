import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),*/
      body: Home(),
    );
  }
}
