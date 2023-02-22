import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import '../widgets/custommenu.dart';
import '../widgets/headerwithmenu.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  static const routeName = '/account';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomMenu(),
      body: MyCustomScreen(
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithMenu(
              header: "My Account",
              scaffoldKey: scaffoldKey,
            )
          ],
        ),
      ),
    );
  }
}
