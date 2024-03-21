import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:src/ui/components/scaffold_with_nested_navigation.dart';
import 'package:src/utils/router_config.dart';

class MainView extends ConsumerWidget {
  MainView({super.key});

  int currentIndex = 0;

  final List<NavigationDestination> destinations = const [
    NavigationDestination(
        icon: Icon(Icons.home),
        selectedIcon: Icon(Icons.home_outlined),
        label: 'Home'),
    NavigationDestination(
        icon: Icon(Icons.person),
        selectedIcon: Icon(Icons.person_outline),
        label: 'Profile')
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: destinations,
      ),
    );
  }
}
