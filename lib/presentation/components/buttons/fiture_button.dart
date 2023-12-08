import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class FitureButton extends StatelessWidget {
  const FitureButton({super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF7F7F7),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Image.asset(
              image,
              height: 80,
              width: 80,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              height: 1,
              color: AppColors.textWhite,
            ),
          ),
        ],
      ),
    );
  }
}
