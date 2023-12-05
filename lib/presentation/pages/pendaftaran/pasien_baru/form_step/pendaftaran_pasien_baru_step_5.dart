import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/snackbar/warning_snackbar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

class PendaftaranPasienBaruStep5 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep5({
    super.key,
    required this.currIndexStepper,
    required this.inputController,
  });

  final List inputController;
  final ValueNotifier<int> currIndexStepper;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tanggalPengambilanSampelController = useTextEditingController();

    return Container(
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
            title: "Pendaftaran\nPasien Baru",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Jenis Sampel (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: inputController[21],
            placeHolder: 'Masukkan jenis sampel',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Lokasi Sampel (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            placeHolder: 'Masukkan lokasi sampel',
            controller: inputController[20],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Wadah/Volume Sampel (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            placeHolder: 'Masukkan wadah/volume',
            controller: inputController[22],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kondisi Saat Diterima (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            placeHolder: 'Masukkan kondisi saat diterima',
            controller: inputController[25],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Tanggal Pengambilan Sampel (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            readOnly: true,
            isRequired: true,
            controller: tanggalPengambilanSampelController,
            placeHolder: "Pilih Tanggal Pengambilan Sampel",
            suffixIcon: const Icon(Icons.date_range),
            onTap: () async {
              final value = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2030),
                helpText: 'Pilih Tanggal Pengambilan Sampel',
              );
              if (value != null) {
                inputController[24].text = value.toIso8601String();
                tanggalPengambilanSampelController.text = DateFormat('dd/MM/yyyy').format(value).toString();
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepperButton(
                text: "Kembali",
                buttonType: "prev",
                onPressed: () {
                  currIndexStepper.value--;
                  stepScrollController.jumpTo(0);
                },
              ),
              StepperButton(
                text: "Lanjutkan",
                buttonType: "next",
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (inputController[20].text.isEmpty ||
                      inputController[21].text.isEmpty ||
                      inputController[22].text.isEmpty ||
                      inputController[24].text.isEmpty ||
                      inputController[25].text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (contextDialog) => AlertDialog(
                        title: const Text("Data tidak lengkap"),
                        content: const Text("Apakah anda yakin untuk melanjutkan?"),
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
                              currIndexStepper.value++;
                              stepScrollController.jumpTo(0);
                            },
                            child: const Text("Ya"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    currIndexStepper.value++;
                    stepScrollController.jumpTo(0);
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
