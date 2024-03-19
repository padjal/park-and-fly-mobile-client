import 'package:go_router/go_router.dart';
import 'package:src/views/main_view.dart';
import 'package:src/views/profile_view.dart';

import '../views/login_view.dart';
import '../views/registration_view.dart';

class RouterConfiguration {
  // GoRouter configuration
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegistrationView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => MainView(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileView(),
      ),
    ],
  );
}
