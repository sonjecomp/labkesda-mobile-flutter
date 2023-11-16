import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranInstansiBaruAdaMouStep4 extends HookConsumerWidget {
  const PendaftaranInstansiBaruAdaMouStep4(
      {super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: AppStyle.formContainerDecoration,
      child: Center(
        child: Text(
          'Pendaftaran Instansi Baru Ada Mou Step 4',
          style: AppStyle.titleFeature,
        ),
      ),
    );
  }
}
