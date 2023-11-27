import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';

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
                const HeaderPages(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: AppStyle.formContainerDecoration,
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    bottom: 40,
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleForm(
                        title: "Kontak\nKami",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Layanan Pemeriksaan Covid',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColors.textWhite,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 14,
                            color: AppColors.textWhite,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            '0811 722 020',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textWhite,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.copy,
                              size: 14,
                              color: AppColors.textWhite,
                            ),
                            onTap: () async {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              await Clipboard.setData(
                                const ClipboardData(
                                  text: '0811722020',
                                ),
                              ).then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Nomor telepon disalin di clipboard',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Layanan Pemeriksaan Lainnya',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColors.textWhite,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 14,
                            color: AppColors.textWhite,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            '0811 7839 532',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textWhite,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.copy,
                              size: 14,
                              color: AppColors.textWhite,
                            ),
                            onTap: () async {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              await Clipboard.setData(
                                const ClipboardData(
                                  text: '08117839532',
                                ),
                              ).then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Nomor telepon disalin di clipboard',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Fax',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColors.textWhite,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.mail,
                            size: 14,
                            color: AppColors.textWhite,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            'example@email.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textWhite,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            child: const Icon(
                              Icons.copy,
                              size: 14,
                              color: AppColors.textWhite,
                            ),
                            onTap: () async {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              await Clipboard.setData(
                                const ClipboardData(
                                  text: 'example@email.com',
                                ),
                              ).then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Email disalin di clipboard',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Lokasi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: AppColors.textWhite,
                        ),
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.room,
                            size: 14,
                            color: AppColors.textWhite,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              'Jl. dr. Sam Ratulangi No. 103 Penengahan, Bandar Lampung. Kode Pos 35112.',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
