import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/constants/doubles.dart';
import 'package:labkesda_mobile/models/on_board/on_board.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    context.go('/');
  }

  final List<OnBoard> _dataOnboarding = [
    OnBoard(
      image: "assets/images/onboard/onboard1.png",
      title: "Selamat Datang Di Labkesda Mobile Provinsi Lampung",
      description: "Aplikasi Mobile Laboratorium Kesehatan Derah Provinsi Lampung",
    ),
    OnBoard(
      image: "assets/images/onboard/onboard2.png",
      title: "Akses Mudah & Cepat",
      description: "Nikmati pelayaan laboratorium yang mudah dan cepat dalam genggaman anda",
    ),
    OnBoard(
      image: "assets/images/onboard/onboard3.png",
      title: "Akses & Pelayanan 24 Jam",
      description: "Pelayanan laboratorium tersedia penuh selama 24 jam dapat diakses kapanpun dan dimanapun",
    ),
    OnBoard(
      image: "assets/images/onboard/onboard4.png",
      title: "Mulai Nikmati Semua Layanan",
      description: "Mulai nikmati semua layanan Laboratorium Kesehatan Daerah Provinsi Lampung",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      titlePadding: EdgeInsets.symmetric(vertical: 16.0),
      bodyTextStyle: TextStyle(
        fontSize: 16.0,
        color: AppColors.primary,
      ),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.all(30),
      imageFlex: 2,
      bodyFlex: 1,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container(
        //   width: double.infinity,
        //   height: MediaQuery.of(context).size.height * 0.2,
        //   decoration: const BoxDecoration(
        //     color: AppColors.whiteColor,
        //   ),
        //   alignment: Alignment.centerLeft,
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: const Image(
        //     image: AssetImage(
        //       AppAssets.logoWithTitle,
        //     ),
        //   ),
        // ),
        Expanded(
          child: IntroductionScreen(
            key: introKey,
            globalBackgroundColor: AppColors.whiteColor,
            globalHeader: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Image(
                image: AssetImage(
                  AppAssets.logoWithTitle,
                ),
              ),
            ),
            allowImplicitScrolling: true,
            showSkipButton: true,
            skipOrBackFlex: 0,
            nextFlex: 0,
            showBackButton: false,
            pages: _dataOnboarding.map(
              (e) {
                return PageViewModel(
                  title: e.title,
                  body: e.description,
                  decoration: pageDecoration,
                  image: Image.asset(e.image),
                );
              },
            ).toList(),
            dotsDecorator: const DotsDecorator(
              size: Size(10, 10),
              color: Color(0xFFBDBDBD),
              activeColor: AppColors.primary,
            ),
            dotsContainerDecorator: ShapeDecoration(
              color: AppColors.whiteColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppDoubles.borderRadiusContainer,
                  ),
                ),
              ),
              shadows: [
                AppStyle.boxShadow,
              ],
            ),
            onDone: () => _onIntroEnd(context),
            onSkip: () => _onIntroEnd(context),
            back: const Icon(Icons.arrow_back),
            skip: const Text(
              'Lewati',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            done: const Text(
              'Mulai',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            next: const Icon(
              Icons.arrow_forward,
              color: AppColors.primary,
            ),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
