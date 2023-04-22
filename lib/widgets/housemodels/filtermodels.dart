import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/models_provider.dart';

class FilterModels extends StatefulWidget {
  const FilterModels({super.key});

  @override
  State<FilterModels> createState() => _FilterModelsState();
}

class _FilterModelsState extends State<FilterModels> {
  RangeValues _currentRangeValuesPrice = const RangeValues(4000, 12000);
  RangeValues _currentRangeValuesArea = const RangeValues(1800, 3000);
  double _currentValueFloor = 3;
  double _currentValueBeds = 6;
  double _currentValueBaths = 5;

  @override
  Widget build(BuildContext context) {
    var modelData = Provider.of<ModelsProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Price",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(
                    child: RangeSlider(
                      values: modelData.currentRangeValuesPrice,
                      max: 20000,
                      divisions: 5,
                      labels: RangeLabels(
                        '₹${modelData.currentRangeValuesPrice.start.round().toString()}',
                        '₹${modelData.currentRangeValuesPrice.end.round().toString()}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          //_currentRangeValuesPrice = values;
                          modelData.currentRangeValuesPrice = values;
                        });
                      },
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Area",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(
                    child: RangeSlider(
                      values: modelData.currentRangeValuesArea,
                      max: 3000,
                      divisions: 5,
                      labels: RangeLabels(
                        '${modelData.currentRangeValuesArea.start.round().toString()} sqft',
                        '${modelData.currentRangeValuesArea.end.round().toString()} sqft',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValuesArea = values;
                          modelData.currentRangeValuesArea = values;
                        });
                      },
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Floor",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.transparent,
                        inactiveTrackColor: Colors.transparent,
                        activeTickMarkColor: Colors.orange,
                        inactiveTickMarkColor: Colors.orange,
                      ),
                      child: Slider(
                        value: modelData.currentValueFloor,
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: modelData.currentValueFloor.round().toString(),
                        onChanged: (double val) {
                          setState(() {
                            _currentValueFloor = val;
                            modelData.currentValueFloor = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Beds",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.transparent,
                        inactiveTrackColor: Colors.transparent,
                        activeTickMarkColor: Colors.orange,
                        inactiveTickMarkColor: Colors.orange,
                      ),
                      child: Slider(
                        value: modelData.currentValueBeds,
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: modelData.currentValueBeds.round().toString(),
                        onChanged: (double val) {
                          setState(() {
                            _currentValueBeds = val;
                            modelData.currentValueBeds = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Baths",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(width: size.width * 0.1),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.transparent,
                        inactiveTrackColor: Colors.transparent,
                        activeTickMarkColor: Colors.orange,
                        inactiveTickMarkColor: Colors.orange,
                      ),
                      child: Slider(
                        value: modelData.currentValueBaths,
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: modelData.currentValueBaths.round().toString(),
                        onChanged: (double val) {
                          setState(() {
                            _currentValueBaths = val;
                            modelData.currentValueBaths = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
