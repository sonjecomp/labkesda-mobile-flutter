import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienBaruStep2 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep2({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: AppStyle.formContainerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleForm(title: "Pasien Baru"),
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
            'Alamat Email',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukan alamat email',
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
            'NIK',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukan NIK',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Alamat',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            placeHolder: 'Masukan alamat',
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 5,
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
