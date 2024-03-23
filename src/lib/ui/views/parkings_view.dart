import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:park_and_fly/ui/components/parking_card.dart';

class ParkingsView extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parkings'),
      ),
      body: ListView(
        children: [
          ParkingCard(name: "Sofia airport 1", address: "bul. Valchi dol #34"),
          ParkingCard(name: "Sofia airport 2", address: "bul. Valchi dol #34"),
          ParkingCard(name: "Sofia airport 3", address: "bul. Bulgaria #34"),
          ParkingCard(name: "Sofia airport 4", address: "bul. Arh. Frank Loyd Rait #3B"),
          ParkingCard(name: "Sofia airport 5", address: "bul. Valchi dol #34"),
          ParkingCard(name: "Sofia airport 1", address: "bul. Valchi dol #34"),
          ParkingCard(name: "Sofia airport 2", address: "bul. Valchi dol #34"),
          ParkingCard(name: "Sofia airport 3", address: "bul. Bulgaria #34"),
          ParkingCard(name: "Sofia airport 4", address: "bul. Arh. Frank Loyd Rait #3B"),
          ParkingCard(name: "Sofia airport 5", address: "bul. Valchi dol #34"),
        ],
      ),
    );
  }

}