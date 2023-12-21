import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/snackbar/warning_snackbar.dart';
import 'package:labkesda_mobile/presentation/controllers/dokter/dokter_provider.dart';
import 'package:labkesda_mobile/presentation/controllers/instansi/instansi_provider.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_lama/pendaftaran_instansi_lama_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranInstansiLamaStep3 extends HookConsumerWidget {
  const PendaftaranInstansiLamaStep3({
    super.key,
    required this.currIndexStepper,
    required this.inputController,
  });

  final ValueNotifier<int> currIndexStepper;
  final List inputController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dokterPengirimState = ref.watch(dokterProvider);
    final instansiPengirimState = ref.watch(instansiProvider);

    final tanggalPengambilanSampelController = useTextEditingController();
    final selectedDokterPengirim = useState<String?>(null);
    final selectedInstansiPengirim = useState<String?>(null);

    useEffect(() {
      if (selectedDokterPengirim.value != null) {
        inputController[10].text = selectedDokterPengirim.value;
      }

      if (selectedInstansiPengirim.value != null) {
        inputController[11].text = selectedInstansiPengirim.value;
      }

      return () {};
    }, [selectedDokterPengirim.value, selectedInstansiPengirim.value]);

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
            title: "Pendaftaran\nInstansi Lama",
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
                inputController[8].text = value.toIso8601String();
                tanggalPengambilanSampelController.text =
                    DateFormat('dd/MM/yyyy').format(value).toString();
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pengambil Sampel (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: inputController[9],
            placeHolder: 'Masukkan pengambil sampel',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Dokter Pengirim (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: dokterPengirimState.maybeWhen(
              orElse: () => [],
              data: (data) => data,
            ),
            isDisabled: dokterPengirimState.isLoading,
            selectedValue: selectedDokterPengirim,
            placeHolder: dokterPengirimState.isLoading
                ? "Memuat..."
                : "Pilih Dokter Pengirim",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Instansi Pengirim (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: instansiPengirimState.maybeWhen(
              orElse: () => [],
              data: (data) => data,
            ),
            isDisabled: instansiPengirimState.isLoading,
            selectedValue: selectedInstansiPengirim,
            placeHolder: instansiPengirimState.isLoading
                ? "Memuat..."
                : "Pilih Instansi Pengirim",
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
                text: "Simpan",
                buttonType: "next",
                onPressed: () {
                  if (inputController[8].text.isEmpty ||
                      inputController[9].text.isEmpty ||
                      inputController[10].text.isEmpty ||
                      inputController[11].text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (contextDialog) => AlertDialog(
                        title: const Text("Konfirmasi"),
                        content: const Text(
                            "Apakah anda yakin semua data anda sudah benar?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(contextDialog).pop();
                            },
                            child: const Text("Batal"),
                          ),
                          TextButton(
                            // onPressed: () async {
                            //   contextDialog.pop();
                            //   handleSubmit(context);
                            // },
                            onPressed: () {},
                            child: const Text("Ya"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    WarningSnackbar.show(
                      context,
                      text: "Coming soon !",
                    );
                  }
                  // show dialog
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
