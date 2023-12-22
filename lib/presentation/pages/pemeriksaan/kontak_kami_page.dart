import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/buttons/content_clipboard_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';

class KontakKamiPage extends StatelessWidget {
  const KontakKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: AppStyle.formContainerDecoration,
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  bottom: 40,
                  left: 20,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    HeaderPages(
                      textColor: AppColors.textWhite,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TitleForm(
                      title: "Informasi Kontak",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipboardContent(
                      title: 'Layanan Pemeriksaan Covid',
                      content: '0811 722 020',
                      icon: Icons.phone,
                      copiedTextMessage: 'Nomor berhasil disalin',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipboardContent(
                      title: 'Layanan Pemeriksaan Lainnya',
                      content: '0811 7839 532',
                      icon: Icons.phone,
                      copiedTextMessage: 'Nomor telepon berhasil disalin.',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipboardContent(
                      title: 'Layanan Email',
                      content: 'labkesprovlampung@gmail.com',
                      icon: Icons.mail,
                      copiedTextMessage: 'Email berhasil disalin.',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Lokasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.textWhite,
                      ),
                    ),
                    Row(
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
                            // maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
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
            ],
          ),
        ),
      ),
    );
  }
}
