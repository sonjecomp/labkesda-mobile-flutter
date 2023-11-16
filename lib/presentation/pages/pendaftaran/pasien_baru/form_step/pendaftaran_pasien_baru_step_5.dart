import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienBaruStep5 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep5({super.key, required this.currIndexStepper});
  final ValueNotifier<int> currIndexStepper;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            'Jenis Sampel',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            isRequired: true,
            placeHolder: 'Masukkan jenis sampel',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Lokasi Sampel',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            isRequired: true,
            placeHolder: 'Masukkan lokasi sampel',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Wadah/Volume',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          const TextFormFieldInput(
            isRequired: true,
            placeHolder: 'Masukkan wadah/volume',
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
            isRequired: true,
            placeHolder: 'Masukkan kondisi saat diterima',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Tanggal Pengambilan Sampel',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            readOnly: true,
            isRequired: true,
            controller: DateFormat('dd/MM/yyyy')
                    .format(DateTime.now())
                    .toString()
                    .isNotEmpty
                ? dateController
                : null,
            placeHolder:
                DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
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
                dateController.text =
                    DateFormat('dd/MM/yyyy').format(value).toString();
                selectedDate.value = value;
              }
            },
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
