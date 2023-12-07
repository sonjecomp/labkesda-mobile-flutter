import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: paketState.when(
                    data: (data) {
                      return data.map((e) {
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
