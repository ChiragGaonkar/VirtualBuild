import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/auth/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../firebase/authentication.dart';
import '../../widgets/auth/custombuttontonext.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = '/reset_password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  //Code for retrieving data from firestore
  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
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
                const Header(heading: "Reset Password"),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextFormField(
                  //Read only mode
                  enabled: false,
                  decoration: customDecorationForInput(
                    context,
                    args['email'],
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
                    Icons.lock_reset,
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
                  height: size.width * 0.07,
                ),
                NextButtonClass(
                    text: "Reset",
                    onPressed: () async {
                      //Check for the fields are valid in TextFormField.
                      final isValid = formKey.currentState!.validate();
                      if (!isValid) return;

                      //Hides the keyboard.
                      FocusScope.of(context).unfocus();

                      //Call function from authentication
                      //Pass the newpassword and email.
                      // Auth().updatePassword(email: args['email']);

                      //Navigate back to login page
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
