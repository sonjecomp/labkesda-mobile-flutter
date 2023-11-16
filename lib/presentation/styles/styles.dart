import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class AppStyle {
  const AppStyle._();

  static BoxShadow boxShadow = const BoxShadow(
    color: AppColors.shdadowColor,
    blurRadius: 10,
    offset: Offset(0, 4),
  );
  static TextStyle titleAppBar = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xFF093545),
  );
  static TextStyle titleFeature = const TextStyle(
    color: AppColors.primary,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle inputLabel = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static BoxDecoration formContainerDecoration = const BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );
  static InputDecoration inputTextFormDecoration({required String hintText, Widget? suffixIcon}) => InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 16,
        ),
        hintText: hintText,
      );
}
