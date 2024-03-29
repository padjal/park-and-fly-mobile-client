import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:park_and_fly/models/booking.dart';
import 'package:park_and_fly/ui/components/cars/cars_scroll_snap_list.dart';

import '../../models/parking.dart';
import '../../providers/cars_provider.dart';
import '../components/cars/cars_listview.dart';

class ReservationView extends HookConsumerWidget {
  final String? parkingId;

  ReservationView({super.key, this.parkingId});

  final Parking parking =
      Parking(123, 'Parking name', 'address', 'city', 'country', 'phone', 200);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cars = ref.watch(carsProvider);
    final from = useState<DateTime>(DateTime.now());
    final to = useState<DateTime>(DateTime.now().add(Duration(days: 3)));
    final focusedIndex = useState(0);
    final isChecking = useState(false);
    final isAvailable = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reserve a spot'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    const EdgeInsets.only(top: 40.0, left: 15, right: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('From'),
                        InkWell(
                          onTap: () async {
                            var selectedTime = await _selectTime(context);
        
                            isChecking.value = true;
                            await Future.delayed(Duration(seconds: 1));
                            from.value = from.value.copyWith(hour: selectedTime?.hour, minute: selectedTime?.minute);
        
                            if(from.value.difference(to.value).abs() < Duration(days: 3)|| from.value.compareTo(to.value) >= 0){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Minimal stay is three days!'), backgroundColor: Colors.redAccent,));
                              to.value = from.value.add(Duration(days: 3));
                            }
                            isAvailable.value = Random().nextBool();
                            isChecking.value = false;
        
                            // timeFrom.value = selectedTime as TimeOfDay;
                          },
                          child: Text(_formatTime(from.value),
                              style: TextStyle(fontSize: 40)),
                        ),
                        InkWell(
                          onTap: () async {
                            var selectedTime = await _selectDate(context, from.value);
        
                            isChecking.value = true;
                            await Future.delayed(Duration(seconds: 1));
                            from.value = from.value.copyWith(year: selectedTime?.year, month: selectedTime?.month, day: selectedTime?.day);
        
                            if(from.value.difference(to.value).abs() < Duration(days: 3) || from.value.compareTo(to.value) >= 0){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Minimal stay is three days!'), backgroundColor: Colors.redAccent,));
                              to.value = from.value.add(Duration(days: 3));
                            }
                            isAvailable.value = Random().nextBool();
                            isChecking.value = false;
                          },
                          child: Text(_formatDate(from.value),
                              style: TextStyle(fontSize: 25)),
                        ),
                      ],
                    ),
                    !isChecking.value ? Column(
                      children: isAvailable.value ? [
                        Icon(Icons.check, size: 50, color: Colors.green,),
                        Text('Available')
                      ] : [Icon(Icons.not_interested, size: 50, color: Colors.redAccent,),
                        Text('Not\nAvailable', textAlign: TextAlign.center,)],
                    ) : CircularProgressIndicator(),
                    Column(
                      children: [
                        Text('To'),
                        InkWell(
                          onTap: () async {
                            var selectedTime = await _selectTime(context);
        
                            isChecking.value = true;
                            await Future.delayed(Duration(seconds: 1));
                            to.value = to.value.copyWith(hour: selectedTime?.hour, minute: selectedTime?.minute);
        
                            if(from.value.difference(to.value).abs() < Duration(days: 3) || from.value.compareTo(to.value) >= 0){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Minimal stay is three days!'), backgroundColor: Colors.redAccent,));
                              to.value = from.value.add(Duration(days: 3));
                            }
                            isAvailable.value = Random().nextBool();
                            isChecking.value = false;
                          },
                            child: Text(_formatTime(to.value),
                                style: TextStyle(fontSize: 40))),
                        InkWell(
                          onTap: () async {
                            var selectedTime = await _selectDate(context, to.value);
        
                            isChecking.value = true;
                            await Future.delayed(Duration(seconds: 1));
                            to.value = to.value.copyWith(year: selectedTime?.year, month: selectedTime?.month, day: selectedTime?.day);
        
                            if(from.value.difference(to.value).abs() < Duration(days: 3) || from.value.compareTo(to.value) >= 0){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Minimal stay is three days!'), backgroundColor: Colors.redAccent,));
                              to.value = from.value.add(Duration(days: 3));
                            }
                            isAvailable.value = Random().nextBool();
                            isChecking.value = false;
                          },
                          child: Text(_formatDate(to.value),
                              style: TextStyle(fontSize: 25)),
                        ),
                      ],
        
                    ),
        
        
        
                    //DatePickerDialog(firstDate: DateTime.now(), lastDate: DateTime.now()),
                    //TimePickerDialog(initialTime: TimeOfDay.now())
                  ],
                ),
              ),
              cars.when(data: (carsData) => CarsScrollSnapList(cars: carsData, focusedIndex: focusedIndex,), error: (object, stacktrace) => Text('${stacktrace.toString()}'), loading: () => Center(
                child: CircularProgressIndicator(),
              )),
              Row(children: [
                Text('Minimal days stay: '),
                Text('3')
              ],),
              Row(children: [
                Text('Currently selected days: '),
                Text('${to.value.difference(from.value).inDays}')
              ],),
              Row(children: [
                Text('Price: '),
                Text('${to.value.difference(from.value).inDays*25} EUR')
              ],),
              Row(children: [
                Text('Car: '),
                Text('${cars.value![focusedIndex.value].carNumber}')
              ],),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if(!isAvailable.value){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected time is not available'), backgroundColor: Colors.redAccent,));
                        return;
                      }

                      final booking = Booking('bookingId', parkingId!, to.value, from.value, cars.value![focusedIndex.value].carNumber);
                      context.push('/review', extra: booking);
                    },
                    child: const Text('Review'),
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
      ),
    );
  }

  _formatDate(DateTime dateTime) {
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }

  _formatTime(DateTime from) {
    return '${from.hour}:${from.minute}';
  }

  Future<void> checkAvailability() async{

  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime initialDateTime) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDateTime, // Refer step 1
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
