import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class HeaderPages extends StatelessWidget {
  final Color textColor;
  final MainAxisAlignment mainAxisAlignment;
  const HeaderPages(
      {Key? key,
      this.textColor = AppColors.primary,
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.lampungCoa,
          height: 75,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Balai\nLaboratorium\nKesehatan',
          style: TextStyle(
            fontSize: 18,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
