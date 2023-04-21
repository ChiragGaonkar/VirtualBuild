import 'package:flutter/material.dart';
import 'package:virtualbuild/screens/accounts/edit_profile_screen.dart';

class FilterArchitects extends StatefulWidget {
  const FilterArchitects({super.key});

  @override
  State<FilterArchitects> createState() => _FilterArchitectsState();
}

class _FilterArchitectsState extends State<FilterArchitects> {
  RangeValues _currentRangeValuesExperience = const RangeValues(30, 50);
  final List<String> _states = [
    // 'A',
    // 'B',
    // 'C',
    // 'D',
    // 'E',
    // 'F',
    // 'G',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];
  String? _selectedState;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(
              children: [
                SizedBox(height: size.height * 0.09),
                // Container(
                //   height: 50,
                // child: DropdownButton<String>(
                DropdownButton<String>(
                  hint: Text(
                    "Available Location",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  value: _selectedState,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedState = newValue;
                    });
                  },
                  // menuMaxHeight: 160,
                  menuMaxHeight: 200,
                  dropdownColor: Color.fromRGBO(98, 98, 98, 1),
                  items: _states.map((state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(
                        state,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  }).toList(),
                ),
                // ),
                SizedBox(width: size.width * 0.09),
                Text(
                  "Architect Type",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(EditProfileScreen.routeName, arguments: {}),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  "Experience",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: size.width * 0.1),
                Expanded(
                  child: RangeSlider(
                    values: _currentRangeValuesExperience,
                    max: 50,
                    divisions: 5,
                    labels: RangeLabels(
                      '${_currentRangeValuesExperience.start.round().toString()} yrs',
                      '${_currentRangeValuesExperience.end.round().toString()} yrs',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValuesExperience = values;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Text(
                //   "Available Location",
                //   style: Theme.of(context).textTheme.titleSmall,
                // ),
                // IconButton(
                //   onPressed: () => Navigator.of(context)
                //       .pushNamed(EditProfileScreen.routeName, arguments: {}),
                //   icon: const Icon(
                //     Icons.keyboard_arrow_down,
                //     color: Colors.white,
                //   ),
                //   visualDensity: VisualDensity.compact,
                // ),
