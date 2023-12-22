import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/controllers/categories/category_provider.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_lama/pendaftaran_pasien_lama_page.dart';

class PendaftaranPasienLamaStep2 extends HookConsumerWidget {
  const PendaftaranPasienLamaStep2({super.key, required this.currIndexStepper, required this.inputController});

  final ValueNotifier<int> currIndexStepper;
  final List inputController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jenisPasienState = ref.watch(jenisPasienProvider);
    final tipePendaftaranState = ref.watch(tipePendaftaranProvider);

    final selectedJenisPendaftaran = useState<String?>(null);
    final selectedJenisPasien = useState<String?>(null);

    useEffect(() {
      if (selectedJenisPendaftaran.value != null) {
        inputController[2].text = selectedJenisPendaftaran.value;
      }

      return () {};
    }, [selectedJenisPendaftaran.value]);

    useEffect(() {
      if (selectedJenisPasien.value != null) {
        inputController[3].text = selectedJenisPasien.value;
      }
      return () {};
    }, [selectedJenisPasien.value]);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppStyle.formContainerDecoration,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const TitleForm(
            title: "Pendaftaran\nPasien Lama",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Tipe Pendaftaran',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: tipePendaftaranState.maybeWhen(
              orElse: () => [],
              data: (data) {
                return data;
              },
            ),
            isDisabled: tipePendaftaranState.isLoading,
            selectedValue: selectedJenisPendaftaran,
            placeHolder: tipePendaftaranState.isLoading ? "Loading..." : "--Pilih Tipe Pendaftaran--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Jenis Pasien (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: jenisPasienState.maybeWhen(
              orElse: () => [],
              data: (data) {
                return data;
              },
            ),
            isDisabled: jenisPasienState.isLoading,
            selectedValue: selectedJenisPasien,
            placeHolder: jenisPasienState.isLoading ? "Loading..." : "--Pilih Jenis Pasien--",
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
            controller: inputController[4],
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
            controller: inputController[5],
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
            controller: inputController[6],
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
            controller: inputController[7],
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
                  if (inputController[2].text.isNotEmpty) {
                    if (inputController[4].text.isEmpty ||
                        inputController[5].text.isEmpty ||
                        inputController[6].text.isEmpty ||
                        inputController[7].text.isEmpty) {
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
                  } else {
                    return Flushbar(
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
                      ..show(context);
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
