import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/login_screen.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = '/reset_password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

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
          // customColor: Colors.blue,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(heading: "Reset Password"),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                //Read only mode
                enabled: false,
                decoration: customDecorationForInput(
                  context,
                  "chiraggaonkar80@gmail.com",
                  Icons.email_rounded,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextFormField(
                controller: _passwordTextController,
                obscureText: true,
                decoration: customDecorationForInput(
                  context,
                  "Enter Password",
                  Icons.lock_reset,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextFormField(
                controller: _confirmPasswordTextController,
                obscureText: true,
                decoration: customDecorationForInput(
                  context,
                  "Confirm Password",
                  Icons.lock_reset,
                ),
              ),
              SizedBox(
                height: size.width * 0.07,
              ),
              Row(
                children: [
                  Text(
                    "Reset",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      print(_passwordTextController.text);
                      print(_confirmPasswordTextController.text);
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
