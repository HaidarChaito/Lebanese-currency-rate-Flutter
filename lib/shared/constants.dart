import 'package:flutter/material.dart';
import 'package:lirarate/shared/app_colors.dart';

class AppSize {
  static double d8 = 8.0;
  static double d12 = 12.0;
  static double d15 = 15.0;
  static double d20 = 20.0;
  static double d24 = 24.0;
  static double d28 = 28.0;
  static double d30 = 30.0;
  static double d50 = 50.0;
  static double d100 = 100.0;
}

class AppTextStyles {
  static TextStyle kMainTextStyleWhite = TextStyle(
    fontSize: AppSize.d20,
    color: AppColors.kPrimaryWhite,
  );
  static TextStyle kCurrentTime = TextStyle(
      fontSize: AppSize.d15,
      color: AppColors.kCurrentTime,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5);
  static TextStyle kMainTextStyleBlue = TextStyle(
    fontSize: AppSize.d24,
    color: AppColors.kPrimaryBlue,
  );
  static TextStyle kAppBarTitle = TextStyle(
    fontSize: AppSize.d28,
    color: AppColors.kPrimaryWhite,
  );
  static TextStyle kFuelListStyle = TextStyle(
      fontSize: AppSize.d20,
      color: AppColors.kPrimaryBlue,
      fontWeight: FontWeight.bold);
}
