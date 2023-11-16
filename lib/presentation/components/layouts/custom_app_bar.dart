import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool forceMaterialTransparency;

  const CustomAppBar(
      {Key? key, required this.title, this.forceMaterialTransparency = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: forceMaterialTransparency,
      automaticallyImplyLeading: false,
      leadingWidth: 30,
      leading: Transform.translate(
        offset: const Offset(0, 0),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.primary,
          ),
        ),
      ),
      titleSpacing: 8,
      title: Text(
        title,
        style: AppStyle.titleAppBar,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
