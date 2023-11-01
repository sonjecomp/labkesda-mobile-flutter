import 'package:flutter/material.dart';

class AppStyle {
  const AppStyle._();

  static BoxShadow boxShadow = BoxShadow(
    color: const Color(0xFFDCDCDC).withOpacity(0.9),
    blurRadius: 10,
    offset: const Offset(0, 4),
  );
}
