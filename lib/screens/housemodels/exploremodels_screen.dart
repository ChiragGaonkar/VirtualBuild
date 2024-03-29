import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
import 'package:virtualbuild/widgets/housemodels/filtermodels.dart';
import 'package:virtualbuild/widgets/housemodels/modelscard.dart';
import '../../providers/models_provider.dart';
import '../../widgets/customloadingspinner.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/data_not_found.dart';
import '../../widgets/headerwithmenu.dart';

class ExploreModelsScreen extends StatefulWidget {
  ExploreModelsScreen({super.key});
  static const routeName = "/exploremodels";

  @override
  State<ExploreModelsScreen> createState() => _ExploreModelsScreenState();
}

class _ExploreModelsScreenState extends State<ExploreModelsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchTextController = TextEditingController();
  bool init = false;
  bool isFilterOn = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var modelData = Provider.of<ModelsProvider>(context, listen: false);
    print("init $init");
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: const CustomMenu(),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MyCustomScreen(
          // customColor: Colors.blue,
          screenContent: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWithMenu(
                header: "Explore 3D Models",
                scaffoldKey: scaffoldKey,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchTextController,
                      onChanged: (value) {
                        setState(
                            () {}); // Triggers a rebuild to update the stream
                      },
                      decoration: customDecorationForInput(
                        context,
                        "Search",
                        Icons.search,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: isFilterOn
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          print(isFilterOn);
                          isFilterOn = !isFilterOn;
                          if (isFilterOn == false) {
                            init = true;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: Theme.of(context).secondaryHeaderColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              if (isFilterOn)
                FilterModels(
                  reset: TextButton(
                    child: const Text('Reset'),
                    onPressed: () {
                      setState(() {
                        isFilterOn = false;
                        init = false;
                        modelData.resetValues();
                      });
                    },
                  ),
                ),
              SizedBox(
                height: size.height * 0.02,
              ),
              if (!init) ...[
                StreamBuilder(
                  // stream: modelData.getMyModels,
                  stream: _searchTextController.text.isNotEmpty
                      ? modelData.searchModels(_searchTextController.text)
                      : modelData.getMyModels,
                  builder: (context, snapshots) {
                    // init = !init;
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
                          (index) =>
                              ModelsCard(modelData: snapshots.data![index]),
                        ),
                      ),
                    );
                  },
                ),
              ] else ...[
                _searchTextController.text.isNotEmpty
                    ? StreamBuilder(
                        // stream: modelData.getMyModels,
                        stream:
                            modelData.searchModels(_searchTextController.text),
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
                                (index) => ModelsCard(
                                    modelData: snapshots.data![index]),
                              ),
                            ),
                          );
                        },
                      )
                    : FutureBuilder(
                        future: modelData.getFilteredModel(),
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
                                (index) => ModelsCard(
                                    modelData: snapshots.data![index]),
                              ),
                            ),
                          );
                        },
                      ),
              ],
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
