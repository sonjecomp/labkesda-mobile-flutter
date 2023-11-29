import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/controllers/dokter/dokter_provider.dart';
import 'package:labkesda_mobile/presentation/controllers/instansi/instansi_provider.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

// final List<ValueDropdown> dokterPengirim = [
//   // Nanti di command atau di hapus saja kalau sudah integrasi dengan API
//   ValueDropdown(
//     teks: 'Dr. A',
//     value: 'dr_a',
//   ),
//   ValueDropdown(
//     teks: 'Dr. B',
//     value: 'dr_b',
//   ),
//   ValueDropdown(
//     teks: 'Dr. C',
//     value: 'dr_c',
//   ),
//   ValueDropdown(
//     teks: 'Dr. D',
//     value: 'dr_d',
//   ),
//   ValueDropdown(
//     teks: 'Dr. E',
//     value: 'dr_e',
//   ),
// ];

final List<ValueDropdown> instansiPengirim = [
  // Nanti di command atau di hapus saja kalau sudah integrasi dengan API
  ValueDropdown(
    teks: 'Instansi A',
    value: 'instansi_a',
  ),
  ValueDropdown(
    teks: 'Instansi B',
    value: 'instansi_b',
  ),
  ValueDropdown(
    teks: 'Instansi C',
    value: 'instansi_c',
  ),
  ValueDropdown(
    teks: 'Instansi D',
    value: 'instansi_d',
  ),
  ValueDropdown(
    teks: 'Instansi E',
    value: 'instansi_e',
  ),
];

class PendaftaranPasienBaruStep6 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep6({super.key, required this.currIndexStepper});
  final ValueNotifier<int> currIndexStepper;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dokterPengirimState = ref.watch(dokterProvider);
    final instansiPengirimState = ref.watch(instansiProvider);

    final tanggalKunjunganController = useTextEditingController();
    final pengambilSampelController = useTextEditingController();
    final selectedDokterPengirim = useState<String?>(null);
    final selectedInstansiPengirim = useState<String?>(null);
    final selectedTanggalKunjungan = useState(DateTime.now());
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
            'Pengambil Sampel',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: pengambilSampelController,
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
            placeHolder: DateFormat('dd-MM-yyyy HH.mm')
                .format(selectedTanggalKunjungan.value),
            controller: DateFormat('dd-MM-yyyy HH.mm')
                    .format(DateTime.now())
                    .toString()
                    .isNotEmpty
                ? tanggalKunjunganController
                : null,
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
                  selectedTanggalKunjungan.value = dateTime;
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
                  // if (pengambilSampelController.text.isNotEmpty &&
                  //     tanggalKunjunganController.text.isNotEmpty &&
                  //     selectedInstansiPengirim.value == null &&
                  //     selectedDokterPengirim.value == null) {
                  //   showDialog<String>(
                  //     context: context,
                  //     builder: (BuildContext context) => const AlertDialog(
                  //       title: Text(
                  //         'PERINGATAN!',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //       content: Text(
                  //         'Anda belum memilih Instansi Pengirim atau Dokter Pengirim, tetap lanjutkan pendaftaran?',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //     ),
                  //   );
                  // }
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
