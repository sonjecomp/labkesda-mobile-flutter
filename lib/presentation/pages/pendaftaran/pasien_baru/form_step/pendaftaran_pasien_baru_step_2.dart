import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/input/radio_input.dart';
import 'package:labkesda_mobile/presentation/controllers/categories/category_provider.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';

class PendaftaranPasienBaruStep2 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep2({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agamaState = ref.watch(agamaProvider);
    final jenisKelaminState = ref.watch(jenisKelaminProvider);
    final statusPerkawinanState = ref.watch(statusPerkawinanProvider);
    final pendidikanState = ref.watch(pendidikanProvider);
    final pekerjaanState = ref.watch(pekerjaanProvider);
    // final agama = useState<List<ValueDropdown>>([]);
    // final jenisKelamin = useState<List<ValueDropdown>>([]);
    // final statusPerkawinan = useState<List<ValueDropdown>>([]);
    // final pendidikan = useState<List<ValueDropdown>>([]);
    // final pekerjaan = useState<List<ValueDropdown>>([]);

    final Map selectedValues = {
      "agama": useState<String?>(null),
      "jenisKelamin": useState<String?>(null),
      "statusPerkawinan": useState<String?>(null),
      "pendidikan": useState<String?>(null),
      "pekerjaan": useState<String?>(null),
    };

    // useEffect(() {
    //   CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("3"))
    //       .then((value) => jenisKelamin.value = value)
    //       .catchError((e) => jenisKelamin.value = []);
    //   CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("7"))
    //       .then((value) => statusPerkawinan.value = value)
    //       .catchError((e) => statusPerkawinan.value = []);
    //   CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("6"))
    //       .then((value) => pendidikan.value = value)
    //       .catchError((e) => pendidikan.value = []);
    //   CategoryController.getDataForDropDown(AppEndpoints.getCategoryById("20"))
    //       .then((value) => pekerjaan.value = value)
    //       .catchError((e) => pekerjaan.value = []);
    //   return;
    // }, []);

    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: AppStyle.formContainerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const TitleForm(
            title: "Pendaftaran\nPasien Baru",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pilih Agama',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: agamaState.maybeWhen(orElse: () => [], data: (data) => data),
            selectedValue: selectedValues["agama"],
            isDisabled: agamaState.isLoading,
            placeHolder: agamaState.isLoading ? "Loading..." : "--Pilih agama--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Jenis Kelamin',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          jenisKelaminState.when(
            data: (data) {
              return RadioInput(
                values: data,
                selectedValue: selectedValues["jenisKelamin"],
              );
            },
            error: (error, stackTrace) {
              return SizedBox(
                height: 45,
                child: Text(
                  'Error',
                  style: AppStyle.inputLabel.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              );
            },
            loading: () {
              return SizedBox(
                height: 45,
                child: Text(
                  'Loading...',
                  style: AppStyle.inputLabel.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              );
            },
          ),
          // jenisKelamin.value.isEmpty
          //     ? SizedBox(
          //         height: 45,
          //         child: Text(
          //           'Loading...',
          //           style: AppStyle.inputLabel.copyWith(
          //             color: AppColors.textWhite,
          //           ),
          //         ),
          //       )
          //     : RadioInput(
          //         values: jenisKelamin.value,
          //         selectedValue: selectedValues["jenisKelamin"],
          //       ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Status Perkawinan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: statusPerkawinanState.maybeWhen(orElse: () => [], data: (data) => data),
            isDisabled: statusPerkawinanState.isLoading,
            selectedValue: selectedValues["statusPerkawinan"],
            placeHolder: statusPerkawinanState.isLoading ? "Loading..." : "--Pilih status perkawinan--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pendidikan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: pendidikanState.maybeWhen(orElse: () => [], data: (data) => data),
            isDisabled: pendidikanState.isLoading,
            selectedValue: selectedValues["pendidikan"],
            placeHolder: pendidikanState.isLoading ? "Loading..." : "--Pilih pendidikan--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pekerjaan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: pekerjaanState.maybeWhen(orElse: () => [], data: (data) => data),
            isDisabled: pekerjaanState.isLoading,
            selectedValue: selectedValues["pekerjaan"],
            placeHolder: pekerjaanState.isLoading ? "Loading..." : "--Pilih pekerjaan--",
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepperButton(
                text: "Kembali",
                buttonType: "prev",
                onPressed: () {
                  currIndexStepper.value--;
                  stepScrollController.jumpTo(0);
                },
              ),
              StepperButton(
                text: "Lanjutkan",
                buttonType: "next",
                onPressed: () {
                  if (selectedValues.values.any((element) => element.value == null)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Center(
                          child: Text(
                            "Semua data wajib diisi!",
                          ),
                        ),
                      ),
                    );
                  } else {
                    currIndexStepper.value++;
                    stepScrollController.jumpTo(0);
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
