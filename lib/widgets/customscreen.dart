import 'package:flutter/material.dart';

class MyCustomScreen extends StatelessWidget {
  final Widget screenContent;
  const MyCustomScreen({
    super.key,
    required this.screenContent,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          size.width * 0.05,
          size.height * 0.04,
          size.width * 0.05,
          0,
        ),
        child: screenContent,
      ),
    );
  }
}
