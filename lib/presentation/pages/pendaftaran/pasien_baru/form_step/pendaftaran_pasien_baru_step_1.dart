import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:labkesda_mobile/presentation/controllers/categories/category_provider.dart';
import 'package:labkesda_mobile/presentation/pages/pendaftaran/instansi_baru/ada_mou/pendaftaran_instansi_baru_ada_mou.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';
import 'package:labkesda_mobile/presentation/components/input/dropdown_input.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';
import 'package:labkesda_mobile/presentation/components/layouts/title_form_layout.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';

class PendaftaranPasienBaruStep1 extends HookConsumerWidget {
  const PendaftaranPasienBaruStep1({super.key, required this.currIndexStepper, required this.inputController});

  final ValueNotifier<int> currIndexStepper;
  final List inputController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kewarganegaraanState = ref.watch(kewarganegaraanProvider);

    final selectedKewarganegaraan = useState<String?>(null);
    final selectedDate = useState(DateTime.now());
    final dateController = useTextEditingController();
    final namaController = useTextEditingController();
    final nikController = useTextEditingController();
    final tempatLahirController = useTextEditingController();

    useEffect(() {
      print("ASDUHAUIDHAUIDSAHUI ${selectedKewarganegaraan.value}");
      if (selectedKewarganegaraan.value != null) {
        inputController[4].text = selectedKewarganegaraan.value!;
      }
    }, [selectedKewarganegaraan.value]);

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
            'Nama',
            style: AppStyle.inputLabel,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormFieldInput(
            controller: inputController[0],
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
          TextFormFieldInput(
            controller: inputController[1],
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
            controller: inputController[2],
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
            controller: inputController[3],
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
                inputController[3].text = DateFormat('dd/MM/yyyy').format(value).toString();
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
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              if (dateController.value.text.isEmpty ||
                  selectedKewarganegaraan.value == null ||
                  namaController.value.text.isEmpty ||
                  nikController.value.text.isEmpty ||
                  tempatLahirController.value.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.startToEnd,
                    showCloseIcon: true,
                    content: Text('Mohon lengkapi data terlebih dahulu!'),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                currIndexStepper.value++;
                stepScrollController.jumpTo(0);
              }
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
