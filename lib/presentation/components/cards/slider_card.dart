import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/constants/doubles.dart';
import 'package:labkesda_mobile/models/promo_content/promo_models.dart';

class SliderCard extends StatelessWidget {
  final PromoModels detailPromo;
  const SliderCard({
    super.key,
    required this.detailPromo,
  });

  @override
  Widget build(BuildContext context) {
    final promoStartDate =
        DateFormat('dd', 'id_ID').format(DateTime.parse(detailPromo.startDate));
    final promoDueDate = DateFormat('dd MM yyyy', 'id_ID')
        .format(DateTime.parse(detailPromo.dueDate));

    return GestureDetector(
      onTap: () {
        context.push(
          '/detail-promo',
          extra: detailPromo,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 11, right: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFDCDCDC).withOpacity(0.9),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(AppDoubles.borderRadiusContainer),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: AppColors.secondary,
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 16 / 4.5,
                child: FadeInImage(
                  image: NetworkImage(detailPromo.coverImage),
                  placeholder: const AssetImage(
                    AppAssets.carouselDump,
                  ),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const Image(
                    image: AssetImage(
                      AppAssets.carouselDump,
                    ),
                    fit: BoxFit.cover,
                    height: 90,
                    alignment: Alignment.center,
                  ),
                  fit: BoxFit.cover,
                  height: 90,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailPromo.title,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Berlaku hingga $promoStartDate - $promoDueDate',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
