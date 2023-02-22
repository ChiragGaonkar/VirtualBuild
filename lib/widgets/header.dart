import 'package:flutter/material.dart';

/*This is a custom header designed using a fixed width and margin. 
"heading" is passed to the Heading Widget which renders the heading on the screen.*/
class Header extends StatelessWidget {
  final String heading;
  const Header({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
