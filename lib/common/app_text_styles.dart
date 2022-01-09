import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const medium = TextStyle(
    fontFamily: 'Metropolis',
    color: AppColors.PrimaryAccent,
    fontSize: 20,
  );
  static const h1 = TextStyle(
    fontFamily: 'Metropolis',
    color: AppColors.PrimaryLight,
    fontSize: 60,
  );
  static const p = TextStyle(
    fontFamily: 'Metropolis',
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const blue = TextStyle(
    fontFamily: 'Metropolis',
    color: AppColors.PrimaryAccent,
    fontSize: 25,
    fontWeight: FontWeight.bold
  );
  static const black = TextStyle(
      fontFamily: 'Metropolis',
      color: Colors.black,
      fontSize: 20,
      height: 1.6

  );
}
