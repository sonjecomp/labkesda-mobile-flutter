import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/promo_content/promo_models.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

class DetailPenawaranPromo extends HookConsumerWidget {
  const DetailPenawaranPromo({super.key, required this.detailPromo});

  final PromoModels detailPromo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final promoState = ref.watch(promoProvider);
    // final promoByIdData = promoState.when(
    //   data: (datas) {
    //     return datas[int.parse('$promoId')];
    //   },
    //   error: (error, stackTrace) {
    //     return {};
    //   },
    //   loading: () {},
    // );

    final promoStartDate =
        DateFormat('dd', 'id_ID').format(DateTime.parse(detailPromo.startDate));
    final promoDueDate = DateFormat('dd MM yyyy', 'id_ID')
        .format(DateTime.parse(detailPromo.dueDate));
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
                detailPromo.coverImage,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.primary.withOpacity(.3),
                  width: 1,
                ),
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailPromo.title,
                  style: AppStyle.titleAppBar,
                ),
                Text(
                  'Berlaku hingga $promoStartDate-$promoDueDate',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  style: AppStyle.contentDescTextTitle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  detailPromo.description,
                  style: AppStyle.contentDescText,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              20,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Syarat & Ketentuan',
                  style: AppStyle.contentDescTextTitle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  detailPromo.termsAndConditions,
                  style: AppStyle.contentDescText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
