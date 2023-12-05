import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:labkesda_mobile/presentation/components/cards/slider_card.dart';

final List<Map> promoContent = [
  {
    'id': 1,
    'title': 'Hari Pahlawan',
    'date': 'Berlaku hingga 01-23 Nov 2023',
    'image': 'assets/images/carousel-dump.png',
  },
  {
    'id': 2,
    'title': 'Hari Pahlawan',
    'date': 'Berlaku hingga 01-23 Nov 2023',
    'image': 'assets/images/carousel-dump.png',
  },
  {
    'id': 3,
    'title': 'Hari Pahlawan',
    'date': 'Berlaku hingga 01-23 Nov 2023',
    'image': 'assets/images/carousel-dump.png',
  },
];

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
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          const SliderCard(),
    );
  }
}
