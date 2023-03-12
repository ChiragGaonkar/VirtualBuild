//This page bascially checks if the person is already logged in or not
//On that basis it will decide whether it will route on displaypage or LoginPage.

import 'package:flutter/material.dart';
import 'package:virtualbuild/firebase/authentication.dart';
import 'package:virtualbuild/screens/auth/login_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DisplayScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
