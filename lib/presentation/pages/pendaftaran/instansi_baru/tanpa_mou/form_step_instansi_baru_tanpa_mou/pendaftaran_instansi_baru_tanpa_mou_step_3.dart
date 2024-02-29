import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/tanpa_mou/pendaftaran_instansi_baru_tanpa_mou.dart';

class PendaftaranIsntansiBaruTanpaMouStep3 extends HookConsumerWidget {
  const PendaftaranIsntansiBaruTanpaMouStep3({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // controller for text input
    final jenisSampelController = useTextEditingController();
    final tanggalPengambilanSampelController = useTextEditingController();
    final wadahVolumeController = useTextEditingController();
    final lokasiSampelController = useTextEditingController();
    final pengambilSampelController = useTextEditingController();

    // selected value tanggal pengambilan sampel for post
    final selectedTanggalPengambilanSampel = useState(DateTime.now());

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
            controller: jenisSampelController,
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
            controller: tanggalPengambilanSampelController,
            placeHolder: DateFormat('dd/MM/yyyy')
                .format(
                  DateTime.now(),
                )
                .toString(),
            suffixIcon: const Icon(Icons.date_range),
            onTap: () async {
              final value = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2030),
                helpText: 'Pilih tanggal pengambilan sampel',
              );
              if (value != null) {
                tanggalPengambilanSampelController.text = DateFormat('dd/MM/yyyy').format(value).toString();
                selectedTanggalPengambilanSampel.value = value;
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
                  // stepScrollController.jumpTo(0);
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
