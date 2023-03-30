import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:virtualbuild/models/architects_model.dart';
import '../housemodels/modelscardbuttons.dart';
import '../housemodels/waveclipper.dart';

class ArchitectsCard extends StatefulWidget {
  final ArchitectsModel architectData;
  const ArchitectsCard({super.key, required this.architectData});

  @override
  State<ArchitectsCard> createState() => _ArchitectsCardState();
}

class _ArchitectsCardState extends State<ArchitectsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.architectData.architectImage),
            radius: 70,
          ),
        ),
        Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage(
                "assets/starbg.png",
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.architectData.architectName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                "${widget.architectData.architectOfficeLocation['city']}, ${widget.architectData.architectOfficeLocation['state']}",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              // physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              children: [
                                Text(
                                  "Registration No. ${widget.architectData.architectRegNumber}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "${widget.architectData.architectType} Architect (${widget.architectData.architectExperience} years)",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ModelsCardButtons(
                                      buttontext: "Favorite",
                                      whatOnPressed: () {
                                        //Write a function when add to favorites;
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                      height: 10,
                                    ),
                                    ModelsCardButtons(
                                      buttontext: "Hire",
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
    );
  }
}
