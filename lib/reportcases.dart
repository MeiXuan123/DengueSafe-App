/**
 * This is used for reporting cases page for the Admin User
 * 
 * @author: Tan Mei Xuan
 * 
 */

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/dialog.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'size_config.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(ReportUI());
}

class ReportUI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReportPage(),
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SplashScreen(),
      },
    );
  }
}

class ReportPage extends StatefulWidget {
  ReportPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String id;
  String hall;
  //String number;
  //String DB_Cases;
  //String DB_Hall;
  //int num_Cases;
  String formattedDate;
  // int time = 1;
  var uuid = Uuid();

  final List<String> hallnames = [
    'Hall 1',
    'Hall 2',
    'Hall 3',
    'Hall 4',
    'Hall 5',
    'Hall 6',
    'Hall 7',
    'Hall 8',
    'Hall 9',
    'Hall 10',
    'Hall 11',
    'Hall 12',
    'Hall 13',
    'Hall 14',
    'Hall 15',
    'Hall 16',
    'Crescent Hall',
    'Pioneer Hall',
    'Binjai Hall',
    'Tanjong Hall',
    'Banyan Hall',
    'Saraca Hall',
    'Tamarind Hall',
    'Meranti Hall',
    'Graduate Hall 1',
    'Graduate Hall 2'
  ];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void createRecord() async {
    final databaseReference = FirebaseDatabase.instance.reference();
    final databaseChild = databaseReference.child(hall);
    databaseChild.once().then((DataSnapshot snapshot) {
      databaseChild.update({
        uuid.v4().toString(): formattedDate, //unique id
      });
    });
  }

  String validateEmployeeID(value) {
    var numValue = int.tryParse(value);
    if (value.isEmpty) {
      return "Employee ID is required";
    } else if (numValue > 15) {
      return "Invalid Employee ID";
    }
  }

  //validator
  String _dropdownError(value) {
    if (value == null) {
      return "Hall location is required";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Report Dengue Cases",
          style: GoogleFonts.openSansCondensed(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: formkey,
            //autovalidateMode: AutovalidateMode.always,
            //auto validating when keying
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "Employee ID",
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 5, right: 0, bottom: 15),
                      // add padding to adjust icon
                      child: Icon(Icons.account_box),
                    ),
                  ),
                  onSaved: (value) => id = value,
                  validator: validateEmployeeID,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        labelText: "Hall Name",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 5, right: 0, bottom: 15),
                          // add padding to adjust icon
                          child: Icon(Icons.home),
                        ),
                      ),
                      items: hallnames.map((hallname) {
                        return DropdownMenuItem(
                          value: hallname,
                          child: Text('$hallname'),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => hall = value),
                      validator: _dropdownError),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.4,
                  height: SizeConfig.screenHeight * 0.07,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () async {
                      if (formkey.currentState.validate()) {
                        formkey.currentState.save();
                        DateTime now = DateTime.now();
                        formattedDate =
                            DateFormat('yyyy-MM-dd – kk:mm').format(now);
                        print(formattedDate);
                        createRecord();
                        final action = await Dialogs.yesAbortDialog(
                            context,
                            'Record has been successfully added!',
                            'Continue adding record or Logout?');
                      }
                    },
                    child: Text(
                      "Add Record",
                      style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
