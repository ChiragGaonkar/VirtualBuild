import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/custommenu.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import 'package:virtualbuild/widgets/headerwithmenu.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomScreen(
        customColor: Colors.blue,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(heading: "Create an Account"),
          ],
        ),
      ),
    );
  }
}
