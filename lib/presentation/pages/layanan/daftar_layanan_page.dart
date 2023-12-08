import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/headers/subheader_daftar_layanan.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/layanan_layout.dart';
import 'package:labkesda_mobile/presentation/components/layouts/paket_layanan_layout.dart';

class DaftarLayanan extends HookConsumerWidget {
  const DaftarLayanan({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            decoration: const BoxDecoration(color: AppColors.primary),
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
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                SubHeaderDaftarLayanan(
                  title: 'Paket Layanan',
                  href: '',
                ),
                PaketLayananLayout(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            child: Column(
              children: [
                SubHeaderDaftarLayanan(
                  title: 'Layanan',
                  href: '',
                ),
                LayananLayout(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
