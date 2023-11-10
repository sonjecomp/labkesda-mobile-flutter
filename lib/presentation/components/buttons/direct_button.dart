import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class DirectButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const DirectButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(100),
        ),
        height: 45,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.textWhite,
            ),
          ),
        ),
      ),
    );
  }
}
