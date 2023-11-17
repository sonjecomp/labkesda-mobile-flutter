import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/controllers/categories/category_provider.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

class PendaftaranPasienBaruStep4 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep4({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final golonganDarahState = ref.watch(golonganDarahProvider);

    final selectedGolonganDarah = useState<String?>(null);
    final alamatDomisiliController = useTextEditingController();
    final nomorTeleponController = useTextEditingController();
    final emailController = useTextEditingController();

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
            'Alamat Domisili',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: alamatDomisiliController,
            placeHolder: 'Masukkan alamat domisili',
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
          // Bikin radio button
          DropdownInput(
            values: golonganDarahState.maybeWhen(
                orElse: () => [], data: (data) => data),
            selectedValue: selectedGolonganDarah,
            isDisabled: golonganDarahState.isLoading,
            placeHolder: golonganDarahState.isLoading
                ? "Loading..."
                : "Pilih Golongan Darah",
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
            keyboardType: TextInputType.phone,
            controller: nomorTeleponController,
            placeHolder: 'Masukkan nomor telepon/whatsapp',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Email',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            placeHolder: 'Masukkan email',
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
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (alamatDomisiliController.value.text.isEmpty ||
                      selectedGolonganDarah.value == null ||
                      nomorTeleponController.value.text.isEmpty ||
                      emailController.value.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.startToEnd,
                        showCloseIcon: true,
                        content: Text('Mohon lengkapi data terlebih dahulu'),
                        backgroundColor: Colors.red,
                      ),
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
