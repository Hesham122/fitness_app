// Custom clipper for bottom-right orange shape
import 'package:flutter/material.dart';

class BottomRightShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);

     // Starting at the top-right corner
    path.moveTo(size.width, 0);

    // Draw a line from top-right to about 1/3 down on the right
    path.lineTo(size.width, size.height * 0.25);

    // Draw a curved path to the left side
    path.quadraticBezierTo(
      size.width * 0.75,   // Control point X (about 3/4th into the width)
      size.height * 0.75,  // Control point Y (about 3/4th of the height)
      0,                   // End point X (left edge)
      size.height * 0.6,   // End point Y (a little above middle-left)
    );

    // Draw a straight line down to the bottom-left corner
    path.lineTo(0, size.height);

    // Draw a line across the bottom to the bottom-right corner
    path.lineTo(size.width, size.height);



    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}