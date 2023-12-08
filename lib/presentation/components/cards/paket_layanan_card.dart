import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/paket_layanan/paket_layanan.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PaketLayananCard extends HookConsumerWidget {
  const PaketLayananCard({super.key, required this.detailPaket});
  final PaketLayanan detailPaket;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.secondary,
        boxShadow: [
          AppStyle.boxShadow,
        ],
      ),
      clipBehavior: Clip.antiAlias,
      width: 150,
      height: 130,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print('Paket Layanan Card Clicked');
          },
          child: Ink(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailPaket.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textWhite,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          detailPaket.sampleJenisDefault ?? 'Paket Layanan',
                          style: const TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
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
                    ).format(
                      num.parse(detailPaket.harga),
                    ),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
