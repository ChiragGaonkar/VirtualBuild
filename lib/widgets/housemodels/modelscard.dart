import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:virtualbuild/widgets/housemodels/modelscardicons.dart';
import 'package:virtualbuild/widgets/housemodels/modelscardbuttons.dart';
import 'package:virtualbuild/widgets/housemodels/waveclipper.dart';

class ModelsCard extends StatefulWidget {
  const ModelsCard({super.key});

  @override
  State<ModelsCard> createState() => _ModelsCardState();
}

class _ModelsCardState extends State<ModelsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "https://images.pexels.com/photos/13041126/pexels-photo-13041126.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: isExpanded == true ? WaveClipperUp() : WaveClipperDown(),
            child: GlassmorphicContainer(
              width: size.width,
              height: isExpanded == true ? 250 : 120,
              borderRadius: 20,
              blur: 26,
              border: 0,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                    Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
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
                                  "Modern Villa",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  "(920 sq.ft)",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            Text(
                              "By Chirag Gaonkar",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Text(
                          "₹5Cr",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        children: [
                          const ModelsCardIcons(
                            numOfBeds: 4,
                            numOfBaths: 5,
                            numOfFloors: 2,
                            numOfGarage: 1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        )
      ],
    );
  }
}
