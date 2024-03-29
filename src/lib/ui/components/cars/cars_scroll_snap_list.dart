import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:park_and_fly/ui/components/car_card.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../../models/car.dart';

class CarsScrollSnapList extends HookConsumerWidget{
  CarsScrollSnapList({super.key, required this.cars, required this.focusedIndex});

  final List<Car> cars;
  ValueNotifier<int> focusedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: ScrollSnapList(
        onItemFocus: (index) {focusedIndex.value = index;
          log(index.toString());
          },
        itemSize: 220,
        duration: 100,
        // itemBuilder: (BuildContext context, int index) => CarCard(car: cars[index]) ,
        itemBuilder: _buildListItem ,
        itemCount: cars.length,
        reverse: false,
        dynamicItemSize: true,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    //horizontal
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              color: Colors.black12
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cars[index].carNumber, style: TextStyle(fontSize: 25),),
                Text(cars[index].type, style: TextStyle(color: Colors.black26)),
                Text(cars[index].color, style: TextStyle(fontSize: 20)),
              ],
            ),
          )
        ],
      ),
    );

    //return CarCard(cars[index)
  }
}