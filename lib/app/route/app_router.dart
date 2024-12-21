import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:viewith/app/route/app_route.dart';
import 'package:viewith/app/route/navigation_bar.dart';
import 'package:viewith/feature/auth/presentation/screen/sign_in_screen.dart';
import 'package:viewith/feature/home/presentation/screen/home_screen.dart';
import 'package:viewith/feature/profile/presentation/screen/profile_screen.dart';
import 'package:viewith/feature/seatmap/presentation/screen/review_list_screen.dart';
import 'package:viewith/feature/writing/search/presentation/writing_venues_screen.dart';

final router = GoRouter(
  initialLocation: AppRoute.home.path,
  routes: [
    GoRoute(
      path: AppRoute.signIn.path,
      name: AppRoute.signIn.name,
      builder: (context, state) => const SignInScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return NavigationBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            path: AppRoute.home.path,
            name: AppRoute.home.name,
            builder: (context, state) => const HomeScreen(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: AppRoute.profile.path,
            name: AppRoute.profile.name,
            builder: (context, state) => const ProfileScreen(),
          ),
        ]),
      ],
    ),
    GoRoute(
      path: AppRoute.writingVenues.path,
      name: AppRoute.writingVenues.name,
      builder: (context, state) => const WritingVenuesScreen(),
    ),
    GoRoute(
      path: AppRoute.seatmap.path,
      name: AppRoute.seatmap.name,
      builder: (context, state) => const ReviewListScreen(),
    )
  ],
);
