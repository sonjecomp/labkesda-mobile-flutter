import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class StepperButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final String? buttonType;

  StepperButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.buttonType = "next",
  }) : super(key: key);
  final Map<String, Color> colorsButton = {
    "next": AppColors.buttonColor,
    "prev": AppColors.whiteColor,
  };
  final Map<String, Color> colorsText = {
    "next": AppColors.textWhite,
    "prev": AppColors.primary,
  };
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: colorsButton[buttonType]!,
          borderRadius: BorderRadius.circular(100),
        ),
        height: 45,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: colorsText[buttonType]!,
            ),
          ),
        ),
      ),
    );
  }
}
