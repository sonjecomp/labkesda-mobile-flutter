import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_lama/form_step/pendaftaran_instansi_lama_step_1.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_lama/form_step/pendaftaran_instansi_lama_step_2.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_lama/form_step/pendaftaran_instansi_lama_step_3.dart';

final stepScrollController = ScrollController();

class PendaftaranInstansiLama extends HookConsumerWidget {
  const PendaftaranInstansiLama({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = useState<int>(0);

    final List inputController =
        List.generate(12, (index) => useTextEditingController());

    final List<Step> steps = [
      Step(
        title: const Text(""),
        content: PendaftaranInstansiLamaStep1(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 0,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranInstansiLamaStep2(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 1,
      ),
      Step(
        title: const Text(""),
        content: PendaftaranInstansiLamaStep3(
          currIndexStepper: currIndex,
          inputController: inputController,
        ),
        isActive: currIndex.value >= 2,
      )
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
        currentStep: currIndex.value,
        elevation: 0,
        controlsBuilder: (context, details) => Container(),
        onStepContinue: () {
          if (currIndex.value < steps.length - 1) {
            currIndex.value++;
            stepScrollController.animateTo(
              stepScrollController.offset + 100,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        onStepCancel: () {
          if (currIndex.value > 0) {
            currIndex.value--;
            stepScrollController.animateTo(
              stepScrollController.offset - 100,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
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
