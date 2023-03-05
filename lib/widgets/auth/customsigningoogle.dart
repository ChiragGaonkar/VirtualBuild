import 'package:flutter/material.dart';
import 'package:virtualbuild/firebase/googleSignIn.dart';

class CustomGoogleSignIn extends StatelessWidget {
  const CustomGoogleSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Text(
            "Sign In With",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Center(
          child: InkWell(
            onTap: () {
              var googleSignIn = GoogleSignInClass();
              googleSignIn.googleLogin();
            },
            child: Image.asset(
              "assets/Google.png",
              width: size.height * 0.05,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        )
      ],
    );
  }
}
