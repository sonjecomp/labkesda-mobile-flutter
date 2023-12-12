import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/components/input/text_form_field_input.dart';

class SearchAppBarLayout extends ConsumerWidget implements PreferredSizeWidget {
  const SearchAppBarLayout(
      {super.key, required this.inputSearchController, this.placeHolder});

  final TextEditingController inputSearchController;
  final String? placeHolder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      leadingWidth: 30,
      leading: Transform.translate(
        offset: const Offset(0, 0),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.textWhite,
          ),
        ),
      ),
      titleSpacing: 10,
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormFieldInput(
          placeHolder: placeHolder ?? 'Cari',
          autofocus: true,
          controller: inputSearchController,
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: inputSearchController,
            builder: (context, value, _) {
              return GestureDetector(
                onTap: () {
                  if (value.text.isNotEmpty) {
                    inputSearchController.clear();
                  }
                },
                child: value.text.isEmpty
                    ? const Icon(
                        Icons.search,
                        color: Colors.black45,
                      )
                    : IconButton(
                        onPressed: () {
                          inputSearchController.clear();
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.black45,
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
