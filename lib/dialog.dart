/**
 * This class is used to add a dialog on the Admin Report Cases page
 * 
 * @author: Tan Mei Xuan
 * 
 */
import 'package:flutter/material.dart';
import 'reportcases.dart';
import 'package:flutter_app/screens/Admin_login/admin_login.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';

enum DialogAction { add, logout }

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue'),
            ),
            RaisedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashScreen())),
              child: const Text(
                'Logout',
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.add;
  }
}
