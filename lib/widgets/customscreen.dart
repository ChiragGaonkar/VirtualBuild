import 'package:flutter/material.dart';

class MyCustomScreen extends StatelessWidget {
  final Widget screenContent;
  final Color customColor;
  final double xCoordinate;
  final double yCoordinate;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  const MyCustomScreen({
    super.key,
    this.customColor = const Color(0x40404040),
    this.xCoordinate = 0.0,
    this.yCoordinate = 0.7,
    required this.screenContent,
    this.leftPadding = 0.05,
    this.rightPadding = 0.05,
    this.topPadding = 0.08,
    this.bottomPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
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
          size.width * leftPadding,
          size.height * topPadding,
          size.width * rightPadding,
          bottomPadding,
        ),
        child: screenContent,
      ),
    );
  }
}
