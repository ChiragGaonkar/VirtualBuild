import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "VirtualBuild",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
