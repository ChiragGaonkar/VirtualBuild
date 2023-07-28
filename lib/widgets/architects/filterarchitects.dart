import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:provider/provider.dart';

import '../../providers/architects_provider.dart';

class FilterArchitects extends StatefulWidget {
  final TextButton reset;
  const FilterArchitects({super.key, required this.reset});

  @override
  State<FilterArchitects> createState() => _FilterArchitectsState();
}

class _FilterArchitectsState extends State<FilterArchitects> {
  RangeValues _currentRangeValuesExperience = const RangeValues(30, 50);
  final TextEditingController _locationTextController = TextEditingController();
  final TextEditingController _architectTypeTextController = TextEditingController();
  void updateLocation(String selectedLocation) {
    _locationTextController.text = selectedLocation;
  }

  void updateArchitectType(String selectedArchitectType) {
    _architectTypeTextController.text = selectedArchitectType;
  }

  final List<SelectedListItem> _listOfLocations = [
    SelectedListItem(
      name: "Assam",
      // value: "abc",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Bihar",
      // value: "bcd",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Chennai",
      // value: "abc",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Delhi",
      // value: "bcd",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Goa",
      // value: "bcd",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Gujarat",
      // value: "bcd",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Jammu Kashmir",
      // value: "bcd",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Mumbai",
      // value: "bcd",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Punjab",
      // value: "bcd",
      isSelected: false,
    ),
    // SelectedListItem(
    //   name: "Rajasthan",
    //   // value: "bcd",
    //   isSelected: false,
    // ),
    // SelectedListItem(
    //   name: "Tamil Nadu",
    //   // value: "bcd",
    //   isSelected: false,
    // ),
    // SelectedListItem(
    //   name: "Uttar Pradesh",
    //   // value: "bcd",
    //   isSelected: false,
    // ),
    // SelectedListItem(
    //   name: "West Bengal",
    //   // value: "bcd",
    //   isSelected: false,
    // ),
  ];

  final List<SelectedListItem> _listOfArchitectTypes = [
    SelectedListItem(
      name: "Residential Architects",
      // value: "abc",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Commercial Architects",
      // value: "bcd",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Interior Architects",
      // value: "abc",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Landscape Architects",
      // value: "bcd",
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var arch = Provider.of<ArchitectsProvider>(context, listen: false);
    return Container(
      child: Column(
        children: [
          // Container(
          //   // padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
          //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          //   child: Row(
          //     children: [
          //       SizedBox(height: size.height * 0.09),
          //       Flexible(
          //         child: AppTextField(
          //           textEditingController: _locationTextController,
          //           title: "Available Location",
          //           hint: "Available Location",
          //           selected: true,
          //           itemLists: _listOfLocations,
          //           onSelect: updateLocation,
          //         ),
          //       ),
          //       SizedBox(width: size.width * 0.05),
          //       Flexible(
          //         child: AppTextField(
          //           textEditingController: _architectTypeTextController,
          //           title: "Architect Type",
          //           hint: "Architect Type",
          //           selected: true,
          //           itemLists: _listOfArchitectTypes,
          //           onSelect: updateArchitectType,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  "Experience",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: size.width * 0.1),
                Expanded(
                  child: RangeSlider(
                    values: arch.currentRangeValuesExperience,
                    max: 50,
                    divisions: 5,
                    labels: RangeLabels(
                      '${arch.currentRangeValuesExperience.start.round().toString()} yrs',
                      '${arch.currentRangeValuesExperience.end.round().toString()} yrs',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        arch.currentRangeValuesExperience = values;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.reset,
              SizedBox(
                width: size.width * 0.02,
              )
            ],
          )
        ],
      ),
    );
  }
}

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool selected;
  final List<SelectedListItem>? itemLists;
  final Function(String)? onSelect;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.selected,
    this.itemLists,
    this.onSelect,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _searchTextEditingController = TextEditingController();
  List<SelectedListItem> _filteredItems = [];
  List<SelectedListItem>? _originalItems;

  void _buildSearchList(String value) {
    if (value.isEmpty) {
      setState(() {
        _filteredItems = _originalItems ?? [];
      });
    } else {
      setState(() {
        _filteredItems = widget.itemLists!.where((item) => item.name.toLowerCase().contains(value.toLowerCase())).toList();
      });
    }
  }
  //////////////////////////////////////////upon uncommenting the code, comment the below void onTextFieldTap() function .run

  // void onTextFieldTap() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           color:
  //               Color.fromARGB(255, 255, 255, 255), // change to desired color
  //           borderRadius: BorderRadius.vertical(
  //             top: Radius.circular(15.0),
  //           ),
  //         ),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                 color: Color.fromARGB(
  //                     255, 97, 94, 94), // change to desired color
  //                 borderRadius: BorderRadius.vertical(
  //                   top: Radius.circular(15.0),
  //                 ),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   IconButton(
  //                     icon: Icon(Icons.close),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                   ),
  //                   Text(
  //                     widget.title,
  //                     style: Theme.of(context).textTheme.titleLarge,
  //                   ),
  //                   SizedBox(
  //                     width: 32.0,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: 8.0,
  //             ),
  //             Expanded(
  //               child: ListView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: widget.itemLists?.length ?? 0,
  //                 itemBuilder: (BuildContext context, int index) {
  //                   final dynamic item = widget.itemLists![index];
  //                   return ListTile(
  //                     onTap: () {
  //                       if (widget.onSelect != null) {
  //                         if (item is SelectedListItem) {
  //                           widget.onSelect!(item.name);
  //                         } else if (item is String) {
  //                           widget.onSelect!(item);
  //                         }
  //                       }
  //                       Navigator.pop(context);
  //                     },
  //                     title: Text(
  //                       item.name ?? item,
  //                       style: Theme.of(context)
  //                           .textTheme
  //                           .titleMedium!
  //                           .copyWith(
  //                               color: Color.fromARGB(
  //                                   255, 0, 0, 0)), // change to desired color
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  void onTextFieldTap() {
    setState(() {
      _filteredItems = _originalItems ?? [];
    });
    // widget.textEditingController.clear();
    DropDownState(
      DropDown(
        isDismissible: true,
        // bottomSheetTitle: Text(
        //   widget.title,
        //   style: Theme.of(context).textTheme.titleLarge,
        // ),
        // isSearchVisible: true,
        // searchHintText: "..............",
        // data: widget.itemLists ?? [],
        dropDownBackgroundColor: Colors.black,
        ///////////////////////////////////////////////////////search function not working(now working) , upon commenting below searchwidget code default search bar appears with working functionality
        searchWidget: TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                // color: Color.fromRGBO(98, 98, 98, 1),
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // fillColor: Theme.of(context).canvasColor,
            fillColor: const Color.fromRGBO(98, 98, 98, 1),
            filled: true,
            // hintText: widget.hint,
            // contentPadding:const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            labelText: "Search",
            labelStyle: Theme.of(context).textTheme.titleSmall,
            prefixIcon: const Icon(Icons.search, color: Colors.white),
          ),
          controller: _searchTextEditingController,
          onChanged: (String value) {
            _buildSearchList(value); // Call the search function when the text changes
          },
        ),
        data: _filteredItems.isNotEmpty ? _filteredItems : widget.itemLists ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          if (list.isNotEmpty && widget.onSelect != null) {
            widget.onSelect!(list[0]);
          }
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          readOnly: true,
          onTap: widget.selected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(98, 98, 98, 1),
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            fillColor: Theme.of(context).canvasColor,
            filled: true,
            // hintText: widget.hint,
            // contentPadding:const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            labelText: widget.hint,
            labelStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////class _FilterArchitectsState trial codes for top dropdownmenu instead of bottom

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
// SizedBox(width: size.width * 0.09),
// Text(
//   "Architect Type",
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

// DropdownButton<String>(
//                   hint: Text(
//                     "Available Location",
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   value: _selectedState,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedState = newValue;
//                     });
//                   },
//                   // menuMaxHeight: 160,
//                   menuMaxHeight: 200,
//                   dropdownColor: Color.fromRGBO(98, 98, 98, 1),
//                   items: _states.map((state) {
//                     return DropdownMenuItem<String>(
//                       value: state,
//                       child: Text(
//                         state,
//                         style: Theme.of(context).textTheme.titleSmall,
//                       ),
//                     );
//                   }).toList(),
//                 ),
