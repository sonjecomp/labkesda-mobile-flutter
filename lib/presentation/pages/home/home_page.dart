import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';
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
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const LogoLabkesdaHeader(),
                const SizedBox(
                  height: 20,
                ),
                const WelcomeCard(),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur ini belum tersedia'),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Informasi Pelayanan',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        width: MediaQuery.of(context).size.width * 0.62,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.shdadowColor,
                              offset: Offset(0, 4),
                              blurRadius: 8,
                              spreadRadius: -4,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 14,
                              color: AppColors.primary.withOpacity(.7),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Informasi Pelayanan',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.shdadowColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Layanan Labkesda',
                  style: AppStyle.titleFeature,
                ),
                const SizedBox(
                  height: 5,
                ),
                const LayananCard(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Penawaran Spesial',
                  style: AppStyle.titleFeature,
                ),
                const SizedBox(
                  height: 5,
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
