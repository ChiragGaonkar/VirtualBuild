import 'package:flutter/material.dart';

import '../screens/accounts/account_screen.dart';

class HeaderWithNavigation extends StatelessWidget {
  final String heading;
  final String screenToBeRendered;
  const HeaderWithNavigation({
    super.key,
    required this.heading,
    required this.screenToBeRendered,
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
            } else if (screenToBeRendered == "") {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AccountScreen.routeName,
                  arguments: {"reload": true});
            } else {
              Navigator.of(context)
                  .pushNamed(screenToBeRendered, arguments: {"": ""});
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        Text(
          heading,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
