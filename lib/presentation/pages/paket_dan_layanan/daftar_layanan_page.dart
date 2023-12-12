import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/cards/layanan_tes_card.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/cards/konten_tidak_tersedia_card.dart';
import 'package:labkesda_mobile/presentation/components/buttons/manipulation_search_button.dart';
import 'package:labkesda_mobile/presentation/controllers/layanan_dummy/layanan_dummy_provider.dart';
import 'package:labkesda_mobile/presentation/components/cards/loading/layanan_tes_card_loading.dart';

class DaftarLayananPage extends HookConsumerWidget {
  const DaftarLayananPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layananState = ref.watch(layananDummyProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Layanan',
        backgroundColor: AppColors.primary,
        leadingAndTextColor: AppColors.textWhite,
      ),
      body: layananState.when(
        data: (data) => data.isEmpty
            ? const Center(
                child: KontenTidakTersediaCard(
                  text: 'Layanan tidak tersedia',
                ),
              )
            : ListView(
                children: [
                  const ManipulationSearchButton(
                    placeHolder: 'Cari layanan',
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 20,
                      bottom: 15,
                      left: 20,
                    ),
                    href: '/search-layanan',
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
                            (e) => LayananTesCard(
                              layanan: e,
                            ),
                            // (e) => const LayananTesCardLoading(),
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
        loading: () {
          return ListView(
            children: [
              const ManipulationSearchButton(
                placeHolder: 'Cari layanan',
                padding: EdgeInsets.only(
                  top: 10,
                  right: 20,
                  bottom: 15,
                  left: 20,
                ),
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
                  children: List.generate(
                    10,
                    (index) => const LayananTesCardLoading(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
