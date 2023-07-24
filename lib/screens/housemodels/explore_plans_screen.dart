import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/screens/error_screen.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/headerwithnavigation.dart';
import 'exploremodels_screen.dart';
import 'plans_detail.dart';

class ExplorePlansScreen extends StatefulWidget {
  const ExplorePlansScreen({super.key});
  static const routeName = '/explorePlans';

  @override
  State<ExplorePlansScreen> createState() => _ExplorePlansScreenState();
}

class _ExplorePlansScreenState extends State<ExplorePlansScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isErrorOccured = false;
    Map<String, dynamic> args = {};
    try {
      isErrorOccured = false;
      args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    } catch (e) {
      isErrorOccured = true;
    }

    final List designKeys = [];
    args.forEach((key, value) {
      designKeys.add(key);
    });
    return isErrorOccured
        ? const ErrorScreen(
            screenToBeRendered: ExploreModelsScreen.routeName,
            renderScreenName: "Explore 3d Models",
          )
        : Scaffold(
            body: MyCustomScreen(
              screenContent: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderWithNavigation(
                    heading: "Building Layouts",
                    screenToBeRendered: "None",
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Expanded(
                    child: ResponsiveGridList(
                      rowMainAxisAlignment: MainAxisAlignment.end,
                      minItemsPerRow: 1,
                      minItemWidth: 300,
                      listViewBuilderOptions: ListViewBuilderOptions(
                        padding: EdgeInsets.zero,
                      ),
                      children: List.generate(
                        args.length,
                        (index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PlanInDetailScreen.routeName,
                              arguments: args[designKeys[index]],
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 400,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    args[designKeys[index]],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    color: Theme.of(context).primaryColor.withOpacity(0.85),
                                  ),
                                  child: Center(
                                    child: Text(
                                      designKeys[index],
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
