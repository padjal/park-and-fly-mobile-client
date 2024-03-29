import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/booking.dart';

class ReservationReviewView extends HookConsumerWidget{

  ReservationReviewView({super.key, required this.booking});

  final Booking booking;
  final leadingTextStyle = TextStyle(fontSize: 20);
  final dataTextStyle = TextStyle(fontSize: 20, color: Colors.black45);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBusy = useState(false);

    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child:  !isBusy.value ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Reservation details', style: TextStyle(fontSize: 30),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Parking:', style: leadingTextStyle,),
                  Text('${booking.parkingName}', style: dataTextStyle,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Car:', style: leadingTextStyle),
                  Text('${booking.carNumber}', style: dataTextStyle)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('From:', style: leadingTextStyle),
                  Text('${booking.from}', style: dataTextStyle)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('To:', style: leadingTextStyle),
                  Text('${booking.to}', style: dataTextStyle)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date:', style: leadingTextStyle),
                  Text('${DateTime.now()}', style: dataTextStyle)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price:', style: leadingTextStyle),
                  Text('125 EUR', style: dataTextStyle)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Minimal stay:', style: leadingTextStyle),
                  Text('3 days', style: dataTextStyle)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      isBusy.value = true;
                      await Future.delayed(Duration(seconds: 1));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment successful'), backgroundColor: Colors.green,));
                      isBusy.value = false;

                      context.go('/parkings');
                    },
                    child: const Text('Pay'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ): CircularProgressIndicator(),
      )
    );
  }

}