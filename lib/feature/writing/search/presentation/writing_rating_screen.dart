import 'package:flutter/material.dart';

import '../../../../ui/app_design.dart';
import '../../../../ui/widgets/button/vi_button.dart';
import '../../../../ui/widgets/button/vi_button_type.dart';
import '../../../../ui/widgets/vi_slider.dart';

class WritingRatingScreen extends StatelessWidget {
  const WritingRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('이 자리 어떠셨어요?'),
            _buildSubTitle('5점 만점에 몇 점이신가요? 신중한 평가 부탁드려요!'),
            VISlider(onRatingChanged: (double rating) {

            },),
            const Spacer(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Text(text, style: AppDesign.typo.title1());
  }

  Widget _buildSubTitle(String text) {
    return Text(text, style: AppDesign.typo.body2(color: AppDesign.colors.gray600));
  }

  Widget _buildButton() {
    return VIButton(
      onTap: () { },
      type: VIButtonType.primary,
      text: '완료',
    );
  }
}
