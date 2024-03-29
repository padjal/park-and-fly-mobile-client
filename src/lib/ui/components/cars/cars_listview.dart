import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:park_and_fly/ui/components/booking_card.dart';

import '../../../models/booking.dart';
import '../../../models/car.dart';
import '../car_card.dart';

class CarsListView extends StatelessWidget {
  const CarsListView({super.key, required this.cars, this.isAddCarButtonEnabled = false});
  final bool isAddCarButtonEnabled;
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: isAddCarButtonEnabled ? cars.length + 1 : cars.length,
        itemBuilder: (BuildContext context, int index) {
          if(index == cars.length){
           return InkWell(
             onTap: () => {
               context.go('/profile/addcar')
             },
             child: Card(
               child:
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Icon(Icons.add, size: 50,),
               ),
             ),
           );
          }

          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
