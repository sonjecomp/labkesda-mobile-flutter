import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/riwayat_pemeriksaan/riwayat_pemeriksaan.dart';
import 'package:labkesda_mobile/presentation/controllers/pemeriksaan/pemeriksaan_controller.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RiwayatPemeriksaanPage extends HookConsumerWidget {
  const RiwayatPemeriksaanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kodeIdentitasController = useTextEditingController();

    void handleSubmit(BuildContext context) async {
      context.loaderOverlay.show();
      final res = await PemeriksaanController().getRiwayatPemeriksaan(
        kodeIdentitasController.text,
      );

      if (context.mounted) {
        context.loaderOverlay.hide();
        if (res is List<RiwayatPemeriksaan>) {
          context.go(
            "/riwayat-pemeriksaan/hasil-pencarian-riwayat-pemeriksaan",
            extra: res,
          );
        } else {
          Flushbar(
            message: res.toString(),
            animationDuration: const Duration(milliseconds: 200),
            duration: const Duration(seconds: 2),
            backgroundColor: AppColors.redColor,
            flushbarPosition: FlushbarPosition.TOP,
            flushbarStyle: FlushbarStyle.FLOATING,
            margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ).show(context);
        }
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'RIWAYAT PEMERIKSAAN',
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
                        title: 'Riwayat\nPemeriksaan',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'NIK/Kode Pendaftaran',
                        style: AppStyle.inputLabel,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormFieldInput(
                        keyboardType: TextInputType.number,
                        controller: kodeIdentitasController,
                        isRequired: true,
                        placeHolder: 'Masukkan NIK/Kode pendaftaran',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      DirectButton(
                        text: 'Cari',
                        onPressed: () {
                          // unfocus
                          FocusScope.of(context).unfocus();
                          if (kodeIdentitasController.text.isEmpty) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: Border.all(
                                  color: Colors.black,
                                ),
                                title: const Text('Perhatian!'),
                                content: const Text(
                                  'Kode Identitas/Kode Pendaftaran tidak boleh kosong!',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          handleSubmit(context);
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
