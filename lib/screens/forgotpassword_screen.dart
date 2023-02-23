import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/customtextfield.dart';
import 'package:virtualbuild/widgets/header.dart';

import '../widgets/nextbutton.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MyCustomScreen(
        customColor: Colors.deepOrange,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(heading: "Forgot Password?"),
            SizedBox(
              height: size.height * 0.05,
            ),
            const CustomTextField(),
            SizedBox(
              height: size.height * 0.02,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 15),
                children: [
                  TextSpan(
                      text: "*",
                      style: TextStyle(color: Color.fromRGBO(255, 75, 38, 1))),
                  TextSpan(
                      text:
                          " We will send you a message to set or reset your new password")
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            const NextButtonClass(text: "Send Code"),
          ],
        ),
      ),
    );
  }
}
