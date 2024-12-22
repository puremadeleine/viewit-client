import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';

import '../gen/assets.gen.dart';

class VISearchBar extends StatefulWidget {
  const VISearchBar({super.key, this.controller, required this.hintText, this.onChanged,});

  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;

  @override
  State<VISearchBar> createState() => _VISearchBarState();
}

class _VISearchBarState extends State<VISearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppDesign.typo.body1(
          color: AppDesign.colors.gray600,
        ),
      ),
      onChanged: (text) => widget.onChanged?.call(text),
    );
  }

  Widget? _buildClearButton() {
    final controller = widget.controller;
    if (controller != null && controller.text.isNotEmpty) {
      return Assets.images.dellFillLight.svg(width: 12, height: 12);
    }
    return null;
  }
}
