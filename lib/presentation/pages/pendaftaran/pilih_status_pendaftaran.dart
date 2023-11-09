import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';

class PilihStatusPendaftaran extends StatefulWidget {
  const PilihStatusPendaftaran({super.key});

  @override
  State<PilihStatusPendaftaran> createState() => _PilihStatusPendaftaranState();
}

class _PilihStatusPendaftaranState extends State<PilihStatusPendaftaran> {
  final List<ValueDropdown> daftarStatus = [
    ValueDropdown(
      value: "pasien-baru",
      teks: "Pasien Baru",
    ),
    ValueDropdown(
      value: "pasien-lama",
      teks: "Pasien Lama",
    ),
    ValueDropdown(
      value: "instansi-baru",
      teks: "Instansi Baru",
    ),
    ValueDropdown(
      value: "instansi-lama",
      teks: "Instansi Lama",
    ),
  ];
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Menu Utama',
            style: AppStyle.titleAppBar,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeaderPages(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleForm(title: "Status\nPendaftaran"),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lanjutkan Sebagai',
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
                                  hintText: "--Pilih Status Pendaftaran--",
                                ),
                                items: daftarStatus.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e.value,
                                    child: Text(e.teks),
                                  );
                                }).toList(),
                                onChanged: (String? selectedItem) {
                                  setState(() {
                                    _selectedItem = selectedItem;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        DirectButton(
                          text: "LANJUTKAN",
                          onPressed: () {
                            if (_selectedItem == null) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: Border.all(
                                    style: BorderStyle.none,
                                    color: AppColors.whiteColor,
                                  ),
                                  title: const Text('PERINGATAN!'),
                                  content: const Text(
                                    'Wajib memilih status pendaftaran!',
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
                              "/pilih-status-pendaftaran/${_selectedItem!}",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
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
