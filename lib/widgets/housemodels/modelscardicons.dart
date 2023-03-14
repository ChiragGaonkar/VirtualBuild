import 'package:flutter/material.dart';

class ModelsCardIcons extends StatelessWidget {
  final int numOfBeds;
  final int numOfBaths;
  final int numOfFloors;
  final int numOfGarage;
  const ModelsCardIcons({
    super.key,
    required this.numOfBeds,
    required this.numOfBaths,
    required this.numOfFloors,
    required this.numOfGarage,
  });

  Widget iconTextCombine(
    IconData icon,
    String numOfAssets,
    String nameOfAssets,
    BuildContext context,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: Theme.of(context).secondaryHeaderColor,
          size: 40,
        ),
        Text(
          "$numOfAssets $nameOfAssets",
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconTextCombine(
            Icons.bedroom_parent,
            numOfBeds.toString(),
            "Beds",
            context,
          ),
          iconTextCombine(
            Icons.bathroom,
            numOfBaths.toString(),
            "Baths",
            context,
          ),
          iconTextCombine(
            Icons.roofing_rounded,
            numOfFloors.toString(),
            "Floors",
            context,
          ),
          iconTextCombine(
            Icons.garage_rounded,
            numOfGarage.toString(),
            "Garage",
            context,
          ),
        ],
      ),
    );
  }
}
