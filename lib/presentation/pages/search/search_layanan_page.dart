import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/presentation/components/layouts/search_app_bar_layout.dart';

class SearchLayananPage extends HookConsumerWidget {
  const SearchLayananPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputSearchController = useTextEditingController();
    return Scaffold(
      appBar: SearchAppBarLayout(
        inputSearchController: inputSearchController,
        placeHolder: 'Cari layanan',
      ),
      body: Center(
        child: ValueListenableBuilder<TextEditingValue>(
          valueListenable: inputSearchController,
          builder: (context, value, _) {
            if (value.text.length >= 3) {
              return Text(
                'Hasil ${value.text}',
              );
            } else {
              return const Text(
                'Ketikan minimal 3 karakter',
              );
            }
          },
        ),
      ),
    );
  }
}
