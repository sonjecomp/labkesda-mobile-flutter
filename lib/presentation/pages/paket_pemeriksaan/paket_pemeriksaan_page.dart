import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/paket_content/paket_models.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PaketPemeriksaanPage extends HookConsumerWidget {
  const PaketPemeriksaanPage({
    super.key,
    required this.detailPaket,
  });
  final PaketModels detailPaket;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promoStartDate =
        DateFormat.yMMMd('id_ID').format(DateTime.parse(detailPaket.startDate));
    final promoDueDate =
        DateFormat.yMMMd('id_ID').format(DateTime.parse(detailPaket.dueDate));
    final price = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(detailPaket.price);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Detail Paket Layanan',
        forceMaterialTransparency: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.secondary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailPaket.title,
                    style: const TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primary.withOpacity(.3),
                  width: 1,
                ),
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Harga Paket\n',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: price,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Berlaku mulai ',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                    ),
                    children: [
                      TextSpan(
                        text: promoStartDate,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' hingga ',
                      ),
                      TextSpan(
                        text: promoDueDate,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  style: AppStyle.contentDescTextTitle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  detailPaket.description,
                  style: AppStyle.contentDescText,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Syarat & Ketentuan',
                  style: AppStyle.contentDescTextTitle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  detailPaket.termsAndConditions,
                  style: AppStyle.contentDescText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
