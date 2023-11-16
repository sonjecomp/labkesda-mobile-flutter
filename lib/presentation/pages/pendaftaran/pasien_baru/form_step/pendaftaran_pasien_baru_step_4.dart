import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

final List<ValueDropdown> golonganDarah = [
  // Nanti di command atau di hapus saja kalau sudah integrasi dengan API
  ValueDropdown(
    teks: "A",
    value: "a",
  ),
  ValueDropdown(
    teks: "B",
    value: "b",
  ),
  ValueDropdown(
    teks: "AB",
    value: "ab",
  ),
  ValueDropdown(
    teks: "O",
    value: "o",
  ),
  ValueDropdown(
    teks: "Tidak Tahu",
    value: "tidak_tahu",
  ),
];

class PendaftaranPasienBaruStep4 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep4({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGolonganDarah = useState(null);

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
            'Alamat Domisili',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukkan alamat domisili',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Golongan Darah',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          // Bikin radio button
          DropdownInput(
            values: golonganDarah,
            selectedValue: selectedGolonganDarah,
            placeHolder: "Pilih Golongan Darah",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Nomor Telepon/Whatsapp',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            keyboardType: TextInputType.phone,
            placeHolder: 'Masukkan nomor telepon/whatsapp',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Email',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            keyboardType: TextInputType.emailAddress,
            placeHolder: 'Masukkan email',
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
                  currIndexStepper.value++;
                  stepScrollController.jumpTo(0);
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
