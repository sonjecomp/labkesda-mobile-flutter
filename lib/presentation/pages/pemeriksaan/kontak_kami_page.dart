import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class KontakKamiPage extends StatelessWidget {
  const KontakKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 110,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.lampungCoa,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Balai\nLaboratorium\nKesehatan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Layanan\nPemeriksaan Covid',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textWhite,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 18,
                                color: AppColors.textWhite,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '0811 722 020',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Layanan\nPemeriksaan Lainnya',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textWhite,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 18,
                                color: AppColors.textWhite,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '0811 7839 532',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Layanan\nMelalui Surel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textWhite,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.mail,
                                size: 18,
                                color: AppColors.textWhite,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'example@email.com',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Lokasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textWhite,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.room,
                                size: 18,
                                color: AppColors.textWhite,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Jl. dr. Sam Ratulangi No. 103 Penengahan,\nBandar Lampung. Kode Pos 35112.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              '\u00A9 Laboratorium Kesehatan Daerah 2023',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
