import 'package:flutter/material.dart';

class HeaderWithNavigation extends StatelessWidget {
  final String heading;
  final String screenToBeRendered;
  const HeaderWithNavigation({
    super.key,
    required this.heading,
    required this.screenToBeRendered,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pushNamed(screenToBeRendered),
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
