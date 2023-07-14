import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  final String screenToBeRendered;
  final String renderScreenName;
  const ErrorScreen({
    super.key,
    required this.screenToBeRendered,
    required this.renderScreenName,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: size.height * 0.4,
                child: Lottie.asset("walkingPencil.json")),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Something went wrong.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: ' Return to $renderScreenName',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context)
                            .popAndPushNamed(screenToBeRendered);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
