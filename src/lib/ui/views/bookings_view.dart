import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:park_and_fly/ui/components/bookings_listview.dart';

import '../../models/booking.dart';

class BookingsView extends ConsumerWidget {
  var _upcommingBookings = [
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
  ];

  var _previousBookings = [
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
  ];

  var _cancelledBookings = [
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
    Booking('HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Bookings', textAlign: TextAlign.center,),
              bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.book_outlined),
                text: 'Upcoming',
              ),
              Tab(
                icon: Icon(Icons.access_alarm),
                text: 'Previous',
              ),
              Tab(
                icon: Icon(Icons.cancel_outlined),
                text: 'Cancelled',
              )
            ],
          )),
          body: TabBarView(
            children: [
              BookingsListView(bookings: _upcommingBookings),
              BookingsListView(bookings: _previousBookings),
              BookingsListView(bookings: _cancelledBookings)
            ],
          ),
        ));
  }
}
