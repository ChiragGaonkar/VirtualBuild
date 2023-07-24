import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../error_screen.dart';
import 'exploremodels_screen.dart';

class PlanInDetailScreen extends StatelessWidget {
  const PlanInDetailScreen({super.key});
  static const routeName = "/planInDetailScreen";

  @override
  Widget build(BuildContext context) {
    bool isErrorOccured = false;
    String image = "";
    try {
      isErrorOccured = false;
      image = ModalRoute.of(context)!.settings.arguments as String;
    } catch (e) {
      isErrorOccured = true;
    }
    return isErrorOccured
        ? const ErrorScreen(
            screenToBeRendered: ExploreModelsScreen.routeName,
            renderScreenName: "Explore 3d Models",
          )
        : Scaffold(
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: PhotoView(
                imageProvider: NetworkImage(
                  image,
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: const Text("Cancel"),
              icon: const Icon(Icons.cancel_outlined),
            ),
          );
  }
}
