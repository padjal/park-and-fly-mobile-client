import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/parking.dart';

class ParkingCard extends StatelessWidget {
  const ParkingCard({
    super.key,
    required this.parking
  });

  final Parking parking;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.local_parking),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(parking.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                    Text(parking.address)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Icon(Icons.directions_walk),
                    Text('2km'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    // Text('Rate', style: TextStyle(fontSize: 10)),
                    Text('15', style: TextStyle(fontSize: 18),),
                    Text('EUR/day', style: TextStyle(fontSize: 10)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        context.go('/parkings/${parking.id}');
      },
    );
  }

}