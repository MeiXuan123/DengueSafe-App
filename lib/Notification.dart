/**
 * This shows the alert notification when cases are approaching NTU
 * 
 * @author: Tan Mei Xuan
 * 
 */
import 'package:flutter/material.dart';
import 'reportcases.dart';
import 'package:flutter_app/SGMap.dart';

showNotification(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed: () {
      navigateToSubPage(
          context,
          WebViewContainer(
              'https://data.gov.sg/dataset/dengue-clusters/resource/801ce5ce-fb99-4211-94fe-9d8ca5e182d4/view/07e4bfc9-8675-4534-959f-768be06aeeab',
              'Dengue Cases in SG'));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notification"),
    content: Text(
        "There are increasing in cases around Pioneer. Click 'Continue' to view the Statistics."),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future navigateToSubPage(context, func) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => func));
}
