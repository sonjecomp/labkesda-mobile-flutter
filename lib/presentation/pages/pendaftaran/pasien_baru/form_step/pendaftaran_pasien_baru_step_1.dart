import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/presentation/controllers/categories/category_provider.dart';
import 'package:labkesda_mobile/presentation/controllers/form_state/form_state.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/pasien_baru/pendaftaran_pasien_baru_page.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';

class PendaftaranPasienBaruStep1 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep1({super.key, required this.currIndexStepper});

  final ValueNotifier<int> currIndexStepper;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map selectedValues = {
      "nama": useState<String?>(null),
      "nik": useState<String?>(null),
      "tempat_lahir": useState<String?>(null),
      "tanggal_lahir": useState<String?>(null),
      "kewarganegaraan": useState<String?>(null),
    };
    final selectedKewarganegaraan = useState<String?>(null);
    final selectedDate = useState(DateTime.now());
    final dateController = useTextEditingController();
    final namaController = useTextEditingController();
    final nikController = useTextEditingController();
    final tempatLahirController = useTextEditingController();

    final kewarganegaraanState = ref.watch(kewarganegaraanProvider);
    // final selectedName = namaController.text;

    // final kewarganegaraan = useState<List<ValueDropdown>>([]);

    // Future<List<ValueDropdown>> getDataForDropdown(String url) async {
    //   try {
    //     final Dio dio = Dio();
    //     final Response response = await dio.get(url);
    //     final List<ValueDropdown> data = (response.data as List).map((e) => ValueDropdown.fromJson(e)).toList();
    //     return data;
    //   } catch (e) {
    //     return [];
    //   }
    // }

    // useEffect(() {
    //   void getData() async {
    //     final List<ValueDropdown> response = await getDataForDropdown(AppEndpoints.getCategoryById("9"));
    //     kewarganegaraan.value = response;
    //   }

    //   getData();
    //   return () {};
    // }, []);

    useEffect(() {
      selectedValues["nama"] = namaController.text;
      selectedValues["nik"] = nikController.text;

      dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();

      return () {};
    }, []);

    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: AppStyle.formContainerDecoration,
      child: Form(
        key: formPendaftaranPasienBaru1,
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
              'Nama',
              style: AppStyle.inputLabel,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldInput(
              controller: namaController,
              placeHolder: 'Masukan nama lengkap',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'NIK',
              style: AppStyle.inputLabel,
            ),
            const SizedBox(
              height: 5,
            ),
            const TextFormFieldInput(
              keyboardType: TextInputType.number,
              placeHolder: 'Masukan NIK',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tempat Lahir',
              style: AppStyle.inputLabel,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldInput(
              controller: tempatLahirController,
              placeHolder: 'Masukan tempat lahir',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tanggal Lahir',
              style: AppStyle.inputLabel,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldInput(
              readOnly: true,
              controller: dateController,
              placeHolder: DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
              suffixIcon: const Icon(Icons.date_range),
              onTap: () async {
                final value = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1999),
                  lastDate: DateTime(2030),
                  helpText: 'Pilih tanggal lahir',
                );
                if (value != null) {
                  dateController.text = DateFormat('dd/MM/yyyy').format(value).toString();
                  selectedDate.value = value;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Kewarganegaraan',
              style: AppStyle.inputLabel,
            ),
            const SizedBox(
              height: 5,
            ),
            DropdownInput(
              values: kewarganegaraanState.maybeWhen(
                orElse: () => [],
                data: (data) {
                  return data;
                },
              ),
              isDisabled: kewarganegaraanState.isLoading,
              selectedValue: selectedKewarganegaraan,
              placeHolder: kewarganegaraanState.isLoading ? "Loading..." : "--Pilih Kewarganegaraan--",
            ),
            const SizedBox(
              height: 40,
            ),
            DirectButton(
              text: 'Lanjutkan',
              onPressed: () {
                currIndexStepper.value++;
                stepScrollController.jumpTo(0);
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
