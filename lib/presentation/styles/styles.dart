import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class AppStyle {
  const AppStyle._();

  static BoxShadow boxShadow = const BoxShadow(
    blurRadius: 10,
    color: AppColors.shdadowColor,
    offset: Offset(0, 4),
  );
  static TextStyle titleAppBar = const TextStyle(
    fontSize: 20,
    color: Color(0xFF093545),
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleFeature = const TextStyle(
    fontSize: 18,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle contentText = const TextStyle(
    fontSize: 10,
    color: AppColors.textWhite,
    fontWeight: FontWeight.normal,
  );
  static TextStyle contentDescTextTitle = const TextStyle(
    fontSize: 16,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );
  static TextStyle contentDescText = const TextStyle(
    fontSize: 12,
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
  );
  static TextStyle inputLabel = const TextStyle(
    fontSize: 12,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cellsStyle = const TextStyle(
    fontSize: 10,
    color: AppColors.textWhite,
    fontWeight: FontWeight.w500,
  );
  static BoxDecoration formContainerDecoration = const BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );
  static InputDecoration inputTextFormDecoration(
          {required String hintText, Widget? suffixIcon, Widget? prefixIcon}) =>
      InputDecoration(
        prefixIcon: prefixIcon,
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
        hintStyle: const TextStyle(
          fontSize: 12,
        ),
      );
  static TextStyle contentEmpty = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.shdadowColor,
  );
}
