import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class HeaderPages extends StatelessWidget {
  const HeaderPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.lampungCoa,
          height: 75,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Balai\nLaboratorium\nKesehatan',
          style: TextStyle(
            fontSize: 18,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
