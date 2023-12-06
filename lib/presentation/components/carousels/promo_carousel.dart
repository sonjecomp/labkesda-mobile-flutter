import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/cards/slider_card.dart';
import 'package:labkesda_mobile/presentation/controllers/promo/promo_provider.dart';

class PromoCarousel extends HookConsumerWidget {
  const PromoCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promoData = ref.watch(promoProvider);
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: promoData.when(
        data: (datas) {
          return datas.isEmpty
              ? const SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Center(
                    child: Text(
                      'Promo sedang tidak tersedia',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )
              : CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 0.9,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                  ),
                  itemCount: datas.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      SliderCard(
                    id: datas[itemIndex].id,
                    title: datas[itemIndex].title,
                    startDate: DateTime.parse(datas[itemIndex].startDate),
                    dueDate: DateTime.parse(datas[itemIndex].dueDate),
                  ),
                );
        },
        loading: () {
          return const SizedBox(
            width: double.infinity,
            height: 180,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        },
        error: (e, s) {
          return const SizedBox(
            width: double.infinity,
            height: 180,
            child: Center(
              child: Text(
                'Promo sedang tidak tersedia',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
