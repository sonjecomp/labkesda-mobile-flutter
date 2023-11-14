import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

final List<ValueDropdown> kewarganegaraan = [
  ValueDropdown(
    teks: 'WNA (Warna Negara Asing)',
    value: 'wna',
  ),
  ValueDropdown(
    teks: 'WNI (Warna Negara Indonesia)',
    value: 'wni',
  )
];

class PendaftaranPasienBaruStep1 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep1({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedKewarganegaraan = useState(null);

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
            'Nama',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukan nama lengkap',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'NIK',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            keyboardType: TextInputType.number,
            isRequired: true,
            placeHolder: 'Masukan NIK',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Templat Lahir',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukan tempat lahir',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Tanggal Lahir',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            readOnly: true,
            placeHolder: 'Masukan tanggal lahir',
            suffixIcon: const Icon(Icons.date_range),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2030),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kewarganegaraan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: kewarganegaraan,
            selectedValue: selectedKewarganegaraan,
            placeHolder: "--Pilih Kewarganegaraan--",
          ),
          const SizedBox(
            height: 40,
          ),
          DirectButton(
            text: 'Kanjutkan',
            onPressed: () {
              currIndexStepper.value++;
              stepScrollController.jumpTo(0);
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
