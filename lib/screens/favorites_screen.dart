import 'package:flutter/material.dart';
import '../widgets/custommenu.dart';
import '../widgets/customscreen.dart';
import '../widgets/headerwithmenu.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  static const routeName = "/favorites";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomMenu(),
      body: MyCustomScreen(
        // customColor: Colors.blue,
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithMenu(
              header: "Favorites",
              scaffoldKey: scaffoldKey,
            )
          ],
        ),
      ),
    );
  }
}
