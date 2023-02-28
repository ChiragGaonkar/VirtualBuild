import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/auth/forgotpassword_screen.dart';
import 'package:virtualbuild/screens/auth/register_screen.dart';

import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../widgets/custombuttontonext.dart';
import '../../widgets/customsigningoogle.dart';
import '../display_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  Widget _buildTextLink(
    Size size,
    String normalText,
    String navigationText,
    MainAxisAlignment position,
    String choosenScreen,
  ) {
    return Row(
      mainAxisAlignment: position,
      children: [
        Text(
          normalText,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: size.width * 0.01,
        ),
        InkWell(
          onTap: () {
            if (choosenScreen == "Register") {
              Navigator.of(context).pushNamed(RegisterScreen.routeName);
            } else if (choosenScreen == "ResetPassword") {
              Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
            }
          },
          splashColor: Theme.of(context).primaryColor,
          child: Text(
            navigationText,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        )
      ],
    );
  }

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
          // customColor: Colors.orange,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(heading: "Welcome back!!"),
              //Other content of the page start here.
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                controller: _emailTextController,
                decoration: customDecorationForInput(
                  context,
                  "Enter Email",
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
                  Icons.lock_rounded,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _buildTextLink(
                size,
                "Forgot Password? ",
                "Reset Password",
                MainAxisAlignment.start,
                "ResetPassword",
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              NextButtonClass(
                text: "Sign In",
                onPressed: () {
                  print(_emailTextController.text);
                  Navigator.of(context).pushNamed(DisplayScreen.routeName);
                },
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              const CustomGoogleSignIn(),
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.07),
                child: _buildTextLink(
                  size,
                  "New to VirtualBuild?",
                  "Register",
                  MainAxisAlignment.center,
                  "Register",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
