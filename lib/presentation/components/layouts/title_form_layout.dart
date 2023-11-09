import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class TitleForm extends StatelessWidget {
  final String title;
  const TitleForm({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
