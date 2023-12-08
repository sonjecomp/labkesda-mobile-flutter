import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/cards/layanan_tes_card.dart';
import 'package:labkesda_mobile/presentation/components/cards/loading/paket_layanan_card_loading.dart';
import 'package:labkesda_mobile/presentation/components/cards/paket_layanan_card.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/controllers/paket/paket_provider.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class DaftarLayanan extends HookConsumerWidget {
  const DaftarLayanan({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paketState = ref.watch(paketProvider);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 30,
              right: 20,
              bottom: 15,
              left: 20,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Column(
              children: [
                TextFormFieldInput(
                  readOnly: true,
                  onTap: () {},
                  placeHolder: 'Cari paket/layanan',
                  suffixIcon: const Icon(
                    Icons.search,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Semua',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Tes',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Paket',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paket Layanan',
                        style: AppStyle.contentDescTextTitle,
                      ),
                      SizedBox(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 0,
                            ),
                          ),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 12,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  verticalDirection: VerticalDirection.down,
                  children: paketState.when(
                    data: (data) {
                      return data.take(6).map((e) {
                        return PaketLayananCard(
                          detailPaket: e,
                        );
                      }).toList();
                    },
                    error: (error, stackTrace) => [
                      Center(
                        child: Text(
                          'Konten gagal dimuat, silahkan coba lagi',
                          style: AppStyle.contentDescText,
                        ),
                      ),
                    ],
                    loading: () => [
                      for (int i = 0; i < 10; i++)
                        const PaketLayananCardLoading(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Layanan Tes',
                        style: AppStyle.contentDescTextTitle,
                      ),
                      SizedBox(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 0,
                            ),
                          ),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 12,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (int i = 0; i < 5; i++) const LayananTesCard(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
