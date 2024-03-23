import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParkingCard extends StatelessWidget {
  const ParkingCard({
    super.key,
    required this.name,
    required this.address
  });

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),),
                  Text(address)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.local_parking),
          )
        ],
      ),
    );
  }

}