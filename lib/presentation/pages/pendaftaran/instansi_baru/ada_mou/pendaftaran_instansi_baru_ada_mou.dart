import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/form_step_instansi_baru_tanpa_mou/pendaftaran_instansi_baru_ada_mou_step_1.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/form_step_instansi_baru_tanpa_mou/pendaftaran_instansi_baru_ada_mou_step_2.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/form_step_instansi_baru_tanpa_mou/pendaftaran_instansi_baru_ada_mou_step_3.dart';

final stepScrollController = ScrollController();

class PendaftaranInstansiBaruAdaMou extends HookConsumerWidget {
  const PendaftaranInstansiBaruAdaMou({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = useState<int>(0);
    final List<Step> steps = [
      Step(
        title: const Text(
          '',
        ),
        content: PendaftaranInstansiBaruAdaMouStep1(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 0,
      ),
      Step(
        title: const Text(
          '',
        ),
        content: PendaftaranInstansiBaruAdaMouStep2(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 1,
      ),
      Step(
        title: const Text(
          '',
        ),
        content: PendaftaranInstansiBaruAdaMouStep3(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 2,
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
        onStepTapped: (index) {
          currIndex.value = index;
          stepScrollController.animateTo(
            (index * 0.33) * stepScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        onStepContinue: () {
          if (currIndex.value < steps.length - 1) {
            currIndex.value++;
            stepScrollController.animateTo(
              (currIndex.value * 0.33) *
                  stepScrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        onStepCancel: () {
          if (currIndex.value > 0) {
            currIndex.value--;
            stepScrollController.animateTo(
              (currIndex.value * 0.33) *
                  stepScrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

// class PendaftaranInstansiBaruAdaMou extends StatelessWidget {
//   const PendaftaranInstansiBaruAdaMou({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: 'Kembali',
//         ),
//         body: Center(
//           child: Padding(
//             padding: EdgeInsets.all(8.0),
//             child: FormPendaftaranInstansiBaruAdaMou(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FormPendaftaranInstansiBaruAdaMou extends StatefulWidget {
//   const FormPendaftaranInstansiBaruAdaMou({super.key});

//   @override
//   State<FormPendaftaranInstansiBaruAdaMou> createState() =>
//       _FormPendaftaranInstansiBaruAdaMouState();
// }

// class _FormPendaftaranInstansiBaruAdaMouState
//     extends State<FormPendaftaranInstansiBaruAdaMou> {
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//           child: Column(
//             children: [
//               Text(
//                 'Pendaftaran Intansi Baru Ada Mou',
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
