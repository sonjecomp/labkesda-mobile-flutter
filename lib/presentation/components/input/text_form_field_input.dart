import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class TextFormFieldInput extends HookConsumerWidget {
  const TextFormFieldInput({
    super.key,
    this.placeHolder,
    this.isRequired = false,
    this.readOnly = false,
    this.autofocus = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.isNik = false,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? placeHolder;
  final bool? isRequired;
  final bool? isNik;
  final bool? autofocus;
  final bool readOnly;
  final Widget? suffixIcon, prefixIcon;
  final Function()? onTap;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      inputFormatters: isNik == true
          ? [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
            ]
          : null,
      controller: controller,
      autofocus: autofocus ?? false,
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
        prefixIcon: prefixIcon,
      ),
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    );
  }
}
