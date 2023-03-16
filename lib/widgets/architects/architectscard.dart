import 'package:flutter/material.dart';

class ArchitectsCard extends StatelessWidget {
  const ArchitectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width * 0.7,
          height: 160,
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                "Ajay Gaonkar",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Panaji Goa",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          child: PhysicalModel(
            elevation: 18.0,
            color: Colors.black,
            shadowColor: Colors.black,
            shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(70),
            child: const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/Male.png"),
            ),
          ),
        ),
      ],
    );
  }
}
