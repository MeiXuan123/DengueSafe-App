import 'package:flutter/material.dart';
import 'package:flutter_app/reportcases.dart';


class AdminLoginScreen extends StatelessWidget {
  static String routeName = "/Admin_login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),*/
      body: ReportUI(),
    );
  }
}
