import 'dart:math';

import 'package:flutter/material.dart';

class MovingCurvedImage extends StatefulWidget {
  const MovingCurvedImage({Key? key}) : super(key: key);

  @override
  _MovingCurvedImageState createState() => _MovingCurvedImageState();
}

class _MovingCurvedImageState extends State<MovingCurvedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return ClipPath(
          clipper: MovingWaveClipper(_animationController.value),
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/intro_image.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MovingWaveClipper extends CustomClipper<Path> {
  final double animationValue;

  MovingWaveClipper(this.animationValue);

  @override
  Path getClip(Size size) {
    final path = Path();
    double waveHeight = 20; // Altura de la onda
    double waveFrequency = 2 * pi; // Frecuencia de la onda

    path.moveTo(0, size.height * 0.8); // Punto inicial

    for (double x = 0; x <= size.width; x += 1) {
      double y = size.height * 0.06 +
          sin((x / size.width * waveFrequency) +
                  (animationValue * waveFrequency)) *
              waveHeight;
      path.lineTo(x, y);
    }

    // Curva inferior derecha
    path.lineTo(size.width, size.height * 0.95);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width * 0.2, size.height);

    path.lineTo(size.width, size.height); // Abajo a la derecha
    // Curva inferior izquierda
    path.lineTo(size.width * 0.2, size.height);
    path.quadraticBezierTo(
        size.width * 0.05, size.height, 0, size.height * 0.95);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(MovingWaveClipper oldClipper) => true;
}
