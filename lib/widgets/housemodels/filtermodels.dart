import 'package:flutter/material.dart';

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
                      values: _currentRangeValuesPrice,
                      max: 20000,
                      divisions: 5,
                      labels: RangeLabels(
                        '₹${_currentRangeValuesPrice.start.round().toString()}',
                        '₹${_currentRangeValuesPrice.end.round().toString()}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValuesPrice = values;
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
                      values: _currentRangeValuesArea,
                      max: 3000,
                      divisions: 5,
                      labels: RangeLabels(
                        '${_currentRangeValuesArea.start.round().toString()} sqft',
                        '${_currentRangeValuesArea.end.round().toString()} sqft',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValuesArea = values;
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
                        value: _currentValueFloor,
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: _currentValueFloor.round().toString(),
                        onChanged: (double val) {
                          setState(() {
                            _currentValueFloor = val;
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
                        value: _currentValueBeds,
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: _currentValueBeds.round().toString(),
                        onChanged: (double val) {
                          setState(() {
                            _currentValueBeds = val;
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
                        value: _currentValueBaths,
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: _currentValueBaths.round().toString(),
                        onChanged: (double val) {
                          setState(() {
                            _currentValueBaths = val;
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
