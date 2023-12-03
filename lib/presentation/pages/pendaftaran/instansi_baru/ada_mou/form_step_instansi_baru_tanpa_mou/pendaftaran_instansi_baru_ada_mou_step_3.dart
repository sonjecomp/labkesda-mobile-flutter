import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';

class PendaftaranInstansiBaruAdaMouStep3 extends HookConsumerWidget {
  const PendaftaranInstansiBaruAdaMouStep3(
      {super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // controller for text input
    final jenisSampleController = useTextEditingController();
    final wadahVolumeController = useTextEditingController();
    final lokasiSampelController = useTextEditingController();
    final pengambilSampelController = useTextEditingController();
    final kondisiSaatDiterimaController = useTextEditingController();

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
            title: 'Pendaftaran\nInstansi Baru',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Jenis Sampel (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: jenisSampleController,
            placeHolder: 'Masukkan jenis sampel',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Tanggal Pengambilan Sampel (Opsional)',
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
                helpText: 'Pilih tanggal lahir',
              );
              if (value != null) {
                dateController.text =
                    DateFormat('dd/MM/yyyy').format(value).toString();
                selectedDate.value = value;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Wadah/Volume (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: wadahVolumeController,
            onChanged: (value) {
              value.isEmpty ? null : null;
            },
            placeHolder: 'Masukkan wadah/volume',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Lokasi Sampel (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: lokasiSampelController,
            placeHolder: 'Masukkan lokasi sampel',
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
            controller: pengambilSampelController,
            placeHolder: 'Masukkan pengambil sampel',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kondisi Saat Diterima (Opsional)',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: kondisiSaatDiterimaController,
            placeHolder: 'Masukkan kondisi saat diterima',
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
                  print(
                    'jenisSampleController: ${jenisSampleController.text}, \n wadahVolumeController: ${wadahVolumeController.text}, \n lokasiSampelController: ${lokasiSampelController.text}, \n pengambilSampelController: ${pengambilSampelController.text}, \n kondisiSaatDiterimaController: ${kondisiSaatDiterimaController.text}, \n dateController: ${dateController.text}, \n selectedDate: ${selectedDate.value} \n',
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
