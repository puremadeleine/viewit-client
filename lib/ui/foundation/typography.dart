import 'package:flutter/material.dart';

class TypographyTokens {
  // Font sizes
  static const double size12 = 12;
  static const double size14 = 14;
  static const double size16 = 16;
  static const double size24 = 24;
  static const double size32 = 32;

  // Line heights
  static const double heightTight = 1.3;
  static const double heightNormal = 1.4;
  static const double heightRelaxed = 1.5;

  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class AppTypography {
  final TextStyle h1 = const TextStyle(
    fontSize: 24,
    fontWeight: TypographyTokens.extraBold,
    height: 1.4,
    letterSpacing: -0.5,
  );

  final TextStyle h2 = const TextStyle(
    fontSize: 17,
    fontWeight: TypographyTokens.bold,
    height: 1.4,
  );

  final TextStyle body1 = const TextStyle(
    fontSize: 16,
    fontWeight: TypographyTokens.regular,
    height: 1.5,
  );

  final TextStyle body2 = const TextStyle(
    fontSize: 14,
    fontWeight: TypographyTokens.regular,
    height: 1.4,
  );

  final TextStyle body3 = const TextStyle(
    fontSize: 13,
    fontWeight: TypographyTokens.regular,
    height: 1.4,
  );

  final TextStyle body4 = const TextStyle(
    fontSize: 12,
    fontWeight: TypographyTokens.regular,
    height: 1.4,
  );

  final TextStyle body4Bold = const TextStyle(
    fontSize: 12,
    fontWeight: TypographyTokens.bold,
    height: 1.4,
  );
}
