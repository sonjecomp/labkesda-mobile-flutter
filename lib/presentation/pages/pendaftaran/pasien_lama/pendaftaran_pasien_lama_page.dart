import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienLama extends StatelessWidget {
  const PendaftaranPasienLama({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Kembali',
      ),
      // appBar: AppBar(
      //   title: Text(
      //     'Kembali',
      //     style: AppStyle.titleAppBar,
      //   ),
      // ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FormPendaftaranPasienLama(),
        ),
      ),
    );
  }
}

class FormPendaftaranPasienLama extends StatefulWidget {
  const FormPendaftaranPasienLama({super.key});

  @override
  State<FormPendaftaranPasienLama> createState() =>
      _FormPendaftaranPasienLamaState();
}

class _FormPendaftaranPasienLamaState extends State<FormPendaftaranPasienLama> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: AppStyle.formContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleForm(
                  title: "Pendaftaran\nPasien Lama",
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'NIK/Kode Pendaftaran',
                  style: AppStyle.inputLabel,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: AppStyle.inputTextFormDecoration(
                    hintText: 'Masukkan NIK atau kode pendaftaran',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tanggal Kunjungan',
                  style: AppStyle.inputLabel,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  readOnly: true,
                  decoration: AppStyle.inputTextFormDecoration(
                    hintText: DateFormat('dd-MM-yyyy')
                        .format(DateTime.now())
                        .toString(),
                    suffixIcon: const Icon(Icons.date_range),
                  ),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2030),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const DirectButton(
                  text: 'SIMPAN',
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
