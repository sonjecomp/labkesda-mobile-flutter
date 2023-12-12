import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class KontenTidakTersediaCard extends HookConsumerWidget {
  final String text;
  const KontenTidakTersediaCard({
    super.key,
    this.text = 'Konten tidak tersedia',
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.contentEmpty,
          width: 150,
        ),
        Text(
          text,
          style: AppStyle.contentEmpty,
        )
      ],
    );
  }
}
