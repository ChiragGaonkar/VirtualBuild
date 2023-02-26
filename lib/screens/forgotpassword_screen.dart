import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/header.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MyCustomScreen(
          // customColor: Colors.greenAccent,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(heading: "Forgot Password?"),
              SizedBox(
                height: size.height * 0.05,
              ),
              // const CustomTextField(),
              TextFormField(
                controller: _emailTextController,
                decoration: customDecorationForInput(
                  context,
                  "Enter Email",
                  Icons.email,
                ),
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
                    const TextSpan(
                      text:
                          " We will send you a message to set or reset your new password",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Row(
                children: [
                  Text(
                    "Send OTP",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      // print(_emailTextController.text);
                    },
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
