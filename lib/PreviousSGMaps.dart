/**
 * This shows the cases on the maps of singapore for the past 4 weeks
 * 
 * @author: Nikita Bachhas
 * 
 */
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PreviousMaps extends StatefulWidget {
  @override
  _PreviousMapsState createState() => _PreviousMapsState();
}

class _PreviousMapsState extends State<PreviousMaps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Previous week Cases',
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: MediaQuery.of(context).size.height * 0.90,
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: Card(
                      child: Wrap(children: <Widget>[
                    Image.asset(
                      'Assets/images/1WeekAgo.png',
                    ),
                    ListTile(
                      title: Text(
                        "Cases one week ago",
                        style: GoogleFonts.openSansCondensed(
                          fontSize: 19.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]))),
              SizedBox(height: 3.0),
              Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                      child: Wrap(children: <Widget>[
                    Image.asset('Assets/images/2WeekAgo.png'),
                    ListTile(
                      title: Text("Cases two weeks ago",
                          style: GoogleFonts.openSansCondensed(
                            fontSize: 19.0,
                            color: Colors.black,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ]))),
              SizedBox(height: 3.0),
              Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                      child: Wrap(children: <Widget>[
                    Image.asset('Assets/images/3WeekAgo.png'),
                    ListTile(
                      title: Text("Cases three weeks ago",
                          style: GoogleFonts.openSansCondensed(
                            fontSize: 19.0,
                            color: Colors.black,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ]))),
              SizedBox(height: 3.0),
              Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: Card(
                      child: Wrap(children: <Widget>[
                    Image.asset('Assets/images/4WeekAgo.png'),
                    ListTile(
                      title: Text("Cases four weeks ago",
                          style: GoogleFonts.openSansCondensed(
                            fontSize: 19.0,
                            color: Colors.black,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ]))),
              SizedBox(height: 3.0),
            ])));
  }
}
