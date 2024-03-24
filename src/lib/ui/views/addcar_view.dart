import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddcarView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add car'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Text('Car number'),
            // TextField(
            //
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Car number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Car brand',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Car model',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () => {},
                  child: const Text('Add car'),
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

}