import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: destinations,
        onDestinationSelected: (index) {
          switch(index){
            case 1:
              context.go('/profile');
              break;
            default:
              context.go('/main');
          }
        },
      ),
    );
  }
}
