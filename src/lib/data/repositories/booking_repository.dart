import 'package:park_and_fly/models/booking.dart';

abstract class BookingRepository{
  Future<List<Booking>> getBookings();
  Future<Booking> getParking(int id);
  Future<bool> addBooking(Booking booking);
}

class BookingRepositoryImpl implements BookingRepository{
  @override
  Future<bool> addBooking(Booking booking) {
    // TODO: implement addBooking
    throw UnimplementedError();
  }

  @override
  Future<List<Booking>> getBookings() {
    // TODO: implement getBookings
    throw UnimplementedError();
  }

  @override
  Future<Booking> getParking(int id) {
    // TODO: implement getParking
    throw UnimplementedError();
  }
  
}