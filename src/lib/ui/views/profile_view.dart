import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:park_and_fly/ui/components/cars_listview.dart';

import '../../models/car.dart';

class ProfileView extends ConsumerWidget {
  var cars = [
    Car('CA6754FT', 'red', 'Rav4'),
    Car('CA6754FT', 'red', 'Rav4'),
    Car('CA6754FT', 'red', 'Rav4'),
    Car('CA6754FT', 'red', 'Rav4'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                size: 30.0,
              ),
              onPressed: () => {context.go('/profile/settings')},
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: const FlutterLogo(
                size: 60.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Pavel Dzhalev',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
                alignment: Alignment.center, child: Text('Memeber since 2023'),
            padding: const EdgeInsets.only(bottom: 20),),
            const Text('Cars', style: TextStyle(
              fontSize: 25
            ),),
            CarsListView(cars: cars)
          ],
        ),
      ),
    );
  }
}
