import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/header.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});
  static const routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Header(heading: "OTP Verification!"),
        ],
      ),
    );
  }
}
