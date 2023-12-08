import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/cards/loading/paket_layanan_card_loading.dart';
import 'package:labkesda_mobile/presentation/components/cards/paket_layanan_card.dart';
import 'package:labkesda_mobile/presentation/controllers/paket_layanan/paket_layanan_controller.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

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
              Center(
                child: Text(
                  'Tidak ada paket layanan',
                  style: AppStyle.contentDescText,
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
