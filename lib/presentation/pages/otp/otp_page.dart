import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/input/digit_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/cards/verifikasi_otp_card.dart';

class OtpPage extends HookConsumerWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List inputOtpController =
        List.generate(6, (index) => useTextEditingController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Verifikasi Email',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const VerifikasiOTPCard(
            email: 'johndoe@gmail.com',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DigitInput(
                controller: inputOtpController[0],
              ),
              DigitInput(
                controller: inputOtpController[1],
              ),
              DigitInput(
                controller: inputOtpController[2],
              ),
              DigitInput(
                controller: inputOtpController[3],
              ),
              DigitInput(
                controller: inputOtpController[4],
              ),
              DigitInput(
                controller: inputOtpController[5],
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              // String otp = '';
              // for (var element in inputOtpController) {
              //   otp += element.text;
              // }
              // return otp;
            },
            child: const Text(
              'Tekan saya',
            ),
          ),
        ],
      ),
    );
  }
}
