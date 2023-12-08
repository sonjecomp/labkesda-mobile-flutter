import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/cards/layanan_tes_card.dart';
import 'package:labkesda_mobile/presentation/controllers/layanan/layanan_controller.dart';

class LayananLayout extends HookConsumerWidget {
  const LayananLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layananState = ref.watch(layananControllerProvider);

    return layananState.when(
      data: (data) {
        if (data.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada layanan',
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return LayananTesCard(
              layanan: data[index],
            );
          },
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text(
          'Konten gagal dimuat, silahkan coba lagi',
        ),
      ),
      loading: () => const Center(
        child: Text(
          'Loading...',
        ),
      ),
    );
  }
}
