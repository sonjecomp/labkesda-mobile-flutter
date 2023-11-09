import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/buttons/fiture_button.dart';
import 'package:labkesda_mobile/presentation/components/cards/slider_card.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              AppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                title: Row(
                  children: [
                    Image.asset(
                      AppAssets.lampungCoa,
                      width: 35,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Balai\nLaboratorium\nKesehatan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        height: 1,
                      ),
                    )
                  ],
                ),
                titleSpacing: 0,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF093545),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mulailah',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF7F7F7),
                            ),
                          ),
                          Text(
                            'Pelajari lebih\nlanjut tentang\nperawatan primer',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFF7F7F7),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppAssets.headerimg,
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Layanan Labkesda',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFED8F27),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    AppStyle.boxShadow,
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FitureButton(
                        image: AppAssets.pendaftaranLogo,
                        text: 'Pendaftaran\n',
                        onTap: () {
                          context.push("/pilih-status-pendaftaran");
                        },
                      ),
                      const FitureButton(
                        image: AppAssets.hasilPemeriksaanLogo,
                        text: 'Hasil\nPemeriksaan',
                      ),
                      const FitureButton(
                        image: AppAssets.riwayatPemerikasaanLogo,
                        text: 'Riwayat\nPemeriksaan',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Penawaran Spesial',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  aspectRatio: 16 / 7,
                  autoPlay: true,
                ),
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        const SliderCard(),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     context.go("/riwayat-pemeriksaan");
              //   },
              //   child: const Text("riawat"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
