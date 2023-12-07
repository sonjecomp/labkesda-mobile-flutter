import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';

class HasilPemeriksaanPage extends HookConsumerWidget {
  const HasilPemeriksaanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kodeIdentitasController = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'HASIL PEMERIKSAAN',
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderPages(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: AppStyle.formContainerDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleForm(
                        title: 'Hasil\nPemeriksaan',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Kode Pemeriksaan',
                        style: AppStyle.inputLabel,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormFieldInput(
                        isNik: true,
                        keyboardType: TextInputType.number,
                        controller: kodeIdentitasController,
                        isRequired: true,
                        placeHolder: 'Masukkan kode pemeriksaan',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      DirectButton(
                        text: 'Cari',
                        onPressed: () {
                          if (kodeIdentitasController.text.isEmpty) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: Border.all(
                                  color: Colors.black,
                                ),
                                title: const Text('Perhatian!'),
                                content: const Text(
                                  'Kode pemeriksaan tidak boleh kosong!',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          context.push(
                            '/riwayat-pemeriksaan/hasil-pencarian-riwayat-pemeriksaan/detail-pemeriksaan',
                          );
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
