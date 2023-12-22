import 'package:flutter/material.dart';
import 'package:labkesda_mobile/models/riwayat_pemeriksaan/riwayat_pemeriksaan.dart';
import 'package:labkesda_mobile/presentation/components/cards/list_riwayat_card.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

class RiwayatPemeriksaanResultPage extends StatelessWidget {
  const RiwayatPemeriksaanResultPage({Key? key, required this.data}) : super(key: key);

  final List<RiwayatPemeriksaan> data;

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
            children: data.isNotEmpty
                ? data
                    .map(
                      (e) => ListRiwayatCard(
                        riwayatPemeriksaan: e,
                      ),
                    )
                    .toList()
                : const [
                    Center(
                      child: Text(
                        'Data tidak ditemukan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
