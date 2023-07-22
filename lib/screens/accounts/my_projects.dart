import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/widgets/housemodels/modelscard.dart';
import '../../providers/models_provider.dart';
import '../../widgets/customloadingspinner.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/data_not_found.dart';
import '../../widgets/headerwithmenu.dart';

class MyProjectsScreen extends StatefulWidget {
  const MyProjectsScreen({super.key});
  static const routeName = "/myProjectsScreen";

  @override
  State<MyProjectsScreen> createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var modelData = Provider.of<ModelsProvider>(context, listen: false);
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomMenu(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: MyCustomScreen(
          // customColor: Colors.blue,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWithMenu(
                header: "My Projects",
                scaffoldKey: scaffoldKey,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder(
                future: modelData.getMyProjects,
                builder: (context, snapshots) {
                  if (!snapshots.hasData) {
                    return const CustomLoadingSpinner();
                  } else if (snapshots.data!.isEmpty) {
                    return const Align(
                      alignment: Alignment.center,
                      child: DataNotFound(),
                    );
                  }
                  return Flexible(
                    child: ResponsiveGridList(
                      rowMainAxisAlignment: MainAxisAlignment.end,
                      minItemsPerRow: 1,
                      minItemWidth: 300,
                      listViewBuilderOptions: ListViewBuilderOptions(
                        padding: EdgeInsets.zero,
                      ),
                      children: List.generate(
                        snapshots.data!.length,
                        (index) => ModelsCard(modelData: snapshots.data![index]),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
