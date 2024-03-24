import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:park_and_fly/ui/components/parking_card.dart';

import '../../models/parking.dart';

class ParkingsView extends ConsumerWidget {
  var parkings = [
    Parking(1, "Sofia airport 1", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
    Parking(2, "Sofia airport 2", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
    Parking(3, "Sofia airport 3", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
    Parking(4, "Sofia airport 4", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
    Parking(5, "Sofia airport 5", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
    Parking(6, "Sofia airport 6", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
    Parking(7, "Sofia airport 7", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
    Parking(8, "Sofia airport 8", "bul. Vasil Levski #34", "Sofia", "Bulgaria",
        "0893457643", 100),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parkings'),
      ),
      body: ListView.builder(
        itemCount: parkings.length,
        itemBuilder: (BuildContext context, int index) {
          return ParkingCard(parking: parkings[index]);
        },
      ),
    );
  }
}
