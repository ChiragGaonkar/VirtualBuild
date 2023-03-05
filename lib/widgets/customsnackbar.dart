import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackBar extends StatefulWidget {
  final String errorToBePrinted;
  const CustomSnackBar({
    super.key,
    required this.errorToBePrinted,
  });

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 80,
          decoration: BoxDecoration(
              color: const Color(0xFFC72C41),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.1,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oh snap!!",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      widget.errorToBePrinted,
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
            child: Stack(
              children: [
                // SvgPicture.asset(
                //   "assets/icons/bubbles.svg",
                //   height: 48,
                //   width: 40,
                //   color: const Color(0xFF801336),
                // ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // SvgPicture.asset(
              //   "assets/icons/bubbles.svg",
              //   height: 40,
              // ),
              // Positioned(
              //   top: 10,
              //   child: SvgPicture.asset(
              //     "assets/icons/bubble.jpg",
              //     height: 16,
              //   ),
              // )
            ],
          ),
        )
      ],
    );
  }
}
