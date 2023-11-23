import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class ListRiwayatCard extends StatelessWidget {
  final String tanggalKunjungan;
  final String kodePemeriksaan;
  final String statusPendaftar;
  final int statusPembayaranId;
  final String statusPembayaranText;
  final VoidCallback onPressed;

  const ListRiwayatCard({
    Key? key,
    required this.kodePemeriksaan,
    required this.tanggalKunjungan,
    required this.onPressed,
    required this.statusPendaftar,
    required this.statusPembayaranText,
    required this.statusPembayaranId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                'Kunjungan pada $tanggalKunjungan',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF909090),
                ),
              ),
              GestureDetector(
                onTap: onPressed,
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
            kodePemeriksaan,
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
                statusPendaftar,
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
                statusPembayaranText,
                style: TextStyle(
                  fontSize: 12,
                  color: statusPembayaranId != 1 ? Colors.amber : Colors.green,
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
