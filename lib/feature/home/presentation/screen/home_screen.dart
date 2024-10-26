import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Stack(
        children: [
          _buildTitle('1열 사수 다람쥐님!\n시야를 확인해 보세요.'),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: AppDesign.typo.h1,
    );
  }
}
