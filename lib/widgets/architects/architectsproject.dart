import 'package:flutter/material.dart';
import 'package:virtualbuild/models/models3d_model.dart';

import '../../screens/housemodels/models_detail_screen.dart';

class ArchitectsProjectsCard extends StatelessWidget {
  final Models3D modelData;
  const ArchitectsProjectsCard({
    super.key,
    required this.modelData,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ModelsDetailScreen.routeName,
        arguments: modelData,
      ),
      child: Container(
        width: 400,
        height: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(
              modelData.modelImageURL,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.all(10),
                child: Text(
                  modelData.modelName,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
