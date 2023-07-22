import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PlanInDetailScreen extends StatelessWidget {
  const PlanInDetailScreen({super.key});
  static const routeName = "/planInDetailScreen";

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
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
