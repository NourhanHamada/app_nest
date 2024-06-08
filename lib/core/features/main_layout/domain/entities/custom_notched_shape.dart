import 'package:flutter/cupertino.dart';

class CustomNotchedShape extends NotchedShape {
  const CustomNotchedShape();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    // Return a rectangle path covering the entire host rectangle
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(host.width, 0);
    path.lineTo(host.width, host.height);
    path.lineTo(0, host.height);
    path.close();
    return path;
  }
}