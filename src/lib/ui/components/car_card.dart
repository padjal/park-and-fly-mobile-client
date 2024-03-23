import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/car.dart';

class CarCard extends StatelessWidget{
  const CarCard({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.two_wheeler_outlined, size: 50,),
              Text(car.carNumber, style: TextStyle(
                fontSize: 20
              ),),
              Text(car.type)
            ],
          ),
        ),
    );
  }
}