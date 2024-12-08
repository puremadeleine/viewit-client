import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viewith/ui/app_design.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.image,
  });

  final Function() onTap;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final SvgPicture? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: AppDesign.spacing.all16,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(32), // 둥근 모서리
        ),
        child: Stack(
          children: [
            if (image != null)
              Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: image!,
              ),
            Center(
              child: Text(
                text,
                style: AppDesign.typo.body1Bold(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
