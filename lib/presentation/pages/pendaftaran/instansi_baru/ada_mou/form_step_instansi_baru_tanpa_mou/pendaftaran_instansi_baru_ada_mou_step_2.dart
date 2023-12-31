import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/snackbar/warning_snackbar.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranInstansiBaruAdaMouStep2 extends HookConsumerWidget {
  const PendaftaranInstansiBaruAdaMouStep2(
      {super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // controller for text input
    final alamatInstansiController = useTextEditingController();
    final emailInstansiController = useTextEditingController();
    final nomorTeleponController = useTextEditingController();
    final tanggalKunjunganController = useTextEditingController();
    final namaPetugasController = useTextEditingController();

    // selected value for date picker
    final selectedTanggalKunjungan = useState(DateTime.now());

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
            'Alama Instansi',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            isRequired: true,
            controller: alamatInstansiController,
            placeHolder: 'Masukkan alamat instansi',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Email Instansi',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            isRequired: true,
            controller: emailInstansiController,
            keyboardType: TextInputType.emailAddress,
            placeHolder: 'Masukkan email instansi',
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
          TextFormFieldInput(
            isRequired: true,
            controller: nomorTeleponController,
            keyboardType: TextInputType.phone,
            placeHolder: 'Masukkan nomor telepon/whatsapp',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Tanggal Kunjungan',
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
                ? tanggalKunjunganController
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
                tanggalKunjunganController.text =
                    DateFormat('dd/MM/yyyy').format(value).toString();
                selectedTanggalKunjungan.value = value;
              }
            },
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
          TextFormFieldInput(
            isRequired: true,
            controller: namaPetugasController,
            placeHolder: 'Masukkan nama petugas',
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
                  ScaffoldMessenger.of(context).clearSnackBars();
                  if (alamatInstansiController.text.isEmpty ||
                      emailInstansiController.text.isEmpty ||
                      nomorTeleponController.text.isEmpty ||
                      namaPetugasController.text.isEmpty) {
                    WarningSnackbar.show(
                      context,
                      text: 'Mohon lengkapi data terlebih dahulu!',
                    );
                  } else {
                    currIndexStepper.value++;
                    stepScrollController.jumpTo(0);
                  }
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
