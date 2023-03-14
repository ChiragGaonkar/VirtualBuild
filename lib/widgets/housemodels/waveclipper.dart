import 'package:flutter/material.dart';

class WaveClipperDown extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // double w = size.width;
    // double h = size.height;

    // var path = new Path();
    // path.moveTo(0, h - 80);
    // //First Point
    // var firstEnd = Offset(w / 4, h - 80);
    // var firstStart = Offset(w / 2, 0);
    // path.quadraticBezierTo(
    //   firstEnd.dx,
    //   firstEnd.dy,
    //   firstStart.dx,
    //   firstStart.dy,
    // );
    // // path.lineTo(firstEnd.dx, firstEnd.dy);
    // // path.lineTo(firstStart.dx, firstStart.dy);

    // //Third Point
    // var secondEnd = Offset(w - (w / 4), h - 80);
    // var secondStart = Offset(w, h - 80);
    // // path.quadraticBezierTo(
    // //   secondEnd.dx,
    // //   secondEnd.dy,
    // //   secondStart.dx,
    // //   secondStart.dy,
    // // );
    // path.lineTo(secondEnd.dx, secondEnd.dy);
    // path.lineTo(secondStart.dx, secondStart.dy);

    // path.lineTo(w, h);
    // path.lineTo(0, h);
    // path.close();
    // return path;

    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.2);
    path0.lineTo(size.width * 0.1, size.height * 0.1);
    path0.lineTo(size.width * 0.3, size.height * 0.1);
    path0.lineTo(size.width * 0.5, 0);
    path0.lineTo(size.width * 0.7, size.height * 0.1);
    path0.lineTo(size.width * 0.9, size.height * 0.1);
    path0.lineTo(size.width, size.height * 0.2);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);

    // canvas.drawPath(path0, paint0);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class WaveClipperUp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.moveTo(0.0, 0.0);
    var firstEnd = Offset(size.width / 2.2, 0.0);
    var firstStart = Offset(size.width / 2, 0.0);
    path.quadraticBezierTo(
      firstEnd.dx,
      firstEnd.dy,
      firstStart.dx,
      firstStart.dy,
    );
    // path.lineTo(firstEnd.dx, firstEnd.dy);
    // path.lineTo(firstStart.dx, firstStart.dy);
    var secondEnd = Offset(size.width - (size.width / 2.2), 0.0);
    var secondStart = Offset(size.width, 0.0);
    path.quadraticBezierTo(
      secondEnd.dx,
      secondEnd.dy,
      secondStart.dx,
      secondStart.dy,
    );
    // path.lineTo(secondEnd.dx, secondEnd.dy);
    // path.lineTo(secondStart.dx, secondStart.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
