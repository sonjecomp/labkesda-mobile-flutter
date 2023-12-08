import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaketLayananCardLoading extends HookConsumerWidget {
  const PaketLayananCardLoading({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            AppStyle.boxShadow,
          ],
        ),
        width: 100,
        height: 100,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.shdadowColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: const Text(
                  'lkjlkkjfasdfllkjdfalsdfas',
                  maxLines: 3,
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.shdadowColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Text(
                'jkljflasdjflkasd',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
