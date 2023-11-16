import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/custom_app_bar.dart';
import 'package:labkesda_mobile/presentation/components/layouts/header_layout.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranInstansiBaru extends HookConsumerWidget {
  const PendaftaranInstansiBaru({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = useState<String?>(null);
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Kembali',
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HeaderPages(),
                  const SizedBox(
                    height: 20,
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
                          const SizedBox(
                            height: 20,
                          ),
                          const TitleForm(
                            title: "Pendaftaran\nInstansi Baru",
                          ),
                          const SizedBox(
                            height: 20,
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
                                DropdownInput(
                                  values: jenisInstansi,
                                  selectedValue: selectedItem,
                                  placeHolder: "Pilih Tipe Instansi",
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                DirectButton(
                                  onPressed: () {
                                    if (selectedItem.value == null) {
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
                                      return;
                                    }
                                    context.push(
                                      "/pilih-status-pendaftaran/instansi-baru/${selectedItem.value}",
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
      ),
    );
  }
}
