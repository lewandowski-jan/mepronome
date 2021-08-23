import 'package:flutter/material.dart';

class AppColors {
  static const PrimaryLight = Color(0xFFF1F7FF);
  static const PrimaryAccent = Color(0xFF3292EB);
  static const PrimaryDark = Color(0xFF0E2031);
  static const GradientDark = Color(0xFF2569A8);
  static const gradientPrimaryAccentGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.4,
      1,
    ],
    colors: [
      AppColors.PrimaryAccent,
      AppColors.GradientDark,
    ],
  );
  static const gradientPrimaryDarkGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.4,
      1,
    ],
    colors: [
      AppColors.PrimaryDark,
      AppColors.GradientDark,
    ],
  );
}
