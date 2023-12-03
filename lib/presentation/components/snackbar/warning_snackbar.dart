import 'package:flutter/material.dart';

class WarningSnackbar {
  static void show(BuildContext context, {String? text, Widget? content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.startToEnd,
        showCloseIcon: true,
        content: content ?? Text(text ?? ''),
        backgroundColor: Colors.red,
      ),
    );
  }
}
