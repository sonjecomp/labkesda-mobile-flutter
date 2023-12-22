import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/cards/paket_layanan_card.dart';
import 'package:labkesda_mobile/presentation/components/cards/konten_tidak_tersedia_card.dart';
import 'package:labkesda_mobile/presentation/components/buttons/manipulation_search_button.dart';
import 'package:labkesda_mobile/presentation/components/cards/loading/paket_layanan_card_loading.dart';
import 'package:labkesda_mobile/presentation/controllers/paket_layanan/paket_layanan_controller.dart';

class DaftarPaketPage extends HookConsumerWidget {
  const DaftarPaketPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paketPemeriksaanState = ref.watch(paketLayananControllerProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Paket Layanan',
        backgroundColor: AppColors.primary,
        leadingAndTextColor: AppColors.textWhite,
      ),
      body: paketPemeriksaanState.when(
        data: (data) => data.isEmpty
            ? const Center(
                child: KontenTidakTersediaCard(
                  text: 'Paket layanan tidak tersedia',
                ),
              )
            : ListView(
                children: [
                  const ManipulationSearchButton(
                    placeHolder: 'Cari paket layanan',
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 20,
                      bottom: 15,
                      left: 20,
                    ),
                    href: '/search-paket-layanan',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Wrap(
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
                  ),
                ],
              ),
        error: (error, stackTrace) => const Center(
          child: Text(
            'Konten gagal dimuat, silahkan coba lagi',
          ),
        ),
        loading: () => ListView(
          children: [
            const ManipulationSearchButton(
              placeHolder: 'Cari paket layanan',
              padding: EdgeInsets.only(
                top: 10,
                right: 20,
                bottom: 15,
                left: 20,
              ),
              href: '/search-paket-layanan',
            ),
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                verticalDirection: VerticalDirection.down,
                children: [for (int i = 0; i < 10; i++) const PaketLayananCardLoading()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
