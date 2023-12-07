import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaketLayananCardLoading extends HookConsumerWidget {
  const PaketLayananCardLoading({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.shdadowColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        width: 160,
        height: 130,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'kjsdlfkjalsdkjflaksjdakjhfkjahsdfkhjask',
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'ajdfjasdfljahsdf',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ABCDEFGH',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 26,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
