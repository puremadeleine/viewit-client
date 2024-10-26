import 'package:go_router/go_router.dart';
import 'package:viewith/feature/home/presentation/screen/home_screen.dart';
import 'package:viewith/feature/seatmap/presentation/screen/review_list_screen.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/review',
      builder: (context, state) => const ReviewListScreen(),
    ),
  ],
);
