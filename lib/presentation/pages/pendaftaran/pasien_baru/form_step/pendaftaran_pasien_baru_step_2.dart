import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/input/radio_input.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

class PendaftaranPasienBaruStep2 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep2({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValueJenisKelamin = useState<String?>(
      null,
    );
    final selectedValueGolonganDarah = useState<String?>(
      null,
    );
    final selectedValuePendidikan = useState<String?>(
      null,
    );
    final selectedValuePekerjaan = useState<String?>(
      null,
    );
    final List<ValueDropdown> jenisKelamin = [
      ValueDropdown(
        teks: "Laki-laki",
        value: "laki-laki",
      ),
      ValueDropdown(
        teks: "Perempuan",
        value: "perempuan",
      ),
    ];

    final List<ValueDropdown> golonganDarah = [
      ValueDropdown(
        teks: "A",
        value: "1",
      ),
      ValueDropdown(
        teks: "B",
        value: "2",
      ),
      ValueDropdown(
        teks: "AB",
        value: "3",
      ),
      ValueDropdown(
        teks: "O",
        value: "4",
      ),
    ];

    final List<ValueDropdown> pendidikan = [
      ValueDropdown(
        teks: "SD",
        value: "1",
      ),
      ValueDropdown(
        teks: "SMP/MTs",
        value: "2",
      ),
      ValueDropdown(
        teks: "SMA/MA/SMK",
        value: "3",
      ),
      ValueDropdown(
        teks: "D3",
        value: "4",
      ),
      ValueDropdown(
        teks: "S1",
        value: "5",
      ),
      ValueDropdown(
        teks: "S2",
        value: "6",
      ),
      ValueDropdown(
        teks: "S3",
        value: "7",
      ),
      ValueDropdown(
        teks: "Dan lain-lain",
        value: "8",
      )
    ];
    final List<ValueDropdown> pekerjaan = [
      ValueDropdown(
        teks: "PNS/TNI/Polri",
        value: "pns",
      ),
      ValueDropdown(
        teks: "Petani",
        value: "petani",
      ),
      ValueDropdown(
        teks: "Nelayan",
        value: "nelayan",
      ),
      ValueDropdown(
        teks: "Buruh",
        value: "buruh",
      ),
      ValueDropdown(
        teks: "Pedagang",
        value: "pedagang",
      ),
      ValueDropdown(
        teks: "Wiraswasta",
        value: "wiraswasta",
      ),
      ValueDropdown(
        teks: "Pensiunan",
        value: "pensiunan",
      ),
      ValueDropdown(
        teks: "Lainnya",
        value: "lainnya",
      )
    ];
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
            'Jenis Kelamin',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          RadioInput(
            values: jenisKelamin,
            selectedValue: selectedValueJenisKelamin,
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
          RadioInput(
            values: golonganDarah,
            selectedValue: selectedValueGolonganDarah,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Nomor Telepon',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            keyboardType: TextInputType.phone,
            placeHolder: 'Masukan nomor telepon',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pendidikan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: pendidikan,
            selectedValue: selectedValuePendidikan,
            placeHolder: "--Pilih pendidikan--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pekerjaan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: pekerjaan,
            selectedValue: selectedValuePekerjaan,
            placeHolder: "--Pilih pekerjaan--",
          ),
          const SizedBox(
            height: 40,
          ),
          DirectButton(
            text: 'SIMPAN',
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
