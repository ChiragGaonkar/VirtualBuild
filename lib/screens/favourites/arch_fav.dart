import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../providers/architects_provider.dart';
import '../../widgets/architects/architectscard.dart';
import '../../widgets/customloadingspinner.dart';
import '../../widgets/data_not_found.dart';

class ArchFav extends StatelessWidget {
  ArchFav({super.key});

  @override
  Widget build(BuildContext context) {
    var architectData = Provider.of<ArchitectsProvider>(context, listen: false);
    return FutureBuilder(
      future: architectData.getFavArchitects(),
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return const CustomLoadingSpinner();
        } else if (snapshots.data!.isEmpty) {
          return const DataNotFound();
        }
        return ResponsiveGridList(
          rowMainAxisAlignment: MainAxisAlignment.end,
          minItemsPerRow: 1,
          minItemWidth: 300,
          listViewBuilderOptions: ListViewBuilderOptions(
            padding: EdgeInsets.zero,
          ),
          children: List.generate(
            snapshots.data!.length,
            (index) => ArchitectsCard(
              architectData: snapshots.data![index],
            ),
          ),
        );
      },
    );
  }
}
