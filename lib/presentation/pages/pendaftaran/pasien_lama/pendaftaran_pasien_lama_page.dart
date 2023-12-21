import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_lama/form_step/pendaftaran_pasien_lama_step_1.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_lama/form_step/pendaftaran_pasien_lama_step_2.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_lama/form_step/pendaftaran_pasien_lama_step_3.dart';

final stepScrollController = ScrollController();

class PendaftaranPasienLama extends HookConsumerWidget {
  const PendaftaranPasienLama({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = useState<int>(0);

    final List inputController =
        List.generate(12, (index) => useTextEditingController());

    final List<Step> steps = [
      Step(
        title: const Text(""),
        content: PendaftaranPasienLamaStep1(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 0,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranPasienLamaStep2(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 1,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranPasienLamaStep3(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 2,
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Kembali",
        forceMaterialTransparency: true,
      ),
      body: Stepper(
        steps: steps,
        controller: stepScrollController,
        type: StepperType.horizontal,
        elevation: 0,
        controlsBuilder: (context, details) => Container(),
        currentStep: currIndex.value,
        onStepContinue: () {
          if (currIndex.value < steps.length - 1) {
            currIndex.value++;
            stepScrollController.animateTo(
              stepScrollController.offset + 100,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        },
        onStepCancel: () {
          if (currIndex.value > 0) {
            currIndex.value--;
            stepScrollController.animateTo(
              stepScrollController.offset - 100,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        },
        onStepTapped: (index) {
          currIndex.value = index;
        },
      ),
    );
  }
}
