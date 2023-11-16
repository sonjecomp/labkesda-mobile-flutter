import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/presentation/components/buttons/fiture_button.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class LayananCard extends StatelessWidget {
  const LayananCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFED8F27),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          AppStyle.boxShadow,
        ],
      ),
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
          FitureButton(
            image: AppAssets.hasilPemeriksaanLogo,
            text: 'Hasil\nPemeriksaan',
            onTap: () {
              context.push("/hasil-pemeriksaan");
            },
          ),
          FitureButton(
            image: AppAssets.riwayatPemerikasaanLogo,
            text: 'Riwayat\nPemeriksaan',
            onTap: () {
              context.push("/riwayat-pemeriksaan");
            },
          ),
        ],
      ),
    );
  }
}
