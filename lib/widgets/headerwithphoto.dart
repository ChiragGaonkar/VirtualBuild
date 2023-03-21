import 'package:flutter/material.dart';

class HeaderWithPhoto extends StatelessWidget {
  final String heading;
  final String screenToBeRendered;
  final String imageURL;
  const HeaderWithPhoto({
    super.key,
    required this.heading,
    required this.screenToBeRendered,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (screenToBeRendered == "None") {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pushNamed(screenToBeRendered);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage(imageURL),
          // backgroundImage: NetworkImage(imageURL),
          backgroundColor: Theme.of(context).canvasColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            heading,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ],
    );
  }
}
