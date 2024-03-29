import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/firebase/authentication.dart';
import 'package:virtualbuild/screens/auth/login_screen.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithnavigation.dart';
import '../../widgets/auth/custombuttontonext.dart';
import '../../widgets/customdecorationforinput.dart';
import '../../widgets/customloadingspinner.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot_password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  Map<String, dynamic> errorIfAny = {};

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var scaffoldMessengerVar = ScaffoldMessenger.of(context);
    var navigatorVar = Navigator.of(context);

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
          screenContent: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWithNavigation(
                  heading: "Forgot password",
                  screenToBeRendered: LoginScreen.routeName,
                ),
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
                  validator: (email) {
                    if (email != null && !EmailValidator.validate(email)) {
                      return "Enter a valid email";
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
                      TextSpan(
                        text: "*",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      const TextSpan(
                        text:
                            " We will send you a mail to set or reset your new password",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                NextButtonClass(
                  text: "Send Code",
                  onPressed: () async {
                    //Check for the fields are valid in TextFormField.
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;

                    //Hides the keyboard.
                    FocusScope.of(context).unfocus();

                    //Start CircularProgressIndicator
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const CustomLoadingSpinner();
                      },
                    );

                    //Logic for resetpassword
                    errorIfAny = await Auth()
                        .resetPassword(email: _emailTextController.text);

                    navigatorVar.pop();
                    if (errorIfAny.isEmpty) {
                      scaffoldMessengerVar.showSnackBar(
                        SnackBar(
                          content: AwesomeSnackbarContent(
                            title: 'Oh snap!',
                            message: "Mail sent to registered email.",
                            contentType: ContentType.success,
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                      navigatorVar.pushNamed(LoginScreen.routeName);
                    } else {
                      scaffoldMessengerVar.showSnackBar(
                        SnackBar(
                          content: AwesomeSnackbarContent(
                            title: 'Oh snap!',
                            message: errorIfAny['error'],
                            contentType: ContentType.failure,
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                    }
                    //Logic for resetpassword ends here
                    // var otp = await sendOtp(_emailTextController.text);
                    // print("${otp} sent sucessfully");
                    // Navigator.of(context).pushNamed(
                    //   OTPScreen.routeName,
                    //   arguments: ArgumentsForOTP(
                    //     email: _emailTextController.text,
                    //     otp: otp,
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
