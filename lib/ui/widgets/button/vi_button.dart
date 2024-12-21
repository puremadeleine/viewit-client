import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';
import 'package:viewith/ui/widgets/button/rounded_button.dart';
import 'package:viewith/ui/widgets/button/vi_button_type.dart';

class VIButton extends StatelessWidget {
  const VIButton({super.key, required this.type, required this.text});

  final VIButtonType type;

  Color get _backgroundColor {
    return switch (type) {
      VIButtonType.primary => AppDesign.colors.gray900,
      VIButtonType.kakao => AppDesign.colors.kakao,
      VIButtonType.apple => AppDesign.colors.gray900,
    };
  }

  Color get _textColor {
    return switch (type) {
      VIButtonType.primary => AppDesign.colors.white,
      VIButtonType.kakao => AppDesign.colors.gray900,
      VIButtonType.apple => AppDesign.colors.white,
    };
  }

  final String text;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onTap: () {},
      text: text,
      backgroundColor: _backgroundColor,
      textColor: _textColor,
    );
  }
}
