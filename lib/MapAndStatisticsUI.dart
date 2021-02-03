/** 
 * This file creates the page for HotSpot Map
 * 
 * @author Aratrika Pal, Ong Liwen
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/LineChart.dart';
import 'package:flutter_app/GetCasesData.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app/CreateMarker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: MapAndStatisticsUI(),
  ));
}

class MapAndStatisticsUI extends StatefulWidget {
  @override
  _MapAndStatisticsUIState createState() => _MapAndStatisticsUIState();
}

class _MapAndStatisticsUIState extends State<MapAndStatisticsUI> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(1.3483, 103.6831);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
            'Map And Statistics',
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: CreateMarker(),
              /*child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 15),
              ),*/
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: Align(
                alignment: Alignment.topRight,
                child: Tooltip(
                  textStyle: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(192, 192, 192, 0.8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  message:
                      'Legend:\ngreen: 0 cases\nyellow: 1-5 cases \norange: 6-15 cases\nred: more than 15',
                  child: IconButton(
                    onPressed: () {},
                    icon: new Image.asset("Assets/images/help.png"),
                    tooltip:
                        'Legend:\ngreen: 0 cases\nyellow: 1-5 cases \norange: 6-15 cases\nred: more than 15',
                  ),
                ),
              ),
            )
            /*child: Table(
                  border: TableBorder(
                      top: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.4), width: 2),
                      bottom: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 0.4), width: 2),
                      left: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                          style: BorderStyle.solid),
                      verticalInside: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                          style: BorderStyle.solid),
                      right: BorderSide(
                          width: 2,
                          color: Color.fromRGBO(255, 255, 255, 0.4),
                          style: BorderStyle.solid)),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                            child: Image.asset('Assets/Green.png'),
                            height: 30.0),
                      ]),
                      Column(children: [
                        Text(
                          '0 Cases',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                            child: Image.asset('Assets/Yellow.png'),
                            height: 30.0),
                      ]),
                      Column(children: [
                        Text(
                          '1 to 5 Cases',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                            child: Image.asset('Assets/Orange.png'),
                            height: 30.0),
                      ]),
                      Column(children: [
                        Text(
                          '6 to 15 Cases',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                            child: Image.asset('Assets/Red.png'), height: 30.0),
                      ]),
                      Column(children: [
                        Text(
                          'Above 15 cases',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ]),
                    ]),
                  ],
                ))*/
          ],
        ));
  }
}
