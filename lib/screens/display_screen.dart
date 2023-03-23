import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/providers/architects_provider.dart';
import 'package:virtualbuild/providers/models_provider.dart';
import 'package:virtualbuild/widgets/architects/architectatcarousel.dart';
import 'package:virtualbuild/widgets/custommenu.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithmenu.dart';
import 'package:virtualbuild/widgets/housemodels/modelscard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});
  static const routeName = "/display";

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var modelData = Provider.of<ModelsProvider>(context, listen: false);
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
              header: "Bring to Light",
              scaffoldKey: scaffoldKey,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    if (!kIsWeb)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          "Top Architects",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    if (!kIsWeb)
                      CarouselSlider.builder(
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return ArchitectAtCarousel(
                            architectData:
                                architectData.getArchitects[itemIndex],
                          );
                        },
                        itemCount: architectData.getArchitects.length,
                        options: CarouselOptions(
                          height: 300,
                          autoPlayCurve: Curves.easeInOut,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          initialPage: 2,
                          autoPlay: true,
                          reverse: true,
                        ),
                      ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        "Popular 3D Models",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: size.height,
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
                          (index) => ModelsCard(
                            modelData: modelData.getModel[index],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
