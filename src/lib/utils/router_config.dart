import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:park_and_fly/models/booking.dart';
import 'package:park_and_fly/ui/views/aboutapp_view.dart';
import 'package:park_and_fly/ui/views/addcar_view.dart';
import 'package:park_and_fly/ui/views/booking_details_view.dart';
import 'package:park_and_fly/ui/views/bookings_view.dart';
import 'package:park_and_fly/ui/views/map_view.dart';
import 'package:park_and_fly/ui/views/review_reservation_view.dart';

import '../models/parking.dart';
import '../ui/components/scaffold_with_nested_navigation.dart';
import '../ui/views/login_view.dart';
import '../ui/views/main_view.dart';
import '../ui/views/parking_view.dart';
import '../ui/views/parkings_view.dart';
import '../ui/views/profile_view.dart';
import '../ui/views/registration_view.dart';
import '../ui/views/reservation_view.dart';
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
          ]),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/review',
                builder: (BuildContext context, GoRouterState state) {
                  final reservation = state.extra;
                  return ReservationReviewView(
                    booking: reservation as Booking,
                  );
                },),
              // top route inside branch
              GoRoute(
                  path: '/parkings',
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: MapView(),
                      ),
                  routes: [
                    GoRoute(
                      path: 'list',
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: ParkingsView(),
                      ),
                    ),
                    GoRoute(
                      path: ':id',
                      builder: (BuildContext context, GoRouterState state) {
                        final id = state.pathParameters['id']!;
                        return ParkingView(
                          parkingId: id,
                        );
                      },
                    ),
                    GoRoute(
                      path: 'reservation/:id',
                      builder: (BuildContext context, GoRouterState state) {
                        final id = state.pathParameters['id']!;
                        return ReservationView(
                          parkingId: id,
                        );
                      },
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            routes: [
              // top route inside branch
              GoRoute(
                path: '/bookings',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: BookingsView(),
                ),
                routes:
                  [
                    GoRoute(
                      path: 'details',
                      pageBuilder: (context, state) => NoTransitionPage(
                        child: BookingDetailsView(),
                      ),
                    )
                  ]
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
                    builder: (context, state) => SettingsView(),
                    routes: [
                      GoRoute(path: 'about',
                          pageBuilder: (context, state) => NoTransitionPage(
                            child: AboutAppView(),
                          ),
                        )
                    ]
                  ),
                  GoRoute(
                    path: 'addcar',
                    builder: (context, state) => AddcarView(),
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
