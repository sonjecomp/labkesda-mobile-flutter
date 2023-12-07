import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/paket_content/paket_models.dart';

class PaketLayananCard extends HookConsumerWidget {
  const PaketLayananCard({
    super.key,
    required this.detailPaket,
  });
  final PaketModels detailPaket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(detailPaket.price);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      width: 160,
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                detailPaket.title,
                maxLines: 2,
                style: const TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  price,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(
            height: 26,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push(
                  '/daftar-layanan/detail-paket-pemeriksaan',
                  extra: detailPaket,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellowCyanColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 0,
                ),
                elevation: 0,
              ),
              child: const Text(
                'Detail',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.textBrown,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
