import 'package:flutter/cupertino.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, 4 * size.height / 5);

    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, 4 * size.height / 5);

    path.quadraticBezierTo(3 / 4 * size.width, 3 * size.height / 5, size.width,
        4 * size.height / 5);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<dynamic> oldClipper) {
    return true;
  }
}
