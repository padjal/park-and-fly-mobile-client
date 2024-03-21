import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                size: 30.0,
              ),
              onPressed: () => {context.go('/profile/settings')},
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: FlutterLogo(
              size: 60.0,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Pavel Dzhalev',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
              alignment: Alignment.center, child: Text('Memeber since 2023'))
        ],
      ),
    );
  }
}
