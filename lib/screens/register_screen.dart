import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/screens/login_screen.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailTextController = TextEditingController();
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
              const Header(heading: "Create an Account"),
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
                height: size.height * 0.03,
              ),
              TextFormField(
                controller: _confirmPasswordTextController,
                obscureText: true,
                decoration: customDecorationForInput(
                  context,
                  "Confirm Password",
                  Icons.lock_rounded,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    const TextSpan(
                      text: "*By clicking the ",
                    ),
                    TextSpan(
                      text: "Register ",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const TextSpan(
                      text:
                          "button, you agree to all the terms and conditions of this app.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.07,
              ),
              Row(
                children: [
                  Text(
                    "Register",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      print(_emailTextController.text);
                      print(_passwordTextController.text);
                      print(_confirmPasswordTextController.text);
                      Navigator.of(context).pushNamed(DisplayScreen.routeName);
                    },
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Center(
                child: Text(
                  "sign in with",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/Google.png",
                    width: size.height * 0.05,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    splashColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
              )
            ],
          ),
        ),
      ),
    );
  }
}
