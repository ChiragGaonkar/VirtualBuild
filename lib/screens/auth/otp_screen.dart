import 'dart:async';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/firebase/firestore_database.dart';
import 'package:virtualbuild/screens/auth/text_message.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/header.dart';
import '../../firebase/authentication.dart';
import '../../providers/user_data_provider.dart';
import '../../widgets/auth/custombuttontonext.dart';
import '../../widgets/customloadingspinner.dart';
import '../display_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});
  static const routeName = '/otp';

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Map<String, dynamic> errorIfAny = {};
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Hurray!',
            message: "Created account Successfully.",
            contentType: ContentType.success,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var scaffoldMessengerVar = ScaffoldMessenger.of(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var userProvider = Provider.of<UserDataProvide>(context, listen: false);
    var navigatorVar = Navigator.of(context);

    return Scaffold(
      body: MyCustomScreen(
        // customColor: Colors.blue,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(heading: "Email Verification"),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              emailVerficationMessage1,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: size.height * 0.02),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: emailVerficationMessage2,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: args["email"],
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              emailVerficationMessage3,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: size.height * 0.02),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: emailVerficationMessage4,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: ' Resend Verification Email',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        try {
                          FirebaseAuth.instance.currentUser
                              ?.sendEmailVerification();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'Hurray!',
                                message: "Sent verification link successfully.",
                                contentType: ContentType.success,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          );
                        } catch (e) {
                          debugPrint('$e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'Oh snap!',
                                message: "Failed to send verification link",
                                contentType: ContentType.failure,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          );
                        }
                      },
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              emailVerficationMessage5,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              emailVerficationMessage6,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            if (isEmailVerified)
              NextButtonClass(
                  text: "Proceed to Home Page",
                  onPressed: () async {
                    //Compare OTP: if correct createNewUser
                    if (isEmailVerified) {
                      //Start CircularProgressIndicator
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const CustomLoadingSpinner();
                        },
                      );

                      //Logic for authentication and create user
                      // errorIfAny = await Auth().createUserWithEmailAndPassword(
                      //   email: args['email'],
                      //   password: args['password'],
                      // );

                      final User? user = Auth().currentUser;
                      await FireDatabase().createUser(
                        uid: user!.uid.toString(),
                        name: args['name'],
                        phoneNumber: args['phoneNumber'],
                        email: args['email'],
                        address: args['address'],
                      );

                      userProvider.setData(
                        args['name'],
                        args['email'],
                        args['address'],
                        args['phoneNumber'],
                      );

                      navigatorVar.pop();

                      scaffoldMessengerVar.showSnackBar(
                        SnackBar(
                          content: AwesomeSnackbarContent(
                            title: 'Hurray!',
                            message: "Created account Successfully.",
                            contentType: ContentType.success,
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                      //Clears full stack fo screens.
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const DisplayScreen();
                      }), (r) {
                        return false;
                      });

                      //Logic for authentication ends here.
                    }
                  }),
          ],
        ),
      ),
    );
  }
}
