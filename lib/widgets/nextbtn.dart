import 'package:flutter/material.dart';

class NextButtonClass extends StatelessWidget {
  final String text;
  const NextButtonClass({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Container(
          height: 51,
          width: 51,
          decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 7),
                )
              ]),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
