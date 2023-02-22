import 'package:flutter/material.dart';

class MyCustomScreen extends StatelessWidget {
  final Widget screenContent;
  const MyCustomScreen({
    super.key,
    required this.screenContent,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: screenContent,
      ),
    );
  }
}
