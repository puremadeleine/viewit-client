import 'package:flutter/material.dart';
import 'package:viewith/feature/writing/search/presentation/widget/highlighted_text.dart';
import 'package:viewith/ui/app_design.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem({super.key, required this.text, required this.subText, required this.query,});

  final String text;
  final String subText;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(text),
        _buildSubTitle(subText),
      ],
    );
  }

  Widget _buildTitle(String text) {
    return HighlightedText(text: text, searchQuery: query);
  }

  Widget _buildSubTitle(String subText) {
    return Text(subText, style: AppDesign.typo.body3(color: AppDesign.colors.gray300),);
  }
}
