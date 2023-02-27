import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../widgets/customNextBtn.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  static const routeName = '/otp';

  String email = "email@gmai.com";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: MyCustomScreen(
        customColor: Colors.blue,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(heading: "OTP Verification"),
            SizedBox(
              height: size.height * 0.05,
            ),
            OTPTextField(
                //controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 60,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.white
                ),
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: TextStyle(color: Colors.black, fontSize: 17),
                onChanged: (pin) {

                },
                onCompleted: (pin) {

                }),
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
                    text:
                    " Enter the OTP sent to ${email}",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            NextButtonClass(text: "Send OTP", onPressed: () {
                print("pressed");
            }),
          ],
        ),
      ),
    );
  }
}
