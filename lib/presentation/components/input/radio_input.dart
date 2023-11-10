import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class RadioInput extends HookConsumerWidget {
  const RadioInput(
      {super.key, required this.values, required this.selectedValue});
  final List<ValueDropdown> values;
  final ValueNotifier selectedValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: values.map((e) {
        return Row(
          children: [
            Radio<String>(
              value: e.value,
              groupValue: selectedValue.value,
              onChanged: (String? value) {
                selectedValue.value = value;
              },
              activeColor: AppColors.linkedText,
              // visualDensity: VisualDensity.compact,
            ),
            Text(
              e.teks,
              style: AppStyle.inputLabel,
            ),
          ],
        );
      }).toList(),
    );
  }
}
