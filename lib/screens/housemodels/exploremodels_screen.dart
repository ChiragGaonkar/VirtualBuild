import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/screens/housemodels/models_detail_screen.dart';
import 'package:virtualbuild/widgets/customdecorationforinput.dart';
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
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
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
              Flexible(
                child: ResponsiveGridList(
                  rowMainAxisAlignment: MainAxisAlignment.end,
                  minItemsPerRow: 1,
                  minItemWidth: 300,
                  listViewBuilderOptions: ListViewBuilderOptions(
                    padding: EdgeInsets.zero,
                  ),
                  children: List.generate(
                    modelData.getModel.length,
                    (index) => ModelsCard(modelData: modelData.getModel[index]),
                  ),
                ),
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
