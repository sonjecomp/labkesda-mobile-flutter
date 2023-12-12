import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/layanan_layout.dart';
import 'package:labkesda_mobile/presentation/components/layouts/paket_layanan_layout.dart';
import 'package:labkesda_mobile/presentation/components/headers/subheader_daftar_layanan.dart';
import 'package:labkesda_mobile/presentation/components/buttons/manipulation_search_button.dart';

class PaketDanLayananPage extends HookConsumerWidget {
  const PaketDanLayananPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: const [
          ManipulationSearchButton(
            placeHolder: 'Cari paket atau layanan',
            href: '/search-paket-dan-layanan',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                SubHeaderDaftarLayanan(
                  title: 'Paket Layanan',
                  href: '/daftar-paket',
                ),
                PaketLayananLayout(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            child: Column(
              children: [
                SubHeaderDaftarLayanan(
                  title: 'Layanan',
                  href: '/daftar-layanan',
                ),
                LayananLayout(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
