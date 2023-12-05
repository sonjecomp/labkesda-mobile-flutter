import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class DownLoadPendaftaranButton extends HookConsumerWidget {
  final VoidCallback onPressed;
  const DownLoadPendaftaranButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.attentionContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'DOWNLOAD BUKTI PENDAFTARAN',
          style: TextStyle(
            color: AppColors.attentionText,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
