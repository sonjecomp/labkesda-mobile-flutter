import 'package:flutter/material.dart';

class WarningSnackbar {
  static void show(BuildContext context, {String? text, Widget? content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: content ?? Text(text ?? ''),
        backgroundColor: Colors.red,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
      ),
    );
  }
}
