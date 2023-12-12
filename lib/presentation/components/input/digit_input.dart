import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DigitInput extends HookConsumerWidget {
  const DigitInput({
    Key? key,
    required this.controller,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 40,
      height: 60,
      child: TextFormField(
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          counterText: '',
          hintTextDirection: TextDirection.ltr,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          contentPadding: EdgeInsets.all(0),
        ),
        controller: controller,
        maxLength: 1, // Set maximum length to 1
        focusNode: FocusNode(
          onKey: (node, event) {
            if (FocusScope.of(context).hasFocus) {
              controller.clear();
              FocusScope.of(context).previousFocus();
            }
            return KeyEventResult.handled;
          },
        ),
        textAlign: TextAlign.center,
        onChanged: (value) {
          final uppercaseValue = value.toUpperCase();
          controller.value = controller.value.copyWith(
            text: uppercaseValue,
            selection: TextSelection.collapsed(offset: uppercaseValue.length),
          );

          if (uppercaseValue.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
        enabled: enabled,
      ),
    );
  }
}
