import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/components/cards/layanan_card.dart';
import 'package:labkesda_mobile/presentation/components/cards/welcome_card.dart';
import 'package:labkesda_mobile/presentation/components/carousels/promo_carousel.dart';
import 'package:labkesda_mobile/presentation/components/headers/logo_labkesda_header.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const LogoLabkesdaHeader(),
                const SizedBox(height: 20),
                const WelcomeCard(),
                const SizedBox(height: 30),
                Text(
                  'Layanan Labkesda',
                  style: AppStyle.titleFeature,
                ),
                const SizedBox(height: 10),
                const LayananCard(),
                const SizedBox(height: 30),
                Text(
                  'Penawaran Spesial',
                  style: AppStyle.titleFeature,
                ),
                const SizedBox(
                  height: 10,
                ),
                const PromoCarousel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
