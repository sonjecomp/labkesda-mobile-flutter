import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/headers/logo_labkesda_header.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(
                //       AppAssets.lampungCoa,
                //       height: 100,
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     const Text(
                //       'Balai\nLaboratorium\nKesehatan',
                //       style: TextStyle(
                //         fontSize: 24,
                //         fontWeight: FontWeight.bold,
                //         color: AppColors.primary,
                //       ),
                //     ),
                //   ],
                // ),
                const LogoLabkesdaHeader(),
                const SizedBox(
                  height: 20,
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
                            'Layanan Pemeriksaan Covid',
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
                            'Layanan Pemeriksaan Lainnya',
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
                            'Layanan Melalui Surel',
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
                                size: 16,
                                color: AppColors.textWhite,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  'Jl. dr. Sam Ratulangi No. 103 Penengahan, Bandar Lampung. Kode Pos 35112.',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.textWhite,
                                  ),
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
