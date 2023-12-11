import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/layanan/layanan.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/jenis_layanan/jenis_layanan.dart';
import 'package:labkesda_mobile/presentation/controllers/jenis_layanan/jenis_layanan_controller.dart';

class LayananTesCard extends HookConsumerWidget {
  const LayananTesCard({super.key, required this.layanan});

  final Layanan layanan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jenisLayanan = ref.watch(jenisLayananControllerProvider);

    String getJenisLayananName(String id) {
      final JenisLayanan? data = jenisLayanan.maybeWhen(
        data: (data) {
          if (data.isEmpty) {
            return null;
          }

          return data.firstWhere(
            (element) => element.id == id,
          );
        },
        orElse: () => null,
      );

      return data?.name ?? '';
    }

    return Material(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Ink(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.secondary,
                boxShadow: [
                  AppStyle.boxShadow,
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      layanan.name,
                      maxLines: 2,
                      style: const TextStyle(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    layanan.jenisTindakanId != ""
                        ? getJenisLayananName(layanan.jenisTindakanId!)
                        : 'Layanan',
                    style: const TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.yellowCyanColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Text(
                  layanan.harga,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
