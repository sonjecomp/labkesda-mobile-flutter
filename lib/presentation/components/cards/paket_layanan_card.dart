import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/paket_content/paket_models.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PaketLayananCard extends HookConsumerWidget {
  const PaketLayananCard({super.key, required this.detailPaket});
  final PaketModels detailPaket;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          AppStyle.boxShadow,
        ],
      ),
      clipBehavior: Clip.antiAlias,
      width: 100,
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: const BoxDecoration(
                color: AppColors.secondary,
              ),
              child: Text(
                detailPaket.title,
                maxLines: 3,
                style: const TextStyle(
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.yellowCyanColor,
            ),
            child: Text(
              NumberFormat.currency(
                locale: 'id_ID',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(detailPaket.price),
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.textBrown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
