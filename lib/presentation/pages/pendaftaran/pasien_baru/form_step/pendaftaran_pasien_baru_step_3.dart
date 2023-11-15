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
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienBaruStep3 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep3({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Selected value dropdown
    final selectedValueProvinsi = useState<String?>(
      null,
    );
    final selectedValueKabupaten = useState<String?>(
      null,
    );
    final selectedValueKecamatan = useState<String?>(
      null,
    );
    final selectedValueKelurahan = useState<String?>(
      null,
    );

    // List data dropdown
    final listProvinsi = useState<List<ValueDropdown>>([]);
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
      // useEffect for get data dropdown provinsi
      void getData() async {
        final List<ValueDropdown> response =
            await getDataForDropdown(AppEndpoints.getAllProvinsi);
        listProvinsi.value = response;
      }

      getData();
      return () {};
    }, []);

    useEffect(() {
      // useEffect for get data dropdown kabupaten
      void getData() async {
        selectedValueKabupaten.value = null;
        final List<ValueDropdown> response = await getDataForDropdown(
          AppEndpoints.getAllKabupatenByProvinsiId(
            selectedValueProvinsi.value.toString(),
          ),
        );
        listKabupaten.value = response;
      }

      getData();
      return () {};
    }, [selectedValueProvinsi.value]);

    useEffect(() {
      // useEffect for get data dropdown kecamatan
      void getData() async {
        selectedValueKecamatan.value = null;
        final List<ValueDropdown> response = await getDataForDropdown(
          AppEndpoints.getAllKecamatanByKabupatenId(
            selectedValueKabupaten.value.toString(),
          ),
        );
        listKecamatan.value = response;
      }

      getData();
      return () {};
    }, [selectedValueKabupaten.value]);

    useEffect(() {
      // useEffect for get data dropdown kelurahan
      void getData() async {
        selectedValueKelurahan.value = null;
        final List<ValueDropdown> response = await getDataForDropdown(
          AppEndpoints.getAllKelurahanByKecamatanId(
            selectedValueKecamatan.value.toString(),
          ),
        );
        listKelurahan.value = response;
      }

      getData();
      return () {};
    }, [selectedValueKecamatan.value]);

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
            values: listProvinsi.value.isNotEmpty
                ? listProvinsi.value
                : [ValueDropdown(teks: "?", value: "?")],
            selectedValue: selectedValueProvinsi,
            placeHolder: "--Pilih Provinsi--",
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
            isDisabled: selectedValueProvinsi.value == null,
            values: listKabupaten.value.isNotEmpty
                ? listKabupaten.value
                : [ValueDropdown(teks: "?", value: "?")],
            selectedValue: selectedValueKabupaten,
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
            isDisabled: selectedValueKabupaten.value == null,
            values: listKecamatan.value.isNotEmpty
                ? listKecamatan.value
                : [ValueDropdown(teks: "?", value: "?")],
            selectedValue: selectedValueKecamatan,
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
            isDisabled: selectedValueKecamatan.value == null,
            values: listKelurahan.value.isNotEmpty
                ? listKelurahan.value
                : [ValueDropdown(teks: "?", value: "?")],
            selectedValue: selectedValueKelurahan,
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
          const TextFormFieldInput(
            keyboardType: TextInputType.number,
            placeHolder: 'Masukan kode pos',
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
                onPressed: () {
                  currIndexStepper.value++;
                  stepScrollController.jumpTo(0);
                },
                buttonType: "next",
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
