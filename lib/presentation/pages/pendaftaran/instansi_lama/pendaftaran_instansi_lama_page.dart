import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranInstansiLama extends StatelessWidget {
  const PendaftaranInstansiLama({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Kembali',
          style: AppStyle.titleAppBar,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: AppStyle.formContainerDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleForm(
                        title: "Pendaftaran\nInstansi Lama",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NIK/Kode Pendaftaran',
                              style: AppStyle.inputLabel,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 16,
                              decoration: const InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 16,
                                ),
                                fillColor: AppColors.whiteColor,
                                hintText: "Masukkan NIK/Kode Pendaftaran",
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Tanggal Kunjungan',
                              style: AppStyle.inputLabel,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1999),
                                  lastDate: DateTime(2030),
                                );
                              },
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.date_range),
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 16,
                                ),
                                fillColor: AppColors.whiteColor,
                                hintText: DateFormat('dd-MM-yyyy')
                                    .format(DateTime.now())
                                    .toString(),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const DirectButton(
                              text: "SIMPAN",
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
