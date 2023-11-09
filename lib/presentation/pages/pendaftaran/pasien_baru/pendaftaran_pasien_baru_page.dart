import 'package:flutter/material.dart';

class PendaftaranPasienBaru extends StatelessWidget {
  const PendaftaranPasienBaru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kembali',
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
