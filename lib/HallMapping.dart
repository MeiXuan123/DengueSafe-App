/**
 * this class stores the hall names and their latitude/longitude locations
 * 
 * @author: Aratrika Pal
 * 
 */

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HallMapping {
  static Map<int, String> hallMap = {
    1: 'Crescent Hall',
    2: 'Binjai Hall',
    3: 'Graduate Hall 2',
    4: 'Hall 5',
    5: 'Hall 6',
    6: 'Hall 3',
    7: 'Hall 4',
    8: 'Hall 1',
    9: 'Hall 2',
    10: 'Hall 9',
    11: 'Tanjong Hall',
    12: 'Hall 7',
    13: 'Hall 8',
    14: 'Hall 14',
    15: 'Hall 15',
    16: 'Hall 12',
    17: 'Hall 13',
    18: 'Hall 16',
    19: 'Tamarind Hall',
    20: 'Saraca Hall',
    21: 'Hall 10',
    22: 'Meranti Hall',
    23: 'Hall 11',
    24: 'Banyan Hall',
    25: 'Pioneer Hall',
    26: 'Graduate Hall 1'
  };
  static final List<LatLng> markerLocations = [
    LatLng(1.3463, 103.6868), //locationofhallCrescent
    LatLng(1.3544, 103.6877), //locationofhallBinjai
    LatLng(1.3555, 103.6858), //locationofhallGraduateHall2
    LatLng(1.3444, 103.6873), //locationofhall5
    LatLng(1.3479, 103.6871), //locationofhall6
    LatLng(1.3505, 103.6820), //locationofhall3
    LatLng(1.3441, 103.6856), //locationofhall4
    LatLng(1.3450, 103.6872), //locationofhall1
    LatLng(1.3479, 103.6862), //locationofhall2
    LatLng(1.3544, 103.6859), //locationofhall9
    LatLng(1.3541, 103.6880), //locationofhallTanjong
    LatLng(1.3408, 103.6805), //locationofhall7
    LatLng(1.3505, 103.6847), //locationofhall8
    LatLng(1.3530, 103.6818), //locationofhall14
    LatLng(11.3533, 103.6828), //locationofhall15
    LatLng(1.3515, 103.6805), //locationofhall12
    LatLng(1.3519, 103.6810), //locationofhall13
    LatLng(1.3504, 103.6811), //locationofhall16
    LatLng(1.3549, 103.6849), //locationofhallTamarind
    LatLng(1.3552, 103.6850), //locationofhallSaracca
    LatLng(1.3543, 103.6857), //locationofhall10
    LatLng(1.3548, 103.6846), //locationofhallMeranti
    LatLng(1.3548, 103.6860), //locationofhall11
    LatLng(1.3542, 103.6884), //locationofhallBanyan
    LatLng(1.3460, 103.6888), //locationofhallPioneer
    LatLng(11.3555, 103.6868), //locationofhallGraduateHall1
  ];
  static Map getHallMap() {
    return hallMap;
  }

  static List getLocation() {
    return markerLocations;
  }
}
