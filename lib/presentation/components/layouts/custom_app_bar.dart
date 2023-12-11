import 'package:flutter/material.dart';
import 'package:labkesda_mobile/constants/colors.dart';
import 'package:labkesda_mobile/presentation/styles/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.forceMaterialTransparency = false,
    this.backgroundColor = AppColors.whiteColor,
    this.leadingAndTextColor = AppColors.primary,
  }) : super(key: key);

  final String title;
  final bool forceMaterialTransparency;
  final Color? backgroundColor, leadingAndTextColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: forceMaterialTransparency,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leadingWidth: 30,
      leading: Transform.translate(
        offset: const Offset(0, 0),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            color: leadingAndTextColor,
          ),
        ),
      ),
      titleSpacing: 8,
      title: Text(
        title,
        style: AppStyle.titleAppBar.copyWith(
          color: leadingAndTextColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
