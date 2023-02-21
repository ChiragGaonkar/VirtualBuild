import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Header(heading: "Forgot Password?"),
        ],
      ),
    );
  }
}
