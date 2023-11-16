import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

final List<ValueDropdown> dokterPengirim = [
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

class PendaftaranIsntansiBaruTanpaMouStep4 extends HookConsumerWidget {
  const PendaftaranIsntansiBaruTanpaMouStep4(
      {super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValueDokterPengirim = useState<String?>(null);
    final selectedValueInstansiPengirim = useState<String?>(null);
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
            title: 'Pendaftaran\nInstansi Baru',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Nama Petugas',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukkan nama petugas',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kondisi Saat Diterima',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukkan kondisi saat diterima',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Dokter Pengirim',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            placeHolder: '-- Pilih Dokter Pengirim --',
            values: dokterPengirim,
            selectedValue: selectedValueDokterPengirim,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Instansi Pengirim',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            placeHolder: '-- Pilih Instansi Pengirim --',
            values: instansiPengirim,
            selectedValue: selectedValueInstansiPengirim,
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
