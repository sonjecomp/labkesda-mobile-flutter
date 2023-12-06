import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

class DetailPenawaranPromo extends HookConsumerWidget {
  final String promoId;
  const DetailPenawaranPromo({super.key, required this.promoId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Detail Penawaran',
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
