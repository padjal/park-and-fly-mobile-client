import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About app'),
      ),
      body: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(text: 'About our app')
          ]
        ),
      ),
    );
  }
}
