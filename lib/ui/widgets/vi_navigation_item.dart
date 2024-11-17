import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viewith/ui/app_design.dart';

class VINavigationItem extends StatelessWidget {
  final SvgPicture activeIcon;
  final SvgPicture inactiveIcon;
  final String? title;
  final bool isSelected;

  const VINavigationItem({
    super.key,
    required this.activeIcon,
    required this.inactiveIcon,
    this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final label = title;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isSelected ? activeIcon : inactiveIcon,  // 선택 여부에 따라 다른 아이콘 표시
        if (label != null)
          Text(
            label,
            style: isSelected ? AppDesign.typo.body4Bold() : AppDesign.typo.body4(),
          ),
      ],
    );
  }
}