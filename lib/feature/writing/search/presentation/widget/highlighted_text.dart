import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String searchQuery;
  final TextStyle? baseStyle;
  final TextStyle? highlightStyle;

  const HighlightedText({
    super.key,
    required this.text,
    required this.searchQuery,
    this.baseStyle,
    this.highlightStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBaseStyle = AppDesign.typo.body1Bold(color: AppDesign.colors.gray900);
    final defaultHighlightStyle = AppDesign.typo.body1Bold(color: AppDesign.colors.red900);

    // searchQuery가 비어있을 때는 전체 텍스트를 기본 스타일로 표시
    if (searchQuery.isEmpty) {
      return RichText(
        text: TextSpan(
          text: text,
          style: baseStyle ?? defaultBaseStyle,
        ),
      );
    }

    final List<TextSpan> spans = [];
    final String lowercaseText = text.toLowerCase();
    final String lowercaseQuery = searchQuery.toLowerCase();
    int currentIndex = 0;

    while (true) {
      final int matchIndex = lowercaseText.indexOf(lowercaseQuery, currentIndex);
      if (matchIndex == -1) {
        // 남은 텍스트도 기본 스타일로 추가
        if (currentIndex < text.length) {
          spans.add(TextSpan(
            text: text.substring(currentIndex),
            style: baseStyle ?? defaultBaseStyle,
          ));
        }
        break;
      }

      // 매치되기 전 텍스트도 기본 스타일로 추가
      if (matchIndex > currentIndex) {
        spans.add(TextSpan(
          text: text.substring(currentIndex, matchIndex),
          style: baseStyle ?? defaultBaseStyle,
        ));
      }

      // 매치된 텍스트는 하이라이트 스타일로 추가
      spans.add(TextSpan(
        text: text.substring(matchIndex, matchIndex + searchQuery.length),
        style: highlightStyle ?? defaultHighlightStyle,
      ));

      currentIndex = matchIndex + searchQuery.length;
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}