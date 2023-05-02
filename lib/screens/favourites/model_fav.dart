import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../providers/models_provider.dart';
import '../../widgets/housemodels/modelscard.dart';

class ModelFav extends StatefulWidget {
  const ModelFav({super.key});

  @override
  State<ModelFav> createState() => _ModelFavState();
}

class _ModelFavState extends State<ModelFav> {
  final ScrollController gridController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var modelData = Provider.of<ModelsProvider>(context, listen: false);
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
          modelData.getModel.length,
          (index) => ModelsCard(
            modelData: modelData.getModel[index],
          ),
        ),
      ),
    );
  }
}
