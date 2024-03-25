import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:park_and_fly/data/repositories/car_repository.dart';
import 'package:park_and_fly/models/car.dart';

class AddcarView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carsRepository = ref.watch(carsRepositoryProvider);
    var car = useState<Car>(Car('', '', ''));

    return Scaffold(
      appBar: AppBar(
        title: Text('Add car'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Text('Car number'),
            // TextField(
            //
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  car.value.carNumber = value;
                },
                validator: (text) {
                  log(text!);
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: 'Car number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  car.value.type = value;
                },
                validator: (text) {
                  log(text!);
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: 'Car brand',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  car.value.color = value;
                },
                validator: (text) {
                  log(text!);
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: 'Car color',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: ElevatedButton(
                onPressed: () async {
                  if(car.value.type == null || car.value.type.isEmpty||
                      car.value.carNumber == null || car.value.carNumber.isEmpty ||
                      car.value.color == null || car.value.color.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in the car details')));
                    return;
                  }

                  var result = await carsRepository.addCar(car.value);

                  if(result){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Car added successfully')));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not add car')));
                  }
                },
                child: const Text('Add car'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
