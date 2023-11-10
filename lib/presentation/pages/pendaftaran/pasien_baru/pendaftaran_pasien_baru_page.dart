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
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FormPendaftaranPasienBaru(),
        ),
      ),
    );
  }
}

class FormPendaftaranPasienBaru extends StatefulWidget {
  const FormPendaftaranPasienBaru({super.key});

  @override
  State<FormPendaftaranPasienBaru> createState() =>
      _FormPendaftaranPasienBaruState();
}

class _FormPendaftaranPasienBaruState extends State<FormPendaftaranPasienBaru> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.formContainerDecoration,
      child: const Text(
        'Pendaftaran pasien baru',
      ),
    );
  }
}
