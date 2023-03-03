import 'package:flutter/material.dart';

class HouseIcons extends StatefulWidget {
  const HouseIcons({Key? key}) : super(key: key);

  @override
  State<HouseIcons> createState() => _HouseIconsState();
}

class _HouseIconsState extends State<HouseIcons> {

  Widget IconTextCombine(IconData icon, String text){
    return Container(
      child: Column(
        children: [
          Icon(icon, color: Colors.red,),
          Text(text)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconTextCombine(Icons.bed, "2 Beds"),
          IconTextCombine(Icons.bathroom, "2 Baths"),
          IconTextCombine(Icons.house, "2 Floor"),
          IconTextCombine(Icons.garage, "2 Garage"),
        ],
      ),
    );
  }
}