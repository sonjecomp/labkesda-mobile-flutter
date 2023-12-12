import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';

class ManipulationSearchButton extends HookConsumerWidget {
  const ManipulationSearchButton({
    super.key,
    this.href = '',
    this.placeHolder = 'Cari',
    this.padding = const EdgeInsets.only(
      top: 30,
      right: 20,
      bottom: 15,
      left: 20,
    ),
  });

  /// insert for destination route
  ///
  /// exp: '/daftar-paket'
  final String href;
  final String placeHolder;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          TextFormFieldInput(
            readOnly: true,
            suffixIcon: const Icon(
              Icons.search,
            ),
            onTap: () {
              context.push(href);
            },
            placeHolder: placeHolder,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
