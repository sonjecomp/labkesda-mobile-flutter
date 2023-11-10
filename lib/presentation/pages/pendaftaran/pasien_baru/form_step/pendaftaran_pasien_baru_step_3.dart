import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class PendaftaranPasienBaruStep3 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep3({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 'http://192.168.238.48:3001/api/v1/geo/provinsi'

    Future<List<ValueDropdown>> getData() async {
      try {
        final Response response =
            await Dio().get('http://192.168.238.48:3001/api/v1/geo/provinsi');
        print(response.data);
        final List<ValueDropdown> data =
            response.data.map((e) => ValueDropdown.fromJson(e)).toList();

        return data;
      } catch (e) {
        print(e);
        return [];
      }
    }

    final listProvinsi = useState<List<ValueDropdown>>([]);
    useEffect(() {
      void getDataProvinsi() async {
        final List<ValueDropdown> response = await getData();
        print('Memek $response');
        listProvinsi.value = response;
      }

      getDataProvinsi();
      return () {};
    }, []);

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

    final List<ValueDropdown> dummyProvinsi = [
      ValueDropdown(
        teks: 'Jawa Barat',
        value: '1',
      ),
      ValueDropdown(
        teks: 'Jawa Tengah',
        value: '2',
      ),
      ValueDropdown(
        teks: 'Jawa Timur',
        value: '3',
      ),
    ];

    final List<ValueDropdown> dummyKabupaten = [
      ValueDropdown(
        teks: 'Bandung',
        value: '1',
      ),
      ValueDropdown(
        teks: 'Cimahi',
        value: '2',
      ),
      ValueDropdown(
        teks: 'Bandung Barat',
        value: '3',
      ),
    ];

    final List<ValueDropdown> dummyKecamatan = [
      ValueDropdown(
        teks: 'Cimahi Selatan',
        value: '1',
      ),
      ValueDropdown(
        teks: 'Cimahi Tengah',
        value: '2',
      ),
      ValueDropdown(
        teks: 'Cimahi Utara',
        value: '3',
      ),
    ];

    final List<ValueDropdown> dummyKelurahan = [
      ValueDropdown(
        teks: 'Cibabat',
        value: '1',
      ),
      ValueDropdown(
        teks: 'Citeureup',
        value: '2',
      ),
      ValueDropdown(
        teks: 'Cigugur Tengah',
        value: '3',
      ),
    ];

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
                : dummyProvinsi,
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
            values: dummyKabupaten,
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
            values: dummyKecamatan,
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
            values: dummyKelurahan,
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
          DirectButton(
            text: "SELANJUTNYA",
            onPressed: () async {
              final List response = await getData();
              print(response);
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
