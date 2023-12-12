import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/cards/paket_layanan_card.dart';
import 'package:labkesda_mobile/presentation/components/cards/konten_tidak_tersedia_card.dart';
import 'package:labkesda_mobile/presentation/controllers/paket_layanan/paket_layanan_controller.dart';
import 'package:labkesda_mobile/presentation/components/cards/loading/paket_layanan_card_loading.dart';

class PaketLayananLayout extends HookConsumerWidget {
  const PaketLayananLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paketState = ref.watch(paketLayananControllerProvider);
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      verticalDirection: VerticalDirection.down,
      children: paketState.when(
        data: (data) {
          if (data.isEmpty) {
            return [
              const SizedBox(
                height: 280,
                child: KontenTidakTersediaCard(
                  text: 'Paket layanan sedang tidak tersedia',
                ),
              ),
            ];
          }

          return data.take(4).map(
            (e) {
              return PaketLayananCard(
                detailPaket: e,
              );
            },
          ).toList();
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
          for (int i = 0; i < 4; i++) const PaketLayananCardLoading(),
        ],
      ),
    );
  }
}
