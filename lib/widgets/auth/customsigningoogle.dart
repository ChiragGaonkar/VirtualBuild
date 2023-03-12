import 'package:flutter/material.dart';
import 'package:virtualbuild/firebase/googleSignIn.dart';
import 'package:virtualbuild/screens/display_screen.dart';

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
            onTap: () async {
              var googleSignIn = GoogleSignInClass();
              String status = await googleSignIn.googleLogin();
              print(status);
              if (status == "Success") {
                Navigator.of(context).pushNamed(DisplayScreen.routeName);
              } else {}
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
