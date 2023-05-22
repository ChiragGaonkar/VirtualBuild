import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/providers/architects_provider.dart';
import 'package:virtualbuild/providers/models_provider.dart';
import 'package:virtualbuild/widgets/architects/architectatcarousel.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';
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
  final ScrollController gridController = ScrollController();
  bool closeTopContainer = false;

  @override
  void initState() {
    super.initState();
    gridController.addListener(() {
      setState(() {
        closeTopContainer = gridController.offset > 50;
      });
    });
  }

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
            if (!closeTopContainer)
              SizedBox(
                height: size.height * 0.01,
              ),
            if (size.width < 450)
              if (!closeTopContainer)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "Top Architects",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
            if (size.width < 450)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : 300,
                  child: StreamBuilder(
                    stream: architectData.getArchitects,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CustomLoadingSpinner();
                      }
                      return CarouselSlider.builder(
                        itemBuilder: (context, itemIndex, pageViewIndex) {
                          return ArchitectAtCarousel(
                            architectData: snapshot.data![itemIndex],
                          );
                        },
                        itemCount: snapshot.data!.length,
                        options: CarouselOptions(
                          height: 300,
                          autoPlayCurve: Curves.easeInOut,
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          initialPage: 2,
                          autoPlay: true,
                          reverse: true,
                        ),
                      );
                    },
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                "Popular 3D Models",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            StreamBuilder(
              stream: modelData.getMyModels,
              builder: (context, snapshots) {
                if (!snapshots.hasData) {
                  return const CustomLoadingSpinner();
                }
                return Flexible(
                  child: ResponsiveGridList(
                    rowMainAxisAlignment: MainAxisAlignment.end,
                    minItemsPerRow: 1,
                    minItemWidth: 300,
                    listViewBuilderOptions: ListViewBuilderOptions(
                      padding: EdgeInsets.zero,
                      controller: gridController,
                      // physics: const AlwaysScrollableScrollPhysics(),
                      // shrinkWrap: true,
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
    );
  }
}
