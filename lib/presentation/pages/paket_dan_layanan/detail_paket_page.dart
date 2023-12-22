import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/layanan/layanan.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/paket_layanan/paket_layanan.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/cards/tabel_daftar_layanan_card.dart';

class DetailPaketPemeriksaanPage extends HookConsumerWidget {
  const DetailPaketPemeriksaanPage({
    super.key,
    required this.detailPaketLayanan,
  });
  final PaketLayanan detailPaketLayanan;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Detail Paket Layanan',
          backgroundColor: AppColors.primary,
          leadingAndTextColor: AppColors.textWhite,
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
                      detailPaketLayanan.name,
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
              child: RichText(
                text: TextSpan(
                  text: 'Harga Paket\n',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: detailPaketLayanan.harga,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Layanan yang termasuk',
                      style: AppStyle.contentDescTextTitle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    detailPaketLayanan.layanan?.isEmpty ?? true
                        ? const SizedBox(
                            child: Text(
                              '-',
                            ),
                          )
                        : TabelDaftarLayananCard(
                            daftarLayanan: detailPaketLayanan.layanan as List<Layanan>,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
