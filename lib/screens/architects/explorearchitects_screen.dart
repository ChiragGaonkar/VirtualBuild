import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/widgets/architects/architectscard.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
import '../../providers/architects_provider.dart';
import '../../widgets/customdecorationforinput.dart';
import '../../widgets/custommenu.dart';
import '../../widgets/customscreen.dart';
import '../../widgets/data_not_found.dart';
import '../../widgets/headerwithmenu.dart';
import '../../widgets/architects/filterarchitects.dart';

class ExploreArchitectsScreen extends StatefulWidget {
  ExploreArchitectsScreen({super.key});

  static const routeName = "/explorearchitects";

  @override
  State<ExploreArchitectsScreen> createState() => _ExploreArchitectsScreenState();
}

class _ExploreArchitectsScreenState extends State<ExploreArchitectsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchTextController = TextEditingController();
  bool isFilterArchitects = false;

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
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchTextController,
                    onChanged: (value) {
                      setState(() {}); // Triggers a rebuild to update the stream
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
                  decoration: BoxDecoration(color: isFilterArchitects ? Theme.of(context).primaryColor : Theme.of(context).canvasColor, borderRadius: BorderRadius.circular(15.0)),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        isFilterArchitects = !isFilterArchitects;
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
            SizedBox(
              height: size.height * 0.02,
            ),
            if (isFilterArchitects) const FilterArchitects(),
            StreamBuilder(
              // stream: architectData.getArchitects,
              stream: _searchTextController.text.isNotEmpty ? architectData.searchArchitects(_searchTextController.text) : architectData.getArchitects,
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
                      (index) => ArchitectsCard(
                        architectData: snapshots.data![index],
                      ),
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
    );
  }
}
