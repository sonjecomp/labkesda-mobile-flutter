import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class DirectButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isDisabled;

  const DirectButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isDisabled ? AppColors.textGrey : AppColors.buttonColor,
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
