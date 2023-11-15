import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienBaruStep5 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep5({super.key, required this.currIndexStepper});
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
          const SizedBox(
            height: 20,
          ),
          const TitleForm(
            title: "Pendaftaran\nPasien Baru",
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Step 5",
              style: TextStyle(
                color: AppColors.textWhite,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
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
