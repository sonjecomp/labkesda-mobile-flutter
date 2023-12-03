import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/input/radio_input.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/snackbar/warning_snackbar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/controllers/instansi/instansi_provider.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/controllers/categories/category_provider.dart';

class PendaftaranInstansiBaruAdaMouStep1 extends HookConsumerWidget {
  const PendaftaranInstansiBaruAdaMouStep1(
      {super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // data for jenis kelamin &  dropdown instansi mou
    final jenisKelaminState = ref.watch(jenisKelaminProvider);
    final instansiMouState = ref.watch(instansiProvider);

    // controller for text input
    final namaPelangganController = useTextEditingController();
    final nikPelangganController = useTextEditingController();
    final umurPelangganController = useTextEditingController();

    // selected value for dropdown
    final selectedValueInstansiMou = useState<String?>(null);
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
            'Nama Instansi MOU',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: instansiMouState.maybeWhen(
                orElse: () => [],
                data: (data) {
                  return data;
                }),
            isDisabled: instansiMouState.isLoading,
            placeHolder: instansiMouState.isLoading
                ? 'Memuat...'
                : '--Pilih instansi MOU--',
            selectedValue: selectedValueInstansiMou,
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
          TextFormFieldInput(
            controller: namaPelangganController,
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
          TextFormFieldInput(
            isRequired: true,
            controller: nikPelangganController,
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
          jenisKelaminState.when(
            data: (data) {
              return RadioInput(
                values: data,
                selectedValue: selectedvalueJenisKelamin,
              );
            },
            loading: () {
              return SizedBox(
                height: 45,
                child: Text(
                  'Memuat...',
                  style: AppStyle.inputLabel.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return SizedBox(
                height: 45,
                child: Text(
                  'Error',
                  style: AppStyle.inputLabel.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              );
            },
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
          TextFormFieldInput(
            controller: umurPelangganController,
            keyboardType: TextInputType.number,
            placeHolder: 'Masukkan umur pelanggan',
          ),
          const SizedBox(
            height: 40,
          ),
          DirectButton(
            text: 'Lanjutkan',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              if (selectedvalueJenisKelamin.value == null ||
                  selectedValueInstansiMou.value == null ||
                  namaPelangganController.text.isEmpty ||
                  nikPelangganController.text.isEmpty ||
                  umurPelangganController.text.isEmpty) {
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
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
