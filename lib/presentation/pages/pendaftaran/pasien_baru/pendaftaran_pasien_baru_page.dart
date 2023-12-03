import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/controllers/pemeriksaan/pemeriksaan_controller.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/form_step/pendaftaran_pasien_baru_step_1.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/form_step/pendaftaran_pasien_baru_step_2.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/form_step/pendaftaran_pasien_baru_step_3.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/form_step/pendaftaran_pasien_baru_step_4.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/form_step/pendaftaran_pasien_baru_step_5.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/form_step/pendaftaran_pasien_baru_step_6.dart';

final stepScrollController = ScrollController();

class PendaftaranPasienBaru extends HookConsumerWidget {
  const PendaftaranPasienBaru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = useState<int>(0);

    final List inputController = List.generate(29, (index) => useTextEditingController());

    final List<Step> steps = [
      Step(
        title: const Text(""),
        content: PendaftaranPasienBaruStep1(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 0,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranPasienBaruStep2(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 1,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranPasienBaruStep3(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 2,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranPasienBaruStep4(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 3,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranPasienBaruStep5(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 4,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranPasienBaruStep6(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 5,
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Kembali',
        forceMaterialTransparency: true,
      ),
      body: Stepper(
        steps: steps,
        controller: stepScrollController,
        type: StepperType.horizontal,
        currentStep: currIndex.value,
        elevation: 0,
        controlsBuilder: (context, details) => Container(),
        onStepContinue: () {
          if (currIndex.value < steps.length - 1) {
            currIndex.value++;
          } else {
            PemeriksaanController().createPemeriksaanBaru(inputController);
          }
        },
        onStepCancel: () {
          if (currIndex.value > 0) {
            currIndex.value--;
          }
        },
        onStepTapped: (index) {
          stepScrollController.jumpTo(0);
          currIndex.value = index;
        },
      ),
    );
  }
}
