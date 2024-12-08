import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';
import 'package:viewith/ui/widgets/rounded_button.dart';

import '../../../ui/gen/assets.gen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: Assets.images.appLogo.image(width: 120, height: 120)),
          _buildTitle(),
          const Spacer(),
          _buildSignInWithKakaoButton(),
          _buildStartWithUnauthorizedStatusButton(),
          AppDesign.spacing.h12
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text('viewith', style: AppDesign.typo.title1ExtraBold());
  }

  Widget _buildSignInWithKakaoButton() {
    return Padding(
      padding: AppDesign.spacing.horizontal8,
      child: RoundedButton(
        onTap: () {},
        text: '카카오로 시작하기',
        backgroundColor: AppDesign.colors.kakao,
        image: Assets.images.kakao.svg(),
      ),
    );
  }

  Widget _buildStartWithUnauthorizedStatusButton() {
    return Padding(
      padding: AppDesign.spacing.horizontal8,
      child: RoundedButton(
        onTap: () {},
        text: '로그인 없이 시작하기',
      ),
    );
  }
}
