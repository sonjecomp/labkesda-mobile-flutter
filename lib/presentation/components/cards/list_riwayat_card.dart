import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/riwayat_pemeriksaan/riwayat_pemeriksaan.dart';
import 'package:labkesda_mobile/presentation/controllers/library/library_controller.dart';

class ListRiwayatCard extends HookConsumerWidget {
  const ListRiwayatCard({
    Key? key,
    required this.riwayatPemeriksaan,
  }) : super(key: key);

  final RiwayatPemeriksaan riwayatPemeriksaan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mendaftarSebagaiState = ref.watch(libraryControllerProvider(libraryId: int.parse(riwayatPemeriksaan.hasilPemeriksaan.tipePasienId)));
    final statusPembayaranState = ref.watch(libraryControllerProvider(libraryId: int.parse(riwayatPemeriksaan.hasilPemeriksaan.statusPembayaranId)));

    void hanleDetail() {
      context.push('/riwayat-pemeriksaan/hasil-pencarian-riwayat-pemeriksaan/detail-pemeriksaan', extra: riwayatPemeriksaan);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.15),
            offset: const Offset(0, 1.5),
            blurRadius: 3,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kunjungan pada ${DateFormat('dd MMMM yyyy', 'id_ID').format(
                  DateTime.parse(riwayatPemeriksaan.hasilPemeriksaan.waktuKunjungan),
                )}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF909090),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  hanleDetail();
                },
                child: const Row(
                  children: [
                    Text(
                      'Lihat detail',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: AppColors.linkedText,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.linkedText,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color(0xFF000000),
            thickness: 1,
            height: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Kode Pemeriksaan',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Color(0xFF000000),
            ),
          ),
          Text(
            riwayatPemeriksaan.hasilPemeriksaan.kodePemeriksaan ?? '-',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            ),
          ),
          Row(
            children: [
              const Text(
                'Mendaftar Sebagai: ',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                mendaftarSebagaiState.maybeWhen(orElse: () => '', data: (data) => data!.name ?? '-'),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Status Pembayaran: ',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                statusPembayaranState.maybeWhen(orElse: () => '', data: (data) => data!.name ?? '-'),
                style: TextStyle(
                  fontSize: 12,
                  color: statusPembayaranState.maybeWhen(
                      orElse: () => const Color(
                            0xFF000000,
                          ),
                      data: (data) => data!.id == "30" || data.id == "76" ? const Color(0xFF00BFA6) : const Color(0xFFE53935)),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
