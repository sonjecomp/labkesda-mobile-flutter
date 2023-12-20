import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/pemeriksaan/pemeriksaan.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/controllers/pemeriksaan/pemeriksaan_controller.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PendaftaranPasienLama extends HookConsumerWidget {
  const PendaftaranPasienLama({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listController = List.generate(2, (index) => useTextEditingController());
    final tanggalKunjunganController = useTextEditingController();

    void handleSubmit(BuildContext context) async {
      context.loaderOverlay.show();
      final res = await PemeriksaanController().createPemeriksaanLama(listController);
      if (context.mounted) {
        context.loaderOverlay.hide();
        if (res is Pemeriksaan) {
          context.push('/hasil-pendaftaran', extra: res);
        }

        final bool resBool = res is Pemeriksaan;

        Flushbar(
          message: resBool ? "Pendaftaran berhasil!" : res.toString(),
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Kembali',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: AppStyle.formContainerDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TitleForm(
                        title: "Pendaftaran\nPasien Lama",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'NIK/Kode Pendaftaran',
                        style: AppStyle.inputLabel,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: listController[0],
                        decoration: AppStyle.inputTextFormDecoration(
                          hintText: 'Masukkan NIK atau kode pendaftaran',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Tanggal Kunjungan',
                        style: AppStyle.inputLabel,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: tanggalKunjunganController,
                        readOnly: true,
                        decoration: AppStyle.inputTextFormDecoration(
                          hintText: "Pilih tanggal kunjungan",
                          suffixIcon: const Icon(Icons.date_range),
                        ),
                        onTap: () async {
                          final res = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1999),
                            lastDate: DateTime(2030),
                          );

                          if (res != null) {
                            tanggalKunjunganController.text = DateFormat('dd/MM/yyyy').format(res);

                            listController[1].text = res.toIso8601String();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      DirectButton(
                        text: 'SIMPAN',
                        onPressed: () => {
                          if (listController[0].text.isNotEmpty && listController[1].text.isNotEmpty)
                            {
                              showDialog(
                                context: context,
                                builder: (contextDialog) => AlertDialog(
                                  title: const Text("Konfirmasi"),
                                  content: const Text("Apakah anda yakin semua data anda sudah benar?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(contextDialog).pop();
                                      },
                                      child: const Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        contextDialog.pop();
                                        handleSubmit(context);
                                      },
                                      child: const Text("Ya"),
                                    ),
                                  ],
                                ),
                              )
                            }
                          else
                            {
                              Flushbar(
                                  message: "Mohon lengkapi data terlebih dahulu!",
                                  animationDuration: const Duration(milliseconds: 200),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: AppColors.redColor,
                                  flushbarPosition: FlushbarPosition.TOP,
                                  flushbarStyle: FlushbarStyle.FLOATING,
                                  margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ))
                                ..show(context)
                            }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
