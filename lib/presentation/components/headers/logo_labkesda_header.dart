import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class LogoLabkesdaHeader extends StatelessWidget {
  const LogoLabkesdaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.lampungCoa,
          width: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Balai\nLaboratorium\nKesehatan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            height: 1,
          ),
        )
      ],
    );
  }
}
