/**
 * This file gets dengue cases data from the database
 * 
 * @author: Aratrika Pal
 * 
 */
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GetCasesData {
  getData() async {
    var value;
    List<int> case_list = [];
    var count;
    var casesToday;
    var now = new DateTime.now();

    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    var snapshot = await databaseReference.once();

    value = snapshot.value;

    value.forEach((k, v) {
      count = 0;
      casesToday = 0;
      print(k);
      print(v);

      v.forEach((k1, v1) {
        var date = new DateTime(int.parse(v1.substring(0, 4)),
            int.parse(v1.substring(5, 7)), int.parse(v1.substring(8, 10)));
        var difference = now.difference(date);
        if (difference.inDays == 0) casesToday += 1;
        if (difference.inDays <= 8) count += 1;
      });
      case_list.add(count);
      case_list.add(casesToday);
    });

    return case_list;
  }
}
