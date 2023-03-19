import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingSpinner extends StatelessWidget {
  const CustomLoadingSpinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: Theme.of(context).primaryColor,
        size: size.width * 0.1,
      ),
    );
  }
}
