import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Header(heading: "Welcome Back!!"),
        ],
      ),
    );
  }
}
