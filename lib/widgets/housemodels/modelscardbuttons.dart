import 'package:flutter/material.dart';

class ModelsCardButtons extends StatelessWidget {
  final String buttontext;
  final VoidCallback whatOnPressed;

  const ModelsCardButtons({
    super.key,
    required this.buttontext,
    required this.whatOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      elevation: 4,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size.width * 0.35, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          buttontext,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
