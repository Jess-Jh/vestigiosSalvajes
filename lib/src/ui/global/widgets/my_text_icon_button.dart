import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/utils/colors.dart';
import 'package:my_puzzle/src/ui/utils/responsive.dart';
import '../../utils/dark_mode_extension.dart';

class MyTextIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String label;
  final double height;
  const MyTextIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const isDarkMode = true;
    final padding = Responsive.of(context).dp(1.3);
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          darkColor.withOpacity(isDarkMode ? 0.3 : 0.8),
        ),
        fixedSize: WidgetStateProperty.all(
          Size.fromHeight(height),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: padding,
          ).copyWith(right: padding * 2),
        ),
        elevation: WidgetStateProperty.all(0),
        shadowColor: WidgetStateProperty.all(
          Colors.black38,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      icon: icon,
      label: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
}
