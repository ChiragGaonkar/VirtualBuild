import 'package:flutter/material.dart';

class NextButtonClass extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const NextButtonClass({
    super.key,
    required this.text,
    required this.onPressed,
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
        InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed,
          child: Icon(
            Icons.arrow_circle_right_outlined,
            color: Theme.of(context).primaryColor,
            size: 50,
          ),
        )
      ],
    );
  }
}
