import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/widgets/architects/architectscard.dart';
import '../../providers/architects_provider.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/headerwithmenu.dart';
import '../../widgets/housemodels/modelscard.dart';

class ExploreArchitectsScreen extends StatelessWidget {
  ExploreArchitectsScreen({super.key});

  static const routeName = "/explorearchitects";
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var architectData = Provider.of<ArchitectsProvider>(context, listen: false);
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
              header: "Explore Architects",
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
                          architectData.getArchitects.length,
                          (index) => ArchitectsCard(
                            architectData: architectData.getArchitects[index],
                          ),
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
