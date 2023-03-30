import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:virtualbuild/models/models3d_model.dart';
import 'package:virtualbuild/widgets/housemodels/modelscardicons.dart';
import 'package:virtualbuild/widgets/housemodels/modelscardbuttons.dart';
import 'package:virtualbuild/widgets/housemodels/waveclipper.dart';

import '../../screens/housemodels/models_detail_screen.dart';

class ModelsCard extends StatefulWidget {
  final Models3D modelData;
  const ModelsCard({
    super.key,
    required this.modelData,
  });

  @override
  State<ModelsCard> createState() => _ModelsCardState();
}

class _ModelsCardState extends State<ModelsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ModelsDetailScreen.routeName,
        arguments: widget.modelData.modelId,
      ),
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  widget.modelData.modelImageURL,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper:
                      isExpanded == true ? WaveClipperUp() : WaveClipperDown(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: isExpanded == true ? 250 : 120,
                    child: GlassmorphicContainer(
                      width: 400,
                      height: isExpanded == true ? 250 : 120,
                      borderRadius: 20,
                      blur: 26,
                      border: 0,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                          ],
                          stops: const [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 20, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              icon: Icon(
                                isExpanded == true
                                    ? Icons.keyboard_double_arrow_down
                                    : Icons.keyboard_double_arrow_up_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 25,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.modelData.modelName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        // Text(
                                        //   "(${widget.modelData.modelArea} sq.ft)",
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .titleSmall,
                                        // ),
                                      ],
                                    ),
                                    Text(
                                      "By ${widget.modelData.modelArchitect}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                                Text(
                                  "₹${widget.modelData.modelPrice}k",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                children: [
                                  ModelsCardIcons(
                                    numOfBeds: widget.modelData.modelBeds,
                                    numOfBaths: widget.modelData.modelBaths,
                                    numOfFloors: widget.modelData.modelFloors,
                                    numOfGarage: widget.modelData.modelGarage,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ModelsCardButtons(
                                        buttontext: "Favorite",
                                        whatOnPressed: () {
                                          //Write a function when add to favorites;
                                        },
                                      ),
                                      ModelsCardButtons(
                                        buttontext: "Buy",
                                        whatOnPressed: () {
                                          //Write a function to navigate Payment Page;
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
