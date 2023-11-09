import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienBaru extends StatelessWidget {
  const PendaftaranPasienBaru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kembali',
          style: AppStyle.titleAppBar,
        ),
      ),
      body: const Center(
        child: Text(
          'Pendaftaran Pasien Baru',
        ),
      ),
    );
  }
}
