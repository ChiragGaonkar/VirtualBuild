import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: const [
        Header(heading: "Create an account"),
      ],
    ));
  }
}
