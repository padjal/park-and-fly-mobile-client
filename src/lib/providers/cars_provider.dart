import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:park_and_fly/data/repositories/car_repository.dart';

import '../models/car.dart';

// class CarsProvider with ChangeNotifier{
//   final CarRepository _carRepository;
//
//   CarsProvider(this._carRepository);
//
//   List<Car> _cars = [];
//
//   List<Car> get cars => _cars;
//
//   Future<void> fetchCars() async {
//     _cars = await _carRepository.getCars();
//     notifyListeners();
//   }
// }

final carsProvider = FutureProvider<List<Car>>((ref) async {
  return ref.read(carsRepositoryProvider).getCars();
});