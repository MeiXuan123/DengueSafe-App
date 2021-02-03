/**
 * This class is used to create markers of green/yellow/orange/red color for each Hall of Residence
 *
 * @author: Nikita Bachhas, Aratrika Pal
 */

import 'package:flutter_app/GetCasesData.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/HallMapping.dart';

class CreateMarker extends StatefulWidget {
  @override
  _CreateMarkerState createState() => _CreateMarkerState();
}

List<int> caseList = [];

class _CreateMarkerState extends State<CreateMarker> {
  List<BitmapDescriptor> pinLocationIcon = new List(26);
  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    //print(case_list);
    _doAsyncStuff();
    print(caseList);
    for (int i = 0; i < pinLocationIcon.length; i++) {
      //print(case_list[i]);
      //print(case_list[i].runtimeType);
      if (caseList[2 * i] < 0) {
        print(
            "Number of cases cannot be negative"); //sanity check, will never be executed
      } else if (caseList[2 * i] == 0) {
        BitmapDescriptor.fromAssetImage(
                ImageConfiguration(devicePixelRatio: 2.5), 'Assets/Green.png')
            .then((onValue) {
          pinLocationIcon[i] = onValue;
        });
      } else if (caseList[2 * i] >= 1 && caseList[2 * i] <= 5) {
        BitmapDescriptor.fromAssetImage(
                ImageConfiguration(devicePixelRatio: 2.5), 'Assets/Yellow.png')
            .then((onValue) {
          pinLocationIcon[i] = onValue;
        });
      } else if (caseList[2 * i] >= 6 && caseList[2 * i] <= 15) {
        BitmapDescriptor.fromAssetImage(
                ImageConfiguration(devicePixelRatio: 2.5), 'Assets/Orange.png')
            .then((onValue) {
          pinLocationIcon[i] = onValue;
        });
      } else if (caseList[2 * i] >= 16) {
        BitmapDescriptor.fromAssetImage(
                ImageConfiguration(devicePixelRatio: 2.5), 'Assets/Red.png')
            .then((onValue) {
          pinLocationIcon[i] = onValue;
        });
      }
    }
  }

  Future<void> _doAsyncStuff() async {
    caseList = await GetCasesData().getData();

    //print(case_list);
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(1.3483, 103.6831);
    final List<LatLng> markerLocations = HallMapping.getLocation();
    final Map<int, String> halls = HallMapping.getHallMap();

    // these are the minimum required values to set
    // the camera position
    CameraPosition initialLocation =
        CameraPosition(zoom: 15, bearing: 30, target: pinPosition);
    return GoogleMap(
        myLocationEnabled: true,
        markers: _markers,
        initialCameraPosition: initialLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            int cases;
            for (int i = 0; i < pinLocationIcon.length; i++) {
              cases = caseList[2 * i];
              _markers.add(Marker(
                markerId: MarkerId(i.toString()),
                position: markerLocations[i],
                icon: pinLocationIcon[i],
                infoWindow: InfoWindow(
                  title: halls[i + 1],
                  snippet: '$cases active cases',
                ),
              ));
            }
            ;
          });
        });
  }
}
