import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';

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
          onTap: () {},
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
                height: size.height * 0.07,
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
                height: size.height * 0.04,
              ),
              TextFormField(
                controller: _passwordTextController,
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
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Row(
                children: [
                  Text(
                    "Sign In",
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
                  child: Image.network(
                    "https://pngimg.com/uploads/google/google_PNG19635.png",
                    width: size.width * 0.1,
                  ),
                ),
              ),
              Spacer(),
              _buildTextLink(
                size,
                "Already have an account?",
                "Log in",
                MainAxisAlignment.center,
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
