import 'package:book_logging_app/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/contants/colors.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.bottomSheetChild,
    this.fontSize = HSizes.textSize20,
    this.isBold = true,
  });
  final String text;
  final IconData icon;
  final Widget bottomSheetChild;
  final double fontSize;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: HColors.mainColor,
        textStyle: TextStyle(
          fontWeight: isBold ? FontWeight.bold : null,
          fontSize: fontSize,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: bottomSheetChild,
            );
          },
        );
      },
    );
  }
}
