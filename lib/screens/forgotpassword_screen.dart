import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  static const routeName = '/forgot_password';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.08,
              right: size.width * 0.05,
              top: size.height * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(heading: "Forgot Password?"),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextField(
                style: TextStyle(color: Color.fromRGBO(103, 103, 103, 1)),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color.fromRGBO(98, 98, 98, 1)),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(98, 98, 98, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(Icons.email,),
                  fillColor: Color.fromRGBO(98, 98, 98, 1),
                  filled: true,
                  labelText: 'Enter Email',
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RichText(
                  text: TextSpan(style: TextStyle(fontSize: 15), children: [
                TextSpan(
                    text: "*",
                    style: TextStyle(color: Color.fromRGBO(255, 75, 38, 1))),
                TextSpan(
                    text:
                        " We will send you a message to set or reset your new password")
              ])),
              SizedBox(
                height: size.height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Send Code",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
