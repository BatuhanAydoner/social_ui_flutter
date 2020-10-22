import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, 4 * size.height / 5);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, 4 * size.height / 5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
