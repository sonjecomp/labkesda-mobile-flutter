import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranInstansiBaruAdaMou extends StatelessWidget {
  const PendaftaranInstansiBaruAdaMou({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Kembali',
            style: AppStyle.titleAppBar,
          ),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FormPendaftaranInstansiBaruAdaMou(),
          ),
        ),
      ),
    );
  }
}

class FormPendaftaranInstansiBaruAdaMou extends StatefulWidget {
  const FormPendaftaranInstansiBaruAdaMou({super.key});

  @override
  State<FormPendaftaranInstansiBaruAdaMou> createState() =>
      _FormPendaftaranInstansiBaruAdaMouState();
}

class _FormPendaftaranInstansiBaruAdaMouState
    extends State<FormPendaftaranInstansiBaruAdaMou> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Text(
                'Pendaftaran Intansi Baru Ada Mou',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
