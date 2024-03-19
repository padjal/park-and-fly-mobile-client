import '../../models/parking.dart';

abstract class ParkingRepository{
  Future<List<Parking>> getParkings();
  Future<Parking> getParking(int id);
}