import 'package:flutter/material.dart';
import 'package:virtualbuild/widgets/3dmodelsdisplay.dart';
import 'package:virtualbuild/widgets/custommenu.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithmenu.dart';
import 'package:virtualbuild/widgets/housemodels/modelscard.dart';

class DisplayScreen extends StatelessWidget {
  DisplayScreen({super.key});
  static const routeName = "/display";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              header: "Discover",
              scaffoldKey: scaffoldKey,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            DModels(),
            ModelsCard()
          ],
        ),
      ),
    );
  }
}
