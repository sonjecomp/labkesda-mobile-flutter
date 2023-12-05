import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

final Map dataPromo = {
  'promo_id': 1,
  'promo_title': 'Hari Pahlawan',
  'promo_desc':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget aliquam quam. Ut eget nisl quis nisl aliquam aliquet. Nulla facilisi.',
  'promo_image': 'https://picsum.photos/200/300',
  'promo_start_date': '2021-11-10',
  'promo_end_date': '2021-11-12',
  'promo_active': true,
};

class DetailPenawaranPromo extends HookConsumerWidget {
  const DetailPenawaranPromo({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Penawaran',
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(''),
          ),
        ],
      ),
    );
  }
}
