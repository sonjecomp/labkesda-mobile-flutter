import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/constants/doubles.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // contoh pake assets
            Image.asset(
              AppAssets.logo,
            ),

            // contoh pake color
            Container(
              color: AppColors.primary,
              child: const Text("ini contoh color"),
            ),

            // contoh pake double
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(AppDoubles.paddingInside),
            ),
          ],
        ),
      ),
    );
  }
}
