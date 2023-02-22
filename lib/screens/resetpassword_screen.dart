import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = '/reset_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomScreen(
        screenContent: Column(
          children: const [
            Header(heading: "Reset Password"),
          ],
        ),
      ),
    );
  }
}
