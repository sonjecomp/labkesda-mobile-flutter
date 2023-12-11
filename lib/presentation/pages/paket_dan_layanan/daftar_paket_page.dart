import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/cards/paket_layanan_card.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/cards/konten_tidak_tersedia_card.dart';
import 'package:labkesda_mobile/presentation/components/cards/loading/paket_layanan_card_loading.dart';
import 'package:labkesda_mobile/presentation/controllers/paket_pemeriksaan_dummy/paket_pemeriksaan_dumy_provider.dart';

class DaftarPaketPage extends HookConsumerWidget {
  const DaftarPaketPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paketPemeriksaanState = ref.watch(paketPemeriksaanDummyProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Paket Layanan',
        backgroundColor: AppColors.primary,
        leadingAndTextColor: AppColors.textWhite,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: paketPemeriksaanState.when(
              data: (data) => data.isEmpty
                  ? const KontenTidakTersediaCard()
                  : Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      verticalDirection: VerticalDirection.down,
                      children: data
                          .map(
                            (e) => PaketLayananCard(
                              detailPaket: e,
                            ),
                          )
                          .toList(),
                    ),
              error: (error, stackTrace) => Center(
                child: Text(
                  'Konten gagal dimuat, silahkan coba lagi',
                  style: AppStyle.contentDescText,
                ),
              ),
              loading: () => Wrap(
                spacing: 20,
                runSpacing: 20,
                verticalDirection: VerticalDirection.down,
                children: [
                  for (int i = 0; i < 4; i++) const PaketLayananCardLoading()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
