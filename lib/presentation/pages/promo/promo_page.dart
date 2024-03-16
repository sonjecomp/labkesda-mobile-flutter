import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/promo_content/promo_models.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailPenawaranPromo extends HookConsumerWidget {
  const DetailPenawaranPromo({super.key, required this.detailPromo});

  final PromoModels detailPromo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promoStartDate = DateFormat('dd', 'id_ID').format(DateTime.parse(detailPromo.startDate));
    final promoDueDate = DateFormat('dd MM yyyy', 'id_ID').format(DateTime.parse(detailPromo.dueDate));
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Detail Penawaran',
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: FadeInImage(
                  image: NetworkImage(detailPromo.coverImage),
                  placeholder: const AssetImage(
                    AppAssets.carouselDump,
                  ),
                  imageErrorBuilder: (context, error, stackTrace) => const Image(
                    image: AssetImage(
                      AppAssets.carouselDump,
                    ),
                  ),
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
                    height: 5,
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
                    height: 5,
                  ),
                  // Text(
                  //   detailPromo.termsAndConditions,
                  //   style: AppStyle.contentDescText,
                  // )
                  HtmlWidget(
                    detailPromo.termsAndConditions,
                    renderMode: RenderMode.column,
                    customStylesBuilder: (element) {
                      if (element.localName == 'h1' ||
                          element.localName == 'h2' ||
                          element.localName == 'h3' ||
                          element.localName == 'h4' ||
                          element.localName == 'h5' ||
                          element.localName == 'h6' ||
                          element.localName == 'p' ||
                          element.localName == 'a' ||
                          element.localName == 'span' ||
                          element.localName == 'div') {
                        return {
                          'font-size': '12px',
                          'font-weight': '400',
                        };
                      }
                      if (element.localName == 'ul' || element.localName == 'ol') {
                        return {
                          'padding-left': '18px',
                          'font-size': '12px',
                          'font-weight': '400',
                        };
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
