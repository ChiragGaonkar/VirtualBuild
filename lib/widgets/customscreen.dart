import 'dart:ffi';

import 'package:flutter/material.dart';

class MyCustomScreen extends StatelessWidget {
  final Widget screenContent;
  final Color customColor;
  final double xCoordinate;
  final double yCoordinate;
  const MyCustomScreen({
    super.key,
    this.customColor = const Color(0x40404040),
    this.xCoordinate = 0.0,
    this.yCoordinate = 0.7,
    required this.screenContent,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [customColor, Theme.of(context).scaffoldBackgroundColor],
          center: Alignment(xCoordinate, yCoordinate),
          focal: const Alignment(0.5, -0.3),
          focalRadius: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.05,
          size.height * 0.1,
          size.width * 0.05,
          0,
        ),
        child: screenContent,
      ),
    );
  }
}
