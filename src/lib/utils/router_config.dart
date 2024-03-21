import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ui/components/scaffold_with_nested_navigation.dart';
import '../ui/views/login_view.dart';
import '../ui/views/main_view.dart';
import '../ui/views/parkings_view.dart';
import '../ui/views/profile_view.dart';
import '../ui/views/registration_view.dart';
import '../ui/views/settings_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
        routes: [
          GoRoute(
            path: 'register',
            builder: (context, state) => const RegistrationView(),
          ),
        ]
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return ScaffoldWithNestedNavigation(
              navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              // top route inside branch
              GoRoute(
                path: '/parkings',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: ParkingsView(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              // top route inside branch
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: ProfileView(),
                ),
                routes: [
                  // child route
                  GoRoute(
                    path: 'settings',
                    builder: (context, state) =>
                    SettingsView(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
