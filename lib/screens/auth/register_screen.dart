import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/firebase/authentication.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../widgets/auth/custombuttontonext.dart';
import '../../widgets/auth/customdecorationforinput.dart';
import '../../widgets/auth/customsigningoogle.dart';
import '../../widgets/customsnackbar.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  Map<String, dynamic> errorIfAny = {};

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
          screenContent: Form(
            key: formKey,
            child: Column(
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
                  validator: (email) {
                    if (email != null && !EmailValidator.validate(email)) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },
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
                  validator: (password) {
                    if (password != null && password.length < 8) {
                      return "Enter min 8 char long";
                    } else {
                      return null;
                    }
                  },
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
                  validator: (confirmPassword) {
                    if (confirmPassword != null && confirmPassword.length < 8) {
                      if (confirmPassword != _passwordTextController.text) {
                        return "Password doesn't match";
                      }
                      return "Enter min 8 char long";
                    } else {
                      return null;
                    }
                  },
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
                  height: size.width * 0.05,
                ),
                NextButtonClass(
                  text: "Register",
                  onPressed: () async {
                    //Check for the fields are valid in TextFormField.
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;

                    //Hides the keyboard.
                    FocusScope.of(context).unfocus();

                    //Logic for authentication
                    errorIfAny = await Auth().createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );
                    if (errorIfAny.isEmpty) {
                      Navigator.of(context).pushNamed(DisplayScreen.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomSnackBar(
                            messageToBePrinted: errorIfAny['error'],
                            bgColor: Color.fromRGBO(199, 44, 65, 1),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                    }
                    //Logic for authentication ends here.
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const CustomGoogleSignIn(),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.07),
                  child: Row(
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
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        splashColor: Theme.of(context).primaryColor,
                        child: Text(
                          "Log in",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
