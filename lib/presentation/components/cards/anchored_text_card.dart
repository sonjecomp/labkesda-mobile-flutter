import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class AnchoredTextCard extends HookConsumerWidget {
  final VoidCallback onTap;
  final String text;
  final String anchorText;
  const AnchoredTextCard({
    super.key,
    required this.onTap,
    this.text =
        'Silakan cek email anda dan Lakukan verifikasi email anda, atau Belum Mendapatkan email ?',
    this.anchorText = 'Kirim Verifikasi Email',
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.attentionContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: RichText(
        text: TextSpan(
          text: '$text ',
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.attentionText,
          ),
          children: [
            TextSpan(
              text: anchorText,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.linkedText,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
