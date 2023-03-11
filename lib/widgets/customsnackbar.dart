import 'package:flutter/material.dart';

class CustomSnackBar extends StatefulWidget {
  final String messageToBePrinted;
  final Color bgColor;
  const CustomSnackBar({
    super.key,
    required this.messageToBePrinted,
    required this.bgColor,
  });

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Oh snap!!",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      widget.messageToBePrinted,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: Image.asset(
              "assets/Holi.png",
              height: 70,
              // color: const Color(0xFF801336),
            ),
          ),
        ),
      ],
    );
  }
}
