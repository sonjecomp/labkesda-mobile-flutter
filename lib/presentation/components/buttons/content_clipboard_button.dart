import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labkesda_mobile/constants/colors.dart';

class ClipboardContent extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final String copiedTextMessage;
  const ClipboardContent({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
    required this.copiedTextMessage,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 12,
              color: AppColors.textWhite,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.textWhite,
              size: 14,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              content,
              style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textWhite,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () async {
                ScaffoldMessenger.of(context).clearSnackBars();
                await Clipboard.setData(
                  ClipboardData(
                    text: content,
                  ),
                ).then(
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(copiedTextMessage),
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.copy,
                color: AppColors.textWhite,
                size: 14,
              ),
            )
          ],
        ),
      ],
    );
  }
}
