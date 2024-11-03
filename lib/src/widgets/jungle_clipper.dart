import 'dart:ui';

import 'package:flutter/material.dart';

class JungleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Comienza en la esquina superior izquierda
    path.moveTo(0, size.height * 0.2);

    // Curva superior izquierda
    path.quadraticBezierTo(size.width * 0.05, 35, size.width * 0.5, 35);

    // Curva superior derecha
    path.lineTo(size.width * 0.8, 0);
    path.quadraticBezierTo(size.width * 0.95, 0, size.width, size.height * 0.2);

    // Curva inferior derecha
    path.lineTo(size.width, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width * 0.2, size.height);

    // Curva inferior izquierda
    path.lineTo(size.width * 0.2, size.height);
    path.quadraticBezierTo(
        size.width * 0.05, size.height, 0, size.height * 0.8);

    // Cierra el camino
    path.lineTo(0, size.height * 0.2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
