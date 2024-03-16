import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/tanpa_mou/form_step_instansi_baru_tanpa_mou/pendaftaran_instansi_baru_tanpa_mou_step_1.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/tanpa_mou/form_step_instansi_baru_tanpa_mou/pendaftaran_instansi_baru_tanpa_mou_step_2.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/tanpa_mou/form_step_instansi_baru_tanpa_mou/pendaftaran_instansi_baru_tanpa_mou_step_3.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/tanpa_mou/form_step_instansi_baru_tanpa_mou/pendaftaran_instansi_baru_tanpa_mou_step_4.dart';

final stepScrollController = ScrollController();

class PendaftaranInstansiBaruTanpaMou extends HookConsumerWidget {
  const PendaftaranInstansiBaruTanpaMou({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currIndex = useState<int>(0);
    final List<Step> steps = [
      Step(
        title: const Text(
          '',
        ),
        content: PendaftaranIsntansiBaruTanpaMouStep1(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 0,
      ),
      Step(
        title: const Text(
          '',
        ),
        content: PendaftaranIsntansiBaruTanpaMouStep2(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 1,
      ),
      Step(
        title: const Text(
          '',
        ),
        content: PendaftaranIsntansiBaruTanpaMouStep3(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 2,
      ),
      Step(
        title: const Text(
          '',
        ),
        content: PendaftaranIsntansiBaruTanpaMouStep4(
          currIndexStepper: currIndex,
        ),
        isActive: currIndex.value >= 3,
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
        // onStepTapped: (index) {
        //   stepScrollController.jumpTo(0);
        //   currIndex.value = index;
        // },
      ),
    );
  }
}
// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:labkesda_mobile/constants/colors.dart';
// import 'package:labkesda_mobile/presentation/styles/styles.dart';
// import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
// import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
// import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';

// class PendaftaranInstansiBaruTanpaMou extends StatelessWidget {
//   const PendaftaranInstansiBaruTanpaMou({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: 'Kembali',
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: FormPendaftaranInstansiBaruTanpaMou(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FormPendaftaranInstansiBaruTanpaMou extends StatefulWidget {
//   const FormPendaftaranInstansiBaruTanpaMou({super.key});

//   @override
//   State<FormPendaftaranInstansiBaruTanpaMou> createState() =>
//       _FormPendaftaranInstansiBaruTanpaMouState();
// }

// class _FormPendaftaranInstansiBaruTanpaMouState
//     extends State<FormPendaftaranInstansiBaruTanpaMou> {
//   String? _jenisKelaminPetugas = "laki-laki";
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//           child: Container(
//             width: double.infinity,
//             decoration: AppStyle.formContainerDecoration,
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const TitleForm(
//                     title: 'Pendaftaran\nInstansi Baru',
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Nama Instansi',
//                           style: AppStyle.inputLabel,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: AppColors.whiteColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 16,
//                             ),
//                             hintText: 'Masukkan nama instansi',
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Nama Petugas',
//                           style: AppStyle.inputLabel,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: AppColors.whiteColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 16,
//                             ),
//                             hintText: 'Masukkan nama lengkap petugas',
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Jenis Kelamin Petugas',
//                           style: AppStyle.inputLabel,
//                         ),
//                         Row(
//                           children: [
//                             Row(
//                               children: [
//                                 Radio(
//                                   fillColor:
//                                       const MaterialStatePropertyAll<Color>(
//                                     AppColors.linkedText,
//                                   ),
//                                   value: "laki_laki",
//                                   groupValue: _jenisKelaminPetugas,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _jenisKelaminPetugas = value;
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   'Laki-laki',
//                                   style: AppStyle.inputLabel,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               width: 50,
//                             ),
//                             Row(
//                               children: [
//                                 Radio(
//                                   fillColor:
//                                       const MaterialStatePropertyAll<Color>(
//                                     AppColors.linkedText,
//                                   ),
//                                   value: "perempuan",
//                                   groupValue: _jenisKelaminPetugas,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _jenisKelaminPetugas = value;
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   'Perempuan',
//                                   style: AppStyle.inputLabel,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'NIK Petugas',
//                           style: AppStyle.inputLabel,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: AppColors.whiteColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 16,
//                             ),
//                             hintText: 'Masukkan NIK Petugas',
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Email Instansi',
//                           style: AppStyle.inputLabel,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: AppColors.whiteColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 16,
//                             ),
//                             hintText: 'Masukkan email instansi',
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Nomor Telepon',
//                           style: AppStyle.inputLabel,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: AppColors.whiteColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 16,
//                             ),
//                             hintText: 'Masukkan nomor telepon',
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Alamat Instansi',
//                           style: AppStyle.inputLabel,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: AppColors.whiteColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 16,
//                             ),
//                             hintText: 'Masukkan alamat instansi',
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Tanggal Kunjungan',
//                           style: AppStyle.inputLabel,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         TextFormField(
//                           readOnly: true,
//                           onTap: () {
//                             showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(1999),
//                               lastDate: DateTime(2030),
//                             );
//                           },
//                           decoration: InputDecoration(
//                             suffixIcon: const Icon(Icons.date_range),
//                             filled: true,
//                             fillColor: AppColors.whiteColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 16,
//                             ),
//                             hintText: DateFormat('dd-MM-yyyy')
//                                 .format(DateTime.now())
//                                 .toString(),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 40,
//                         ),
//                         const DirectButton(
//                           text: "SELANJUTNYA",
//                         ),
//                         const SizedBox(
//                           height: 40,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
