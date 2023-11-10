import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranInstansiBaru extends StatefulWidget {
  const PendaftaranInstansiBaru({super.key});

  @override
  State<PendaftaranInstansiBaru> createState() =>
      _PendaftaranInstansiBaruState();
}

class _PendaftaranInstansiBaruState extends State<PendaftaranInstansiBaru> {
  final List<ValueDropdown> jenisInstansi = [
    ValueDropdown(
      teks: "Tanpa MOU",
      value: "tanpa-mou",
    ),
    ValueDropdown(
      teks: "Ada MOU",
      value: "ada-mou",
    ),
  ];
  String? _selectedItem;
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeaderPages(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: AppStyle.formContainerDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleForm(
                          title: "Pendaftaran\nInstansi Baru",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tipe Instansi',
                                style: AppStyle.inputLabel,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              DropdownButtonFormField<String>(
                                value: _selectedItem,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: const Color(0xFFF7F7F7),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  hintText: "--Pilih tipe instansi--",
                                ),
                                items: jenisInstansi.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e.value,
                                    child: Text(
                                      e.teks,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? selectedItem) => {
                                  setState(() {
                                    _selectedItem = selectedItem;
                                  }),
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              DirectButton(
                                onPressed: () {
                                  if (_selectedItem == null) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        shape: Border.all(
                                          style: BorderStyle.none,
                                          color: AppColors.whiteColor,
                                        ),
                                        title: const Text('PERINGATAN!'),
                                        content: const Text(
                                          'Wajib memilih jenis instansi!',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blueAccent,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  context.push(
                                    "/pilih-status-pendaftaran/instansi-baru/${_selectedItem!}",
                                  );
                                },
                                text: "SELANJUTNYA",
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
