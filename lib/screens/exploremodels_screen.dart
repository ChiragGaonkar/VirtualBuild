import 'package:flutter/material.dart';
import '../widgets/custommenu.dart';
import '../widgets/customscreen.dart';
import '../widgets/headerwithmenu.dart';

class ExploreModelsScreen extends StatelessWidget {
  ExploreModelsScreen({super.key});
  static const routeName = "/exploremodels";
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
              header: "Explore 3D Models",
              scaffoldKey: scaffoldKey,
            )
          ],
        ),
      ),
    );
  }
}
