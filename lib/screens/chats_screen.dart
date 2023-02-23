import 'package:flutter/material.dart';
import '../widgets/custommenu.dart';
import '../widgets/customscreen.dart';
import '../widgets/customtextfield.dart';
import '../widgets/headerwithmenu.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  static const routeName = "/chats";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomMenu(),
      body: MyCustomScreen(
        customColor: Colors.blue,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithMenu(
              header: "My Chats",
              scaffoldKey: scaffoldKey,
            ),
            //Can start from here.
          ],
        ),
      ),
    );
  }
}
