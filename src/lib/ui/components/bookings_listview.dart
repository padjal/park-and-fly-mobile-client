import 'package:flutter/cupertino.dart';
import 'package:park_and_fly/ui/components/booking_card.dart';

import '../../models/booking.dart';

class BookingsListView extends StatelessWidget {
  const BookingsListView({super.key, required this.bookings});

  final List<Booking> bookings;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (BuildContext context, int index) {
        return BookingCard(booking: bookings[index]);
      },
    );
  }
}