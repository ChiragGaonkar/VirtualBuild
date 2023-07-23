import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/models/architects_model.dart';
import 'package:virtualbuild/screens/architects/explorearchitects_screen.dart';
import 'package:virtualbuild/screens/display_screen.dart';
import 'package:virtualbuild/screens/error_screen.dart';
import 'package:virtualbuild/widgets/architects/architectdetailscard.dart';
import 'package:virtualbuild/widgets/architects/architectsproject.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithnavigation.dart';
import '../../providers/models_provider.dart';
import '../../widgets/customloadingspinner.dart';

class ArchitectDetailScreen extends StatelessWidget {
  const ArchitectDetailScreen({super.key});
  static const routeName = '/architectDetail';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isDesktop = size.width >= 600;
    bool isMobile = size.width < 600;
    bool isErrorOccured = false;
    ArchitectModel args = ArchitectModel(
      architectID: "",
      architectName: "",
      architectType: "",
      architectRegisterNum: "",
      architectExperience: "",
      architectOfficeLocation: {},
      aboutMe: "",
      skills: [],
    );
    try {
      isErrorOccured = false;
      args = ModalRoute.of(context)!.settings.arguments as ArchitectModel;
    } catch (e) {
      isErrorOccured = true;
    }
    var modelData = Provider.of<ModelsProvider>(context, listen: false);
    return isErrorOccured
        ? const ErrorScreen(
            screenToBeRendered: ExploreArchitectsScreen.routeName,
            renderScreenName: "Explore Architects",
          )
        : Scaffold(
            body: MyCustomScreen(
              screenContent: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWithNavigation(
                    heading: args.architectName,
                    screenToBeRendered: "None",
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.7,
                      width: size.width,
                      child: SingleChildScrollView(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 10,
                          spacing: 50,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ArchitectDetailCard(args: args),
                                if (args.skills.isNotEmpty)
                                  SizedBox(
                                    width: 500,
                                    child: ResponsiveGridList(
                                      minItemWidth: 150,
                                      shrinkWrap: true,
                                      listViewBuilderOptions:
                                          ListViewBuilderOptions(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 0,
                                        ),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                      ),
                                      children: List.generate(
                                        args.skills.length,
                                        (index) => Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              args.skills[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              width: 500,
                              height: args.aboutMe.length < 400
                                  ? size.height * 0.8
                                  : size.height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Who am I?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    args.aboutMe,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Personal Projects",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  const SizedBox(height: 15),
                                  // StreamBuilder(
                                  //   stream:
                                  //       modelData.getArchitectSpecificModels(
                                  //           args.architectID),
                                  //   builder: (context, snapshots) {
                                  //     if (!snapshots.hasData) {
                                  //       return const CustomLoadingSpinner();
                                  //     } else if (snapshots.data!.isEmpty) {
                                  //       return Container(
                                  //         width: 400,
                                  //         height: 250,
                                  //         decoration: BoxDecoration(
                                  //           // color: Theme.of(context).canvasColor,
                                  //           borderRadius:
                                  //               BorderRadius.circular(20),
                                  //           image: const DecorationImage(
                                  //             image: AssetImage(
                                  //                 "assets/NoData.png"),
                                  //             fit: BoxFit.cover,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     }
                                  StreamBuilder(
                                    stream:
                                        modelData.getArchitectSpecificModels(
                                      args.architectID,
                                    ),
                                    builder: (context, snapshots) {
                                      if (!snapshots.hasData) {
                                        return const CustomLoadingSpinner();
                                      } else if (snapshots.data!.isEmpty) {
                                        return Container(
                                          width: 400,
                                          height: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/NoData.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      }
                                      return Flexible(
                                        child: CarouselSlider.builder(
                                          itemBuilder: (context, itemIndex,
                                              pageViewIndex) {
                                            return ArchitectsProjectsCard(
                                              modelData:
                                                  snapshots.data![itemIndex],
                                            );
                                          },
                                          itemCount: snapshots.data!.length,
                                          options: CarouselOptions(
                                            height: isMobile ? 200 : 250,
                                            autoPlayCurve: Curves.easeInOut,
                                            viewportFraction: 0.8,
                                            enlargeCenterPage: true,
                                            initialPage: 2,
                                            autoPlay: true,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
