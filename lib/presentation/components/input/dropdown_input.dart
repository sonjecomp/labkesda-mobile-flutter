import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/models/value_dropdown/value_dropdown.dart';

class DropdownInput extends HookConsumerWidget {
  const DropdownInput(
      {super.key,
      required this.values,
      required this.selectedValue,
      this.isDisabled,
      this.placeHolder});

  final List<ValueDropdown> values;
  final ValueNotifier selectedValue;
  final String? placeHolder;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      value: selectedValue.value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFF7F7F7),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: placeHolder ?? "Placeholder",
        hintStyle: const TextStyle(fontSize: 12),
      ),
      items: values.isNotEmpty
          ? values.map(
              (e) {
                return DropdownMenuItem<String>(
                  value: e.value,
                  child: Text(
                    e.teks,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ).toList()
          : [
              const DropdownMenuItem<String>(
                value: "-",
                child: Text("Loading", style: TextStyle(fontSize: 12)),
              )
            ],
      onChanged: isDisabled == true
          ? null
          : (String? selectedItem) {
              selectedValue.value = selectedItem;
            },
    );
  }
}
