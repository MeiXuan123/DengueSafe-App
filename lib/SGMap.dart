/**
 * This page shows the dengue map of the whole of Singapore retrieved from data.gov.sg
 * @author: Pal Aratrika
 * 
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/LineChart.dart';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_app/PreviousSGMaps.dart';
import 'package:google_fonts/google_fonts.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final title;
  WebViewContainer(this.url, this.title);
  @override
  createState() => _WebViewContainerState(this.url, this.title);
}

class _WebViewContainerState extends State<WebViewContainer> {
  Future navigateToSubPage(context, func) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => func));
  }

  var _url;
  var _title;
  final _key = UniqueKey();
  _WebViewContainerState(this._url, this._title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            _title,
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
        body: Column(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.715,
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url,
                  ),
                ),
              ]),
          SizedBox(
            width: 1.0,
          ),
          RaisedButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            onPressed: () {
              navigateToSubPage(context, PreviousMaps());
            },
            icon: Icon(
              Icons.bubble_chart,
              color: Colors.white,
            ),
            label: Text('See Previous',
                style: GoogleFonts.openSansCondensed(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                )),
            color: Color.fromRGBO(192, 192, 192, 0.8),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(192, 192, 192, 0.4),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          SizedBox(
            width: 4.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(192, 192, 192, 0.4),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  navigateToSubPage(context, LineChartPage());
                },
                icon: Icon(
                  Icons.equalizer,
                  color: Colors.white,
                ),
                label: Text('See Trend',
                    style: GoogleFonts.openSansCondensed(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    )),
                color: Color.fromRGBO(192, 192, 192, 0.8),
              ),
            ],
          ),
        ]));
  }
}
