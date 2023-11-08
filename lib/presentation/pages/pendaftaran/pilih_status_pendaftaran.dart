import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/assets.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/input/select_input.dart';

const List<String> list = <String>[
  "--Pilih Status Pendaftaran--",
  "Pasien Baru",
  "Pasien Lama",
  "Instansi Baru",
  "Instansi Lama"
];

class PilihStatusPendaftaran extends StatelessWidget {
  const PilihStatusPendaftaran({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu Utama'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.lampungCoa,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Balai\nLaboratorium\nKesehatan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
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
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status\nPendaftaran',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SelectInput(
                          items: list,
                          label: "Lanjutkan Sebagai",
                          placeholder: "--Pilih Status Pendaftaran--",
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        DirectButton(
                          text: "LANJUTKAN",
                        ),
                        SizedBox(
                          height: 20,
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
