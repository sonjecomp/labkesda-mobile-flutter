import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/pages/home/home_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/cek_pemeriksaan_page.dart';
import 'package:labkesda_mobile/presentation/pages/pemeriksaan/kontak_kami_page.dart';

class BottomBarLayout extends StatefulWidget {
  const BottomBarLayout({super.key});

  @override
  State<BottomBarLayout> createState() => BottomBarLayoutState();
}

class BottomBarLayoutState extends State<BottomBarLayout> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFDCDCDC).withOpacity(0.9),
              offset: const Offset(0, 10),
              spreadRadius: 5,
              blurRadius: 10,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: NavigationBar(
            elevation: 0,
            onDestinationSelected: (int index) {
              setState(() {
                currIndex = index;
              });
            },
            indicatorColor: AppColors.secondary,
            selectedIndex: currIndex,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: AppColors.textWhite,
                ),
                icon: Icon(Icons.home_outlined),
                label: 'Beranda',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.qr_code_scanner,
                  color: AppColors.textWhite,
                ),
                icon: Icon(Icons.qr_code_scanner_outlined),
                label: 'Cek Pemeriksaan',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.support_agent,
                  color: AppColors.textWhite,
                ),
                icon: Icon(Icons.support_agent_outlined),
                label: 'Hubungi Kami',
              ),
            ],
          ),
        ),
      ),
      body: [
        const HomePage(),
        const CekPemeriksaanPage(),
        const KontakKamiPage(),
      ][currIndex],
    );
  }
}
