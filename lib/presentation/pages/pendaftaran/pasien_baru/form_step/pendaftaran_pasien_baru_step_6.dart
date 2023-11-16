import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

final List<ValueDropdown> dokterPengirim = [
  // Nanti di command atau di hapus saja kalau sudah integrasi dengan API
  ValueDropdown(
    teks: 'Dr. A',
    value: 'dr_a',
  ),
  ValueDropdown(
    teks: 'Dr. B',
    value: 'dr_b',
  ),
  ValueDropdown(
    teks: 'Dr. C',
    value: 'dr_c',
  ),
  ValueDropdown(
    teks: 'Dr. D',
    value: 'dr_d',
  ),
  ValueDropdown(
    teks: 'Dr. E',
    value: 'dr_e',
  ),
];

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
    final selectedDokterPengirim = useState(null);
    final selectedInstansiPengirim = useState(null);
    final dateController = useTextEditingController();
    final selectedDate = useState(DateTime.now());
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
          const TextFormFieldInput(
            isRequired: true,
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
            placeHolder:
                DateFormat('dd-MM-yyyy HH.mm').format(selectedDate.value),
            controller: DateFormat('dd-MM-yyyy HH.mm')
                    .format(DateTime.now())
                    .toString()
                    .isNotEmpty
                ? dateController
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
                  dateController.text =
                      DateFormat('dd/MM/yyyy HH.mm').format(dateTime);
                  selectedDate.value = dateTime;
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
            values: dokterPengirim,
            selectedValue: selectedDokterPengirim,
            placeHolder: "Pilih Dokter Pengirim",
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
            values: instansiPengirim,
            selectedValue: selectedInstansiPengirim,
            placeHolder: "Pilih Instansi Pengirim",
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
