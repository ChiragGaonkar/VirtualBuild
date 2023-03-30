import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/providers/models_provider.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithnavigation.dart';

class ModelsDetailScreen extends StatelessWidget {
  const ModelsDetailScreen({super.key});
  static const routeName = '/ModelsDetail';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final modelId = ModalRoute.of(context)!.settings.arguments;
    final modelData = Provider.of<ModelsProvider>(context, listen: false)
        .getModelById(modelId.toString());
    return Scaffold(
      body: MyCustomScreen(
        screenContent: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithNavigation(
              heading: modelData.modelName,
              screenToBeRendered: "None",
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(
                    modelData.modelImageURL,
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
