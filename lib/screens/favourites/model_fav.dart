import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/widgets/customloadingspinner.dart';

import '../../providers/models_provider.dart';
import '../../widgets/housemodels/modelscard.dart';

class ModelFav extends StatelessWidget {
  ModelFav({super.key});

  final ScrollController gridController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    return FutureBuilder(
      future: modelsProvider.getFavModel,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CustomLoadingSpinner();
        } else {
          print("In models Fav ${snapshot.data}");
        }
        return ResponsiveGridList(
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
            snapshot.data!.length,
            (index) => ModelsCard(
              modelData: snapshot.data![index],
            ),
          ),
        );
      },
    );
  }
}
