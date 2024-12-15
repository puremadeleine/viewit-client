import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:viewith/app/route/navigation_bar.dart';
import 'package:viewith/feature/auth/presentation/screen/sign_in_screen.dart';
import 'package:viewith/feature/home/presentation/screen/home_screen.dart';
import 'package:viewith/feature/profile/presentation/screen/profile_screen.dart';

final router = GoRouter(
  initialLocation: '/signIn',
  routes: [
    GoRoute(
      path: '/signIn',
      builder: (context, state) => const SignInScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return NavigationBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ])
      ],
    ),
  ],
);
