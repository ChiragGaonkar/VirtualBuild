import 'package:flutter/material.dart';

class MainPageButton extends StatefulWidget {
  const MainPageButton({Key? key}) : super(key: key);

  @override
  State<MainPageButton> createState() => _MainPageButtonState();
}

class _MainPageButtonState extends State<MainPageButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width * 0.35;
    var height = size.height * 0.06;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              width,
              height,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: null,
          child: Text(
            "Add to Favourites",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              width,
              height,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: null,
          child: Text(
            "Buy",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}