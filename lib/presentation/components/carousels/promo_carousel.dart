import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/components/cards/slider_card.dart';

class PromoCarousel extends StatelessWidget {
  const PromoCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        autoPlay: true,
      ),
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => const SliderCard(),
    );
  }
}
