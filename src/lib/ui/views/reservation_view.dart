import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/parking.dart';

class ReservationView extends HookConsumerWidget {
  final String? parkingId;

  ReservationView({super.key, this.parkingId});

  final Parking parking =
      Parking(123, 'Parking name', 'address', 'city', 'country', 'phone', 200);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFrom = useState<DateTime>(DateTime.now());
    final dateTo = useState<DateTime>(DateTime.now().add(Duration(days: 3)));
    final timeFrom = useState<TimeOfDay>(TimeOfDay.now());
    final timeTo = useState<TimeOfDay>(TimeOfDay.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Reserve a spot'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${parking.name} ${parkingId}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(
                        parking.address,
                        style: TextStyle(fontSize: 18, color: Colors.black45),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Price per day'),
                      Text('25EUR', style: TextStyle(fontSize: 30))
                    ]

                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('From'),
                      InkWell(
                        onTap: () async {
                          var selectedTime = await _selectTime(context);

                          timeFrom.value = selectedTime as TimeOfDay;
                        },
                        child: Text(_formatTime(timeFrom.value),
                            style: TextStyle(fontSize: 40)),
                      ),
                      InkWell(
                        onTap: () async {
                          var selectedTime = await _selectDate(context);

                          dateFrom.value = selectedTime as DateTime;
                        },
                        child: Text(_formatDate(dateFrom.value),
                            style: TextStyle(fontSize: 25)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.check, size: 50, color: Colors.green,),
                      Text('Available')
                    ],
                  ),
                  Column(
                    children: [
                      Text('To'),
                      InkWell(
                        onTap: () async {
                          var selectedTime = await _selectTime(context);

                          timeTo.value = selectedTime as TimeOfDay;
                        },
                          child: Text(_formatTime(timeTo.value),
                              style: TextStyle(fontSize: 40))),
                      InkWell(
                        onTap: () async {
                          var selectedTime = await _selectDate(context);

                          dateTo.value = selectedTime as DateTime;
                        },
                        child: Text(_formatDate(dateTo.value),
                            style: TextStyle(fontSize: 25)),
                      ),
                    ],

                  ),



                  //DatePickerDialog(firstDate: DateTime.now(), lastDate: DateTime.now()),
                  //TimePickerDialog(initialTime: TimeOfDay.now())
                ],
              ),
            ),
            Row(children: [
              Text('Minimal days stay: '),
              Text('3')
            ],),
            Row(children: [
              Text('Currently selected days: '),
              Text('${dateTo.value.difference(dateFrom.value).inDays}')
            ],),
            Row(children: [
              Text('Price: '),
              Text('${dateTo.value.difference(dateFrom.value).inDays*25} EUR')
            ],),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reservation added successfully')));
                  },
                  child: const Text('Reserve'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _formatDate(DateTime dateTime) {
    return '${dateTime.day}-${dateTime.month}-${dateTime.day}';
  }

  _formatTime(TimeOfDay timeOfDay) {
    return '${timeOfDay.hour}:${timeOfDay.minute}';
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
