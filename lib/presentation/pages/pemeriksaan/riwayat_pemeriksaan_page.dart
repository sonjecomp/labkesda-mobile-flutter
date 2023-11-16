import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

class RiwayatPemeriksaanPage extends StatelessWidget {
  const RiwayatPemeriksaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'RIWAYAT PEMERIKSAAN',
      ),
      body: Center(
        child: Text("riwayat"),
      ),
    );
  }
}
