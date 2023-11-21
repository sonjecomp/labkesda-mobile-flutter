import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/components/cards/list_riwayat_card.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

List<Map<String, dynamic>> riwayatPemeriksaan = [
  {
    'statusPembayaran': {'id': 1, 'text': 'Pembayaran Lunas'},
    'kodePemeriksaan': 'P-20201121-0001',
    'tanggalKunjungan': '21 November 2023',
    'mendaftarSebagai': 'Instansi',
  },
  {
    'statusPembayaran': {'id': 2, 'text': 'Pembayaran Hutang'},
    'kodePemeriksaan': 'P-20201121-0002',
    'tanggalKunjungan': '22 November 2023',
    'mendaftarSebagai': 'Pribadi',
  },
  {
    'statusPembayaran': {'id': 1, 'text': 'Pembayaran Lunas'},
    'kodePemeriksaan': 'P-20201121-0010',
    'tanggalKunjungan': '30 November 2023',
    'mendaftarSebagai': 'Instansi',
  }
];

class RiwayatPemeriksaanPage extends StatelessWidget {
  const RiwayatPemeriksaanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'RIWAYAT PEMERIKSAAN',
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: riwayatPemeriksaan.map((riwayat) {
            return ListRiwayatCard(
              kodePemeriksaan: riwayat['kodePemeriksaan'],
              tanggalKunjungan: riwayat['tanggalKunjungan'],
              onPressed: () {},
              statusPendaftar: riwayat['mendaftarSebagai'],
              statusPembayaranText: riwayat['statusPembayaran']['text'],
              statusPembayaranId: riwayat['statusPembayaran']['id'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
