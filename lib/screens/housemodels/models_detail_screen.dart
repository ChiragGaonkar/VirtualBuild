import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualbuild/providers/models_provider.dart';
import 'package:virtualbuild/widgets/customscreen.dart';
import 'package:virtualbuild/widgets/headerwithnavigation.dart';

class ModelsDetailScreen extends StatelessWidget {
  const ModelsDetailScreen({super.key});
  static const routeName = '/ModelsDetail';

  Widget _descriptionHeading(BuildContext context, String heading) {
    return Row(
      //This row is used to left justify the container.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ],
    );
  }

  Widget _descriptionData(BuildContext context, String heading, String value,
      {String units = ""}) {
    return Column(
      children: [
        Text(
          heading,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "$value$units",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

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
            Expanded(
              child: Container(
                height: size.height * 0.7,
                width: size.width,
                // color: Colors.amber,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.network(
                          modelData.modelImageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "By ${modelData.modelArchitect}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "₹${modelData.modelPrice}",
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                      Divider(
                        color: Theme.of(context).primaryColor,
                      ),
                      Row(
                        //This row is used to left justify the container.
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _descriptionHeading(context, "Dimension"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _descriptionData(context, "Depth", "50", units: "'"),
                          _descriptionData(context, "Height", "30", units: "'"),
                          _descriptionData(context, "Width", "40", units: "'"),
                        ],
                      ),
                      _descriptionHeading(context, "Area Occupied"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _descriptionData(context, "Main Floor", "980",
                              units: "sq/ft"),
                          SizedBox(width: size.width * 0.1),
                          _descriptionData(context, "Porch", "200",
                              units: "sq/ft"),
                        ],
                      ),
                      _descriptionHeading(context, "Ceiling"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _descriptionData(context, "Main Ceiling", "9"),
                        ],
                      ),
                      _descriptionHeading(context, "Roof"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _descriptionData(context, "Primary Pitch", "8:12"),
                          _descriptionData(context, "Roof Type", "Concrete"),
                          _descriptionData(
                              context, "Secondary Pitch", "12:12:12"),
                        ],
                      ),
                      _descriptionHeading(context, "Roof"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _descriptionData(context, "Primary Pitch", "8:12"),
                          _descriptionData(context, "Roof Type", "Concrete"),
                          _descriptionData(
                              context, "Secondary Pitch", "12:12:12"),
                        ],
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
