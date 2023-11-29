import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class LayananItemCard extends StatelessWidget {
  final String namaLayanan;
  final String hargaLayanan;

  const LayananItemCard({
    Key? key,
    required this.namaLayanan,
    required this.hargaLayanan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.15),
            offset: const Offset(0, 1.5),
            blurRadius: 3,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            namaLayanan,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              const Text(
                'Harga : ',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Expanded(
                child: Text(
                  hargaLayanan,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
