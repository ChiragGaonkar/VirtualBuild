import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});
  static const routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomScreen(
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(heading: "OTP Verification"),
          ],
        ),
      ),
    );
  }
}
