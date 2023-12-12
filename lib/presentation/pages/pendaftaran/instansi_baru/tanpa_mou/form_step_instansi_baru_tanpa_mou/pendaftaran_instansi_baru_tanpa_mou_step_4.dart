import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/controllers/dokter/dokter_provider.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/controllers/instansi/instansi_provider.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';

class PendaftaranIsntansiBaruTanpaMouStep4 extends HookConsumerWidget {
  const PendaftaranIsntansiBaruTanpaMouStep4(
      {super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // data for dropdown dokter & instansi pengirim
    final dokterPengirimState = ref.watch(dokterProvider);
    final instansiPengirimState = ref.watch(instansiProvider);

    // controller for input text
    final namaPetugasController = useTextEditingController();
    final kondisiSaatDiterimaController = useTextEditingController();

    // selected value for dokter & instansi pengirim
    final selectedValueDokterPengirim = useState<int?>(null);
    final selectedValueInstansiPengirim = useState<int?>(null);

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
          TextFormFieldInput(
            controller: namaPetugasController,
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
          TextFormFieldInput(
            controller: kondisiSaatDiterimaController,
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
            values: dokterPengirimState.maybeWhen(
              orElse: () => [],
              data: (data) {
                return data;
              },
            ),
            isDisabled: dokterPengirimState.isLoading,
            placeHolder: dokterPengirimState.isLoading
                ? 'Memuat...'
                : '-- Pilih Dokter Pengirim --',
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
            // placeHolder: '-- Pilih Instansi Pengirim --',
            // values: instansiPengirim,
            // selectedValue: selectedValueInstansiPengirim,
            values: instansiPengirimState.maybeWhen(
              orElse: () => [],
              data: (data) {
                return data;
              },
            ),
            isDisabled: instansiPengirimState.isLoading,
            placeHolder: instansiPengirimState.isLoading
                ? 'Memuat...'
                : '-- Pilih Instansi Pengirim --',
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
                onPressed: () {},
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
