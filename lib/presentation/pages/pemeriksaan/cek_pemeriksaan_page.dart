import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class CekPemeriksaanPage extends StatelessWidget {
  const CekPemeriksaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cek Pemeriksaan',
          style: AppStyle.titleAppBar,
        ),
      ),
      body: const Center(
        child: Text(
          'Cek Pemeriksaan Via Barcode',
        ),
      ),
    );
  }
}
