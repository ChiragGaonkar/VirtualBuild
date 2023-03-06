import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:virtualbuild/firebase/otpverification.dart';
import 'package:virtualbuild/screens/auth/resetpassword_screen.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';

import '../../widgets/auth/custombuttontonext.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  static const routeName = '/otp';

  String email = "email@gmai.com";



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MyCustomScreen(
        // customColor: Colors.blue,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(heading: "OTP Verification"),
            SizedBox(
              height: size.height * 0.05,
            ),
            OtpTextField(
              numberOfFields: 5,
              fieldWidth: size.width * 0.15,
              showFieldAsBox: true,
              filled: true,
              fillColor: Theme.of(context).canvasColor,
              focusedBorderColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              enabledBorderColor: Theme.of(context).canvasColor,
              onSubmit: (String verificationCode) {
                //Code to perform operation;
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.titleSmall,
                children: [
                  TextSpan(
                    text: "*",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  TextSpan(
                    text: " Enter the OTP sent to ${email}",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            NextButtonClass(
                text: "Verify OTP",
                onPressed: () {
                  OTPVerification().sendOTP("chiraggaonkar80@gmail.com");
                  Navigator.of(context)
                      .pushNamed(ResetPasswordScreen.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
