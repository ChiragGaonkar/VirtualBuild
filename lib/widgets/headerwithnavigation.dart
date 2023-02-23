import 'package:flutter/material.dart';

class HeaderWithNavigation extends StatelessWidget {
  final String heading;
  const HeaderWithNavigation({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        Text(
          heading,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
