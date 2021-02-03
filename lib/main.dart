/**
 * This is for the Student User's home page
 * 
 * @author: Aratrika Pal, Loh Xinyi, Ong Liwen
 * 
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/CreateMarker.dart';
import 'package:flutter_app/FAQUI.dart';
import 'package:flutter_app/MapAndStatisticsUI.dart';
import 'package:flutter_app/GetCasesData.dart';
import 'package:flutter_app/CreateMarker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/LineChart.dart';
import 'package:flutter_app/HallMapping.dart';
import 'package:flutter_app/SGMap.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Notification.dart';

var cases = [];
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalCases = 0;
  int newCases = 0;
  Map<int, String> hallNo = HallMapping.getHallMap();
  String alertMessage = "No Red Alert Areas! Enjoy exploring";
  void getActiveCases() async {
    cases = await GetCasesData().getData();
    var sum = 0;
    List halls = [];
    var todaySum = 0;
    for (int i = 0; i < cases.length; i++) {
      if (i % 2 == 0) {
        sum += cases[i];
        if (cases[i] >= 16) halls.add(hallNo[(i / 2).round() + 1]);
      } else
        todaySum += cases[i];
    }
    totalCases = sum;
    newCases = todaySum;
    if (halls.length != 0) {
      String alertCreated = "";
      int i;
      for (i = 0; i < halls.length; i++) alertCreated += halls[i] + ", ";
      if (i == 1)
        alertMessage = alertCreated + "is a Red Alert Area! Be Aware.";
      else
        alertMessage = alertCreated + "are Red Alert Areas! Be Aware.";
    } else
      alertMessage = "No Red Alert Areas! Enjoy exploring";

    setState(() {});
    print(totalCases);
    print(halls);
  }

  Future navigateToSubPage(context, func) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => func));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.openSansCondensed(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
        child: Column(
          children: [
            SizedBox(
                height: 125.0,
                child: Image.network(
                    'https://web.hss.ntu.edu.sg/gaOresearchteam/images/ntu_logo.jpg')),
            SizedBox(height: 15.0),
            Center(
              child: Text('~  DengueSafe  ~',
                  style: GoogleFonts.openSansCondensed(
                    fontSize: 27.0,
                    color: Colors.black,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 7.0),
            Center(
              child: Text('Stay Safe, Stay Healthy.',
                  style: GoogleFonts.openSansCondensed(
                    fontSize: 21.0,
                    color: Colors.black,
                    letterSpacing: 1.0,
                  )),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(192, 192, 192, 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text('''ACTIVE
CASES''',
                        style: GoogleFonts.openSansCondensed(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    child: Text(
                      "$totalCases",
                      style: GoogleFonts.openSansCondensed(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                      height: 60,
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 5.0,
                      )),
                  SizedBox(width: 14.0),
                  Container(
                      child: Text('''CASES
TODAY''',
                          style: GoogleFonts.openSansCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.black,
                          ))),
                  SizedBox(width: 18.0),
                  Container(
                    child: Text(
                      "$newCases",
                      style: GoogleFonts.openSansCondensed(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(children: <Widget>[
              SizedBox(width: 10.0),
              Icon(Icons.info),
              SizedBox(width: 20.0),
              Container(
                child: Flexible(
                    child: Text(alertMessage,
                        style: GoogleFonts.openSansCondensed(
                            letterSpacing: 1.0,
                            color: Colors.black,
                            fontSize: 19.0))),
              ),
            ]),
            SizedBox(height: 15.0),
            Container(
              child: Column(children: <Widget>[
                GridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  primary: true,
                  crossAxisCount: 3,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(192, 192, 192, 0.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 58.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Text('NTU Hotspot',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black,
                                    fontSize: 12,)
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        navigateToSubPage(context, MapAndStatisticsUI());
                      },
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(192, 192, 192, 0.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.equalizer,
                                color: Colors.black,
                                size: 60.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text('SG Stats',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        showNotification(context);
                      },
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(192, 192, 192, 0.4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.question_answer,
                                color: Color.fromRGBO(66, 103, 178, 1),
                                size: 60.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text('FAQ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        navigateToSubPage(context, FAQUI());
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade600,
                )
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getActiveCases();
        },
        backgroundColor: Color.fromRGBO(192, 192, 192, 1),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
