import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class LayananTesCard extends HookConsumerWidget {
  const LayananTesCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      width: 340,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.yellowCyanColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          AppStyle.boxShadow,
        ],
      ),
    );
  }
}
