import 'package:flutter/material.dart';

import '../screens/auth/forgotpassword_screen.dart';
import '../screens/auth/register_screen.dart';

class CustomGoogleSignIn extends StatelessWidget {
  CustomGoogleSignIn({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Column(
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
            onTap: () {},
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
