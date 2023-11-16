import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/input/radio_input.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

final List<ValueDropdown> instansiMou = [
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

final List<ValueDropdown> jenisKelamin = [
  ValueDropdown(
    teks: 'Laki-laki',
    value: 'laki_laki',
  ),
  ValueDropdown(
    teks: 'Perempuan',
    value: 'perempuan',
  ),
];

class PendaftaranIsntansiBaruTanpaMouStep1 extends HookConsumerWidget {
  const PendaftaranIsntansiBaruTanpaMouStep1(
      {super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedvalueJenisKelamin = useState<String?>(null);
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
            'Nama Instansi',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            placeHolder: 'Masukkan nama instansi',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Nama Pelanggan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukkan nama pelanggan',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'NIK Pelanggan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            keyboardType: TextInputType.number,
            placeHolder: 'Masukkan NIK pelanggan',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Jenis Kelamin Pelanggan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          RadioInput(
            values: jenisKelamin,
            selectedValue: selectedvalueJenisKelamin,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Umur Pelanggan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            keyboardType: TextInputType.number,
            placeHolder: 'Masukkan umur pelanggan',
          ),
          const SizedBox(
            height: 40,
          ),
          DirectButton(
            text: 'Lanjutkan',
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
