import 'package:flutter/material.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            // color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/DataNotFound.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
