import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomScreen(
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(heading: "Welcome back!!"),
            //Other content of the page start here.
          ],
        ),
      ),
    );
  }
}
