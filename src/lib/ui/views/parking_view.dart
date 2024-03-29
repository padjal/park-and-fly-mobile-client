import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/parking.dart';

class ParkingView extends StatelessWidget{
  final String parkingId;

  ParkingView({super.key, required this.parkingId});

  final Parking parking = Parking(123, 'Parking name', 'address', 'city', 'country', 'phone', 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 300.0),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    //borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.asset('assets/images/parking.jpeg', fit: BoxFit.cover,)
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('${parking.name} ${parkingId}', style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25
                ),),
                Text(parking.address, style: TextStyle(
                    fontSize: 18, color: Colors.black45
                ),),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.go('/parkings/reservation/${parkingId}'),
                      child: const Text('Book now'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
                // Column(
                //   children: [
                //     Icon(Icons.check),
                //     Text('Status')
                //   ],
                // )
              ],
            ),
          )
        ],
      )
    );
  }

}