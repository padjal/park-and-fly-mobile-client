import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:park_and_fly/models/booking.dart';
import 'package:intl/intl.dart';

class BookingDetailsView extends StatelessWidget {
  BookingDetailsView({super.key});

  final Booking booking = Booking(
      'HSH2342', 'Parking name', DateTime.now(), DateTime.now(), 'CA4589TH');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.garage_rounded),
                      ),
                      Text(
                        booking.parkingName,
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          booking.bookingId,
                          style: TextStyle(color: Colors.black26),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('From'),
                          Text(
                            _getFormattedTime(booking.from),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(_getFormattedDate(booking.from))
                        ],
                      ),
                      Text(
                        booking.carNumber,
                        style: TextStyle(fontSize: 25),
                      ),
                      Column(
                        children: [
                          Text('To'),
                          Text(
                            _getFormattedTime(booking.from),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(_getFormattedDate(booking.from))
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          )),
          ElevatedButton(onPressed: () {}, child: Text('Cancel'))
        ],
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");

    return dateFormat.format(date);
  }

  String _getFormattedTime(DateTime date) {
    DateFormat dateFormat = DateFormat("HH:mm");

    return dateFormat.format(date);
  }
}
