import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:park_and_fly/data/repositories/car_repository.dart';
import 'package:park_and_fly/providers/cars_provider.dart';
import 'package:park_and_fly/ui/components/cars/cars_listview.dart';

import '../../models/car.dart';

class ProfileView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cars = ref.watch(carsProvider);

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
            cars.when(data: (carsData) => CarsListView(cars: carsData, isAddCarButtonEnabled: true,), error: (object, stacktrace) => Text('${stacktrace.toString()}'), loading: () => Center(
              child: CircularProgressIndicator(),
            )),
            //CarsListView(cars: cars)
          ],
        ),
      ),
    );
  }
}
