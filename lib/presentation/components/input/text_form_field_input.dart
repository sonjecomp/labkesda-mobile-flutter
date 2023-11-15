import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class TextFormFieldInput extends HookConsumerWidget {
  const TextFormFieldInput({
    super.key,
    this.placeHolder,
    this.isRequired = true,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? placeHolder;
  final bool? isRequired;
  final bool readOnly;
  final Widget? suffixIcon;
  final Function()? onTap;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      validator: isRequired == true
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi bidang ini';
              }
              return null;
            }
          : null,
      decoration: AppStyle.inputTextFormDecoration(
        hintText: placeHolder ?? 'Placeholder',
        suffixIcon: suffixIcon,
      ),
    );
  }
}
