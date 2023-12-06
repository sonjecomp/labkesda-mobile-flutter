import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/controllers/dokter/dokter_provider.dart';
import 'package:labkesda_mobile/presentation/components/snackbar/warning_snackbar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/controllers/instansi/instansi_provider.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/controllers/pemeriksaan/pemeriksaan_controller.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

class PendaftaranPasienBaruStep6 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep6({
    super.key,
    required this.currIndexStepper,
    required this.inputController,
  });
  final ValueNotifier<int> currIndexStepper;

  final List inputController;

  void handleSubmit(BuildContext context) async {
    context.loaderOverlay.show();
    final res =
        await PemeriksaanController().createPemeriksaanBaru(inputController);
    if (context.mounted) {
      context.loaderOverlay.hide();

      if (res == "Berhasil membuat pemeriksaan baru") {
        context.push('/hasil-pendaftaran');
      }

      final bool resBool = res == "Berhasil membuat pemeriksaan baru";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            res,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor:
              resBool ? AppColors.greenColor : AppColors.orangeColor,
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.up,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 150,
            left: 10,
            right: 10,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dokterPengirimState = ref.watch(dokterProvider);
    final instansiPengirimState = ref.watch(instansiProvider);

    final tanggalKunjunganController = useTextEditingController();
    final selectedDokterPengirim = useState<String?>(null);
    final selectedInstansiPengirim = useState<String?>(null);

    useEffect(() {
      if (selectedDokterPengirim.value != null) {
        inputController[19].text = selectedDokterPengirim.value;
      }

      if (selectedInstansiPengirim.value != null) {
        inputController[26].text = selectedInstansiPengirim.value;
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
            title: "Pendaftaran\nPasien Baru",
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
            controller: inputController[23],
            placeHolder: 'Masukkan pengambil sampel',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Tanggal Kunjungan Ke Lab',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            readOnly: true,
            isRequired: true,
            placeHolder: "Pilih Tanggal Kunjungan Ke Lab",
            controller: tanggalKunjunganController,
            suffixIcon: const Icon(Icons.date_range),
            onTap: () async {
              final DateTime? value = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2030),
                helpText: 'Pilih Tanggal Kunjungan Ke Lab',
              );
              if (value != null) {
                // ignore: use_build_context_synchronously
                final TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  final DateTime dateTime = DateTime(
                    value.year,
                    value.month,
                    value.day,
                    time.hour,
                    time.minute,
                  );

                  tanggalKunjunganController.text =
                      DateFormat('dd/MM/yyyy HH.mm').format(dateTime);
                  inputController[27].text = dateTime.toIso8601String();
                }
              }
            },
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
                  if (inputController[27].text.isEmpty) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    WarningSnackbar.show(
                      context,
                      text: 'Mohon lengkapi data terlebih dahulu!',
                    );
                    return;
                  }

                  // show dialog
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
                          onPressed: () async {
                            contextDialog.pop();
                            handleSubmit(context);
                          },
                          child: const Text("Ya"),
                        ),
                      ],
                    ),
                  );
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
