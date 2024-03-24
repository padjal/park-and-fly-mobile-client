import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:park_and_fly/models/car.dart';

abstract class CarRepository{
  Future<List<Car>> getCars();
  Future<bool> addCar(Car car);
}

class CarRepositoryImpl implements CarRepository{
  final cars = [
    Car('CA4534HT', 'Red', 'RAV4'),
    Car('CA4534HT', 'Red', 'RAV4'),
    Car('CA4534HT', 'Red', 'RAV4'),
    Car('CA4534HT', 'Red', 'RAV4'),
    Car('CA4534HT', 'Red', 'RAV4'),
  ];

  @override
    Future<List<Car>> getCars() async{
      await Future.delayed(Duration(seconds: 1));

      return cars;
  }

  @override
  Future<bool> addCar(Car car) async {
    await Future.delayed(const Duration(seconds: 1));

    cars.add(car);

    return true;
  }

}

final carsRepositoryProvider = Provider<CarRepository>((ref) => CarRepositoryImpl());