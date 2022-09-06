import 'package:assessment_task/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle title = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle secondTitle = const TextStyle(
      fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black);

  static TextStyle date = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.notificationsColor);

  static TextStyle coloredTitle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.secondMainColor);

  static TextStyle selectDate = const TextStyle(
      fontSize: 23, fontWeight: FontWeight.w500, color: Colors.black);
}
