import 'package:flutter/material.dart';

import 'discover/houseicon.dart';
import 'discover/twosidebutton.dart';

class DModels extends StatefulWidget {
  DModels({Key? key}) : super(key: key);

  @override
  State<DModels> createState() => _DModelsState();
}

class _DModelsState extends State<DModels> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double borderRadius = 30.0;
    return Container(
      clipBehavior: Clip.hardEdge,
        height: 228,
        width: 339,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.35,
        minChildSize: 0.35,
        maxChildSize: 0.8,
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ListView(
              controller: scrollController,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                            text: "Modern Villa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          ),
                          TextSpan(
                            text:
                            " (980 sq ft.)",
                          ),
                          TextSpan(
                            text:
                            " \nBy Ajay Gaonkar",
                          ),
                        ],
                      ),
                    ),
                    Text("Rs. 5000",
                        style: TextStyle(

                            fontWeight: FontWeight.bold
                        )),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.035,
                ),
                HouseIcons(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                MainPageButton(),
                SizedBox(
                  height: size.height * 0.015,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




