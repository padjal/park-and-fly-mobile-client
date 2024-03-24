import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget{
  bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  _CustomListTile(
                      title: "About app",
                      icon: Icons.phone_android,
                      onClick: ()  {
                        log('test');
                        context.go('/profile/settings/about');},
                  ),
                  _CustomListTile(
                      title: "Dark Mode",
                      icon: Icons.nightlight_outlined,
                      trailing:
                      Switch(value: darkThemeEnabled, onChanged: (value) {
                        darkThemeEnabled = value;
                      })),
                  _CustomListTile(
                      title: "Log out",
                      icon: Icons.exit_to_app,
                      onClick: ()  {
                        log('test');
                        context.go('/login');},
                  ),
                ],
              ),
              // const _SingleSection(
              //   title: "Privacy and Security",
              //   children: [
              //     _CustomListTile(
              //         title: "Multiple Users", icon: Icons.person_2),
              //     _CustomListTile(
              //         title: "Lock Screen", icon: Icons.lock),
              //     _CustomListTile(
              //         title: "Display", icon: Icons.light),
              //     _CustomListTile(
              //         title: "Sound and Vibration",
              //         icon: Icons.speaker),
              //     _CustomListTile(
              //         title: "Themes", icon: Icons.brush)
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final Function()? onClick;
  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ListTile(
        title: Text(title),
        leading: Icon(icon),
        trailing: trailing ?? const Icon(Icons.forward, size: 18),
        onTap: onClick,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title.toUpperCase(),
              style:
              Theme.of(context).textTheme.headline3?.copyWith(fontSize: 16),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: children,
            ),
          ),
        ],
    );
  }
}