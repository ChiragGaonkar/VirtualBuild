import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:virtualbuild/models/architects_model.dart';

import '../housemodels/waveclipper.dart';

class ArchitectDetailCard extends StatelessWidget {
  final ArchitectModel args;
  const ArchitectDetailCard({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var location = args.architectOfficeLocation;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 500,
          height: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage(
                "assets/starbg.png",
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: WaveClipperDown(),
                child: GlassmorphicContainer(
                  width: 500,
                  height: 300,
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
                    ],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 50, 20, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              args.architectName,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Company Name : ${location['companyName']}",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          "Address : ${location['companyStreetAddress']}, ${location['city']}, ${location['state']}, ${location['country']}, ${location['zipCode']}.",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          "Registration No : ${args.architectRegisterNum}",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          "Architect Type : ${args.architectType} Architect",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          "Expertise : ${args.architectExperience} years",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          child: CircleAvatar(
            radius: 62,
            backgroundColor: Theme.of(context).primaryColor,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                args.architectImageUrl.toString(),
              ),
              radius: 60,
            ),
          ),
        ),
      ],
    );
  }
}
