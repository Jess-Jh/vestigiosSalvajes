import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class GameBackground extends StatelessWidget {
  final Widget child;
  const GameBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Colors.primaries[i].withOpacity(0.2);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: darkColor,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/jungle_background.webp'),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
