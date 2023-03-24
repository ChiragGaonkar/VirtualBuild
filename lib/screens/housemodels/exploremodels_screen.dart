import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/widgets/housemodels/modelscard.dart';
import '../../providers/models_provider.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/headerwithmenu.dart';

class ExploreModelsScreen extends StatelessWidget {
  ExploreModelsScreen({super.key});
  static const routeName = "/exploremodels";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var modelData = Provider.of<ModelsProvider>(context, listen: false);
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
              header: "Explore 3D Models",
              scaffoldKey: scaffoldKey,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.85,
                      width: size.width,
                      child: ResponsiveGridList(
                        rowMainAxisAlignment: MainAxisAlignment.end,
                        minItemsPerRow: 1,
                        minItemWidth: 300,
                        listViewBuilderOptions: ListViewBuilderOptions(
                          padding: EdgeInsets.zero,
                        ),
                        children: List.generate(
                          modelData.getModel.length,
                          (index) =>
                              ModelsCard(modelData: modelData.getModel[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
