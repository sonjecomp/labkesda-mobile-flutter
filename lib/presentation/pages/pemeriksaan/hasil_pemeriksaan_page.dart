import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

class HasilPemeriksaanPage extends StatelessWidget {
  const HasilPemeriksaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'HASIL PEMERIKSAAN',
      ),
      body: Center(
        child: Text("Hasil Pemeriksaan"),
      ),
    );
  }
}
