import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingSpinner extends StatelessWidget {
  const CustomLoadingSpinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          // leftDotColor: Theme.of(context).primaryColor,
          // rightDotColor: Theme.of(context).secondaryHeaderColor,
          color: Theme.of(context).primaryColor,
          size: 50,
        ),
      ),
    );
  }
}
