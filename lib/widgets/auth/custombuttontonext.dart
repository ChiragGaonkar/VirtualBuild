import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../firebase/authentication.dart';

class NextButtonClass extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const NextButtonClass({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<NextButtonClass> createState() => _NextButtonClassState();
}

class _NextButtonClassState extends State<NextButtonClass> {
  //Code for Log in authentication
  String? errorMessage = '';

  bool isLogin = true;

  Future<void> signInWithEmailAndPassword(email, password) async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  //Code for Log in authentication ends here

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        PhysicalModel(
          elevation: 0.1,
          color: Colors.transparent,
          shadowColor: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
          child: InkWell(
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(100),
            onTap: widget.onPressed,
            child: Icon(
              Icons.arrow_circle_right_outlined,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          ),
        )
      ],
    );
  }
}
