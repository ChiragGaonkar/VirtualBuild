import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:virtualbuild/models/architects_model.dart';
import '../housemodels/waveclipper.dart';

class ArchitectAtCarousel extends StatelessWidget {
  final ArchitectModel architectData;
  const ArchitectAtCarousel({
    super.key,
    required this.architectData,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 400,
          height: 250,
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
                clipper: WaveClipperDown(),
                child: GlassmorphicContainer(
                  width: 400,
                  height: 120,
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
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            architectData.architectName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "${architectData.architectOfficeLocation['city']}, ${architectData.architectOfficeLocation['state']}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "(${architectData.architectType} Architect)",
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
        ),
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: CircleAvatar(
            radius: 68,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(architectData.architectImageUrl.toString()),
              radius: 65,
            ),
          ),
        ),
      ],
    );
  }
}
