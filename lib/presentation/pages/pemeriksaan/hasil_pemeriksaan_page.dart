import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';

class HasilPemeriksaanPage extends StatelessWidget {
  const HasilPemeriksaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'HASIL PEMERIKSAAN',
      ),
      body: const Center(
        child: Text("Hasil Pemeriksaan"),
      ),
    );
  }
}
