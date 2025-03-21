import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/utils/colors.dart';
import 'package:my_puzzle/src/ui/utils/responsive.dart';
import 'package:my_puzzle/src/ui/utils/dark_mode_extension.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  const MyIconButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const isDarkMode = true;
    final size = Responsive.of(context).dp(6).clamp(40, 80).toDouble();
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(
        iconData,
        size: size * 0.4,
      ),
      minWidth: size,
      height: size,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size / 2),
      ),
      color: darkColor.withOpacity(isDarkMode ? 0.2 : 1),
    );
  }
}
