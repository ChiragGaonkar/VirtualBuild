import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/screens/auth/forgotpassword_screen.dart';
import 'package:virtualbuild/screens/auth/register_screen.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/customsnackbar.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../firebase/authentication.dart';
import '../../providers/user_data_provider.dart';
import '../../widgets/auth/custombuttontonext.dart';
import '../../widgets/auth/customsigningoogle.dart';
import '../display_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  Map<String, dynamic> errorIfAny = {};

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
    var scaffoldMessengerVar = ScaffoldMessenger.of(context);
    var navigatorVar = Navigator.of(context);
    var userProvider = Provider.of<UserDataProvide>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                          validator: (email) {
                            if (email != null &&
                                !EmailValidator.validate(email)) {
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
                            if (password != null && password.length < 6) {
                              return "Enter min 6 char long";
                            } else {
                              return null;
                            }
                          },
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
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        NextButtonClass(
                          text: "Sign In",
                          onPressed: () async {
                            //Check for the fields are valid in TextFormField.
                            final isValid = formKey.currentState!.validate();
                            if (!isValid) return;

                            FocusScope.of(context).unfocus();

                            //Start CircularProgressIndicator
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomLoadingSpinner();
                              },
                            );

                            //Logic for authentication
                            errorIfAny =
                                await Auth().signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                            );

                            //Stop CircularProgressIndicator
                            navigatorVar.pop();

                            if (errorIfAny.isEmpty &&
                                user!.displayName == "User") {
                              scaffoldMessengerVar.showSnackBar(
                                const SnackBar(
                                  content: CustomSnackBar(
                                    messageToBePrinted:
                                        "Logged in successfully.",
                                    bgColor: Color.fromRGBO(44, 199, 142, 1),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );
                              await userProvider.getData();
                              //Clears full stack of screens.
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return const DisplayScreen();
                              }), (r) {
                                return false;
                              });
                            } else {
                              scaffoldMessengerVar.showSnackBar(
                                SnackBar(
                                  content: CustomSnackBar(
                                    messageToBePrinted: errorIfAny.isEmpty
                                        ? "Architect not found. Register!!"
                                        : errorIfAny['error'],
                                    bgColor:
                                        const Color.fromRGBO(199, 44, 65, 1),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );
                            }
                            //Logic for authentication ends here
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        const CustomGoogleSignIn(),
                        // const Spacer(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            size.height * 0.02,
                            0,
                            size.height * 0.07,
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
