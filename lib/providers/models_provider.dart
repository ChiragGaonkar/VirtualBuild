import 'package:flutter/material.dart';
import 'package:virtualbuild/models/models3d_model.dart';

class ModelsProvider with ChangeNotifier {
  final List<Models3D> _models = [
    Models3D(
      modelId: "1",
      modelImageURL:
          "https://t4.ftcdn.net/jpg/01/88/09/67/240_F_188096730_3hHZnyYI7zH7ATN4QJdNoZgMJDRAdbGW.jpg",
      modelName: "Villa De Chirag",
      modelArea: 1001,
      modelPrice: 50,
      modelArchitect: "Chirag Gaonkar",
      modelBeds: 7,
      modelBaths: 7,
      modelFloors: 3,
      modelGarage: 2,
      model3dURL: 'assets/3dModels/Villa1.glb',
    ),
    Models3D(
      modelId: "2",
      modelImageURL:
          "https://t3.ftcdn.net/jpg/03/40/93/62/240_F_340936278_XLR86aeXaXEUbWlqYZ8qciya9IewWsZu.jpg",
      modelName: "Villa De Mithilesh",
      modelArea: 920,
      modelPrice: 28,
      modelArchitect: "Mithilesh Kapadi",
      modelBeds: 4,
      modelBaths: 5,
      modelFloors: 2,
      modelGarage: 1,
      model3dURL: 'assets/3dModels/Villa2.glb',
    ),
    Models3D(
      modelId: "3",
      modelImageURL:
          "https://t3.ftcdn.net/jpg/02/89/22/96/240_F_289229654_N3VloeJOMDF6rHvM7XHMIHZNznYpia3v.jpg",
      modelName: "Villa De Madhura",
      modelArea: 800,
      modelPrice: 25,
      modelArchitect: "Madhura Patil",
      modelBeds: 5,
      modelBaths: 2,
      modelFloors: 2,
      modelGarage: 2,
      model3dURL: 'assets/3dModels/Villa3.glb',
    ),
    Models3D(
      modelId: "4",
      modelImageURL:
          "https://t3.ftcdn.net/jpg/01/88/09/66/240_F_188096655_J4c4pxOikLiHMkN9vqE6dQ3mH9CtfITo.jpg",
      modelName: "Gayatri De Villa",
      modelArea: 820,
      modelPrice: 30,
      modelArchitect: "Gayatri Gaonkar",
      modelBeds: 4,
      modelBaths: 2,
      modelFloors: 3,
      modelGarage: 2,
      model3dURL: 'assets/3dModels/Villa6.glb',
    ),
  ];

  List<Models3D> get getModel {
    return [..._models];
  }

  Models3D getModelById(String id) {
    return _models.firstWhere((prod) => prod.modelId == id);
  }
}
