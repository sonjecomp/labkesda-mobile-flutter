import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/endpoints.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/step_buttton.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/controllers/geo/geo_provider.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienBaruStep3 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep3({
    super.key,
    required this.currIndexStepper,
    required this.inputController,
  });

  final List inputController;
  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provinsiState = ref.watch(provinsiProvider);

    final Map selectedValues = {
      "provinsi": useState<String?>(null),
      "kabupaten": useState<String?>(null),
      "kecamatan": useState<String?>(null),
      "kelurahan": useState<String?>(null),
    };
    // List data dropdown
    final listKabupaten = useState<List<ValueDropdown>>([]);
    final listKecamatan = useState<List<ValueDropdown>>([]);
    final listKelurahan = useState<List<ValueDropdown>>([]);

    Future<List<ValueDropdown>> getDataForDropdown(String url) async {
      try {
        final Dio dio = Dio();
        final Response response = await dio.get(url);
        final List<ValueDropdown> data = (response.data as List)
            .map((e) => ValueDropdown.fromJson(e))
            .toList();
        return data;
      } catch (e) {
        return [];
      }
    }

    useEffect(() {
      if (selectedValues["provinsi"].value != null) {
        inputController[13].text = selectedValues["provinsi"].value;
      }
      if (selectedValues["kabupaten"].value != null) {
        inputController[14].text = selectedValues["kabupaten"].value;
      }
      if (selectedValues["kecamatan"].value != null) {
        inputController[15].text = selectedValues["kecamatan"].value;
      }
      if (selectedValues["kelurahan"].value != null) {
        inputController[16].text = selectedValues["kelurahan"].value;
      }
      return;
    }, [
      selectedValues["provinsi"].value,
      selectedValues["kabupaten"].value,
      selectedValues["kecamatan"].value,
      selectedValues["kelurahan"].value
    ]);

    useEffect(() {
      // useEffect for get data dropdown kabupaten
      void getData() async {
        selectedValues["kabupaten"].value = null;
        final List<ValueDropdown> response = await getDataForDropdown(
          AppEndpoints.getAllKabupatenByProvinsiId(
            selectedValues["provinsi"].value.toString(),
          ),
        );
        listKabupaten.value = response;
      }

      if (selectedValues["provinsi"].value != null) {
        getData();
      }
      return () {};
    }, [selectedValues["provinsi"].value]);

    useEffect(() {
      // useEffect for get data dropdown kecamatan
      void getData() async {
        selectedValues["kecamatan"].value = null;
        final List<ValueDropdown> response = await getDataForDropdown(
          AppEndpoints.getAllKecamatanByKabupatenId(
            selectedValues["kabupaten"].value.toString(),
          ),
        );
        listKecamatan.value = response;
      }

      if (selectedValues["kabupaten"].value != null) {
        getData();
      }
      return () {};
    }, [selectedValues["kabupaten"].value]);

    useEffect(() {
      // useEffect for get data dropdown kelurahan
      void getData() async {
        selectedValues["kelurahan"].value = null;
        final List<ValueDropdown> response = await getDataForDropdown(
          AppEndpoints.getAllKelurahanByKecamatanId(
            selectedValues["kecamatan"].value.toString(),
          ),
        );
        listKelurahan.value = response;
      }

      if (selectedValues["kecamatan"].value != null) {
        getData();
      }
      return () {};
    }, [selectedValues["kecamatan"].value]);

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
            'Provinsi',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            values: provinsiState.maybeWhen(
              orElse: () => [],
              data: (data) => data,
            ),
            selectedValue: selectedValues["provinsi"],
            isDisabled: provinsiState.isLoading,
            placeHolder:
                provinsiState.isLoading ? "Loading..." : "--Pilih Provinsi--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kabupaten',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            isDisabled: selectedValues["provinsi"].value == null,
            values: listKabupaten.value.isNotEmpty
                ? listKabupaten.value
                : [ValueDropdown(teks: "?", value: "?")],
            selectedValue: selectedValues["kabupaten"],
            placeHolder: "--Pilih Kabupaten--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kecamatan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            isDisabled: selectedValues["kabupaten"].value == null,
            values: listKecamatan.value.isNotEmpty
                ? listKecamatan.value
                : [ValueDropdown(teks: "?", value: "?")],
            selectedValue: selectedValues["kecamatan"],
            placeHolder: "--Pilih Kecamatan--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kelurahan',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownInput(
            isDisabled: selectedValues["kecamatan"].value == null,
            values: listKelurahan.value.isNotEmpty
                ? listKelurahan.value
                : [ValueDropdown(teks: "?", value: "?")],
            selectedValue: selectedValues["kelurahan"],
            placeHolder: "--Pilih Kelurahan--",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kode Pos',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            keyboardType: TextInputType.number,
            placeHolder: 'Masukan kode pos',
            controller: inputController[17],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StepperButton(
                text: "Kembali",
                onPressed: () {
                  currIndexStepper.value--;
                  stepScrollController.jumpTo(0);
                },
                buttonType: "prev",
              ),
              StepperButton(
                text: "Lanjutkan",
                buttonType: "next",
                onPressed: () {
                  for (var i = 13; i <= 17; i++) {
                    print(
                        "inputController[$i].text = ${inputController[i].text}");
                  }
                  // if (selectedValues.values
                  //         .any((element) => element.value == null) ||
                  //     kodePosController.value.text.isEmpty) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       behavior: SnackBarBehavior.floating,
                  //       dismissDirection: DismissDirection.startToEnd,
                  //       showCloseIcon: true,
                  //       content: Text('Mohon lengkapi data terlebih dahulu'),
                  //       backgroundColor: Colors.red,
                  //     ),
                  //   );
                  // } else {
                  //   currIndexStepper.value++;
                  //   stepScrollController.jumpTo(0);
                  // }
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
