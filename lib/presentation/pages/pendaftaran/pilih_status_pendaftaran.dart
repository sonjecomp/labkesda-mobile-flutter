import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';

class PilihStatusPendaftaran extends HookConsumerWidget {
  const PilihStatusPendaftaran({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValue = useState<String?>(null);

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

    return Scaffold(
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
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleForm(title: "Status\nPendaftaran"),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lanjutkan Sebagai',
                      style: AppStyle.inputLabel,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownInput(
                      values: daftarStatus,
                      selectedValue: selectedValue,
                      placeHolder: "--Pilih Status Pendaftaran--",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DirectButton(
                      text: "LANJUTKAN",
                      onPressed: () {
                        if (selectedValue.value == null) {
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
                                  onPressed: () => Navigator.pop(context, 'OK'),
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
                          return;
                        }
                        context.push(
                          "/pilih-status-pendaftaran/${selectedValue.value}",
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
