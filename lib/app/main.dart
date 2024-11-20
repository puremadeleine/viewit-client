import 'package:flutter/material.dart';
import 'package:viewith/app/route/app_router.dart';
import 'package:viewith/ui/app_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        appBarTheme: AppBarTheme(backgroundColor: AppDesign.colors.white),
        scaffoldBackgroundColor: AppDesign.colors.white,
      ),
      routerConfig: router,
    );
  }
}
