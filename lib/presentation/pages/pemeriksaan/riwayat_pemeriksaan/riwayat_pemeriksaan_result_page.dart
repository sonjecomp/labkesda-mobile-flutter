import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  },
  {
    'statusPembayaran': {'id': 2, 'text': 'Pembayaran Hutang'},
    'kodePemeriksaan': 'P-20201121-0003',
    'tanggalKunjungan': '23 November 2023',
    'mendaftarSebagai': 'Pribadi',
  },
  {
    'statusPembayaran': {'id': 1, 'text': 'Pembayaran Lunas'},
    'kodePemeriksaan': 'P-20201121-0004',
    'tanggalKunjungan': '24 November 2023',
    'mendaftarSebagai': 'Instansi',
  },
  {
    'statusPembayaran': {'id': 2, 'text': 'Pembayaran Hutang'},
    'kodePemeriksaan': 'P-20201121-0005',
    'tanggalKunjungan': '25 November 2023',
    'mendaftarSebagai': 'Pribadi',
  },
  {
    'statusPembayaran': {'id': 1, 'text': 'Pembayaran Lunas'},
    'kodePemeriksaan': 'P-20201121-0006',
    'tanggalKunjungan': '26 November 2023',
    'mendaftarSebagai': 'Instansi',
  },
  {
    'statusPembayaran': {'id': 2, 'text': 'Pembayaran Hutang'},
    'kodePemeriksaan': 'P-20201121-0007',
    'tanggalKunjungan': '27 November 2023',
    'mendaftarSebagai': 'Pribadi',
  },
  {
    'statusPembayaran': {'id': 1, 'text': 'Pembayaran Lunas'},
    'kodePemeriksaan': 'P-20201121-0008',
    'tanggalKunjungan': '28 November 2023',
    'mendaftarSebagai': 'Instansi',
  },
  {
    'statusPembayaran': {'id': 2, 'text': 'Pembayaran Hutang'},
    'kodePemeriksaan': 'P-20201121-0009',
    'tanggalKunjungan': '29 November 2023',
    'mendaftarSebagai': 'Pribadi',
  },
];

class RiwayatPemeriksaanResultPage extends StatelessWidget {
  const RiwayatPemeriksaanResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'RIWAYAT PEMERIKSAAN',
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: riwayatPemeriksaan.map((riwayat) {
              return ListRiwayatCard(
                kodePemeriksaan: riwayat['kodePemeriksaan'],
                tanggalKunjungan: riwayat['tanggalKunjungan'],
                onPressed: () {
                  context.push(
                    '/riwayat-pemeriksaan/hasil-pencarian-riwayat-pemeriksaan/detail-pemeriksaan',
                  );
                },
                statusPendaftar: riwayat['mendaftarSebagai'],
                statusPembayaranText: riwayat['statusPembayaran']['text'],
                statusPembayaranId: riwayat['statusPembayaran']['id'],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
