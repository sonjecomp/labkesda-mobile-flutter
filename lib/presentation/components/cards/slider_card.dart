import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/constants/doubles.dart';

class SliderCard extends StatelessWidget {
  final int id;
  final String title;
  final DateTime startDate;
  final DateTime dueDate;
  const SliderCard({
    super.key,
    required this.id,
    required this.title,
    required this.startDate,
    required this.dueDate,
  });
  @override
  Widget build(BuildContext context) {
    final promoStartDate = DateFormat('dd', 'id_ID').format(startDate);
    final promoDueDate = DateFormat('dd MM yyyy', 'id_ID').format(dueDate);

    return GestureDetector(
      onTap: () {
        context.push(
          '/detail-promo/$id',
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
              child: Image.asset(
                AppAssets.carouselDump,
                height: 90,
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
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
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
