import '../../models/parking.dart';

abstract class ParkingRepository{
  Future<List<Parking>> getParkings();
  Future<Parking> getParking(int id);
}

class ParkingRepositoryImp implements ParkingRepository{
  @override
  Future<Parking> getParking(int id) {
    // TODO: implement getParking
    throw UnimplementedError();
  }

  @override
  Future<List<Parking>> getParkings() {
    // TODO: implement getParkings
    throw UnimplementedError();
  }

}