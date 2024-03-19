import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:src/utils/router_config.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Park & Fly",
      theme: ThemeData(),
      routeInformationParser: RouterConfiguration.router.routeInformationParser,
      routerDelegate: RouterConfiguration.router.routerDelegate,
      routeInformationProvider: RouterConfiguration.router.routeInformationProvider,
    );
  }
}
