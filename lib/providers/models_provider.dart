import 'package:flutter/material.dart';
import 'package:virtualbuild/models/models3d_model.dart';

class ModelsProvider with ChangeNotifier {
  bool init = false;
  List<Models3D> models = [
    Models3D(
      modelId: '1',
      modelImageURL: "assets/imagesModels/GECBunglow.png",
      model3dURL: "assets/3dModels/GECBunglow.glb",
      modelName: "GEC Guest House",
      modelPrice: 25,
      modelEstimatedPrice: 10000000,
      modelArchitectname: "Ganesh Gaonkar",
      modelArchitectID: "1",
      modelColorScheme: "Monochromatic",
      modelFloors: 1,
      modelTotalSquareFootage: 400,
      modelRoofStyle: "Gambrel",
      modelNumberOfCommonRooms: 2,
      modelNumberOfBedrooms: 2,
      modelNumberOfBaths: 3,
      modelFlooringOfRooms: ["Laminate"],
      modelLightingOfRooms: ["Track lighting"],
      modelCeilingHeight: 9.0,
      modelKitchenCountertops: "Laminate",
      modelKitchenCabinetry: "Flat Panel",
      modelFlooringOfKitchen: "Vinyl",
      modelBathroomVanity: "Pedestal Sink Vanity",
      modelFlooringOfBathrooms: "Laminate",
      modelYard: true,
      modelDeck: false,
      modelPatio: false,
      modelGarageNumOfParkings: 2,
      modelPool: false,
      modelLandscapingStyle: "Japanese Garden",
      modelTechnologyAndSmartFeatures: ["Smart thermostat"],
      modelEnergyEfficiencyTools: ["Solar panels"],
    ),
    Models3D(
      modelId: '2',
      modelImageURL: "assets/imagesModels/Villa1.png",
      model3dURL: "assets/3dModels/Villa1.glb",
      modelName: "Serenity House",
      modelPrice: 5000,
      modelEstimatedPrice: 10000000,
      modelArchitectname: "Mahesh Naik",
      modelArchitectID: "1",
      modelColorScheme: "Complementary",
      modelFloors: 2,
      modelTotalSquareFootage: 600,
      modelRoofStyle: "Deck Roof",
      modelNumberOfCommonRooms: 4,
      modelNumberOfBedrooms: 4,
      modelNumberOfBaths: 6,
      modelFlooringOfRooms: ["Vinyl"],
      modelLightingOfRooms: ["Ambient lighting"],
      modelCeilingHeight: 9.0,
      modelKitchenCountertops: "Quartz",
      modelKitchenCabinetry: "Flat Panel",
      modelFlooringOfKitchen: "Vinyl",
      modelBathroomVanity: "Free-Standing Vanity",
      modelFlooringOfBathrooms: "Vinyl",
      modelYard: true,
      modelDeck: true,
      modelPatio: false,
      modelGarageNumOfParkings: 2,
      modelPool: true,
      modelLandscapingStyle: "French Garden",
      modelTechnologyAndSmartFeatures: ["Security system"],
      modelEnergyEfficiencyTools: ["•	High-efficiency HVAC system"],
    ),
    Models3D(
      modelId: '3',
      modelImageURL: "assets/imagesModels/Villa2.png",
      model3dURL: "assets/3dModels/Villa2.glb",
      modelName: "Whispering Pines",
      modelPrice: 47,
      modelEstimatedPrice: 10000000,
      modelArchitectname: "Shreya Gaonkar",
      modelArchitectID: "1",
      modelColorScheme: "Triadic",
      modelFloors: 1,
      modelTotalSquareFootage: 457,
      modelRoofStyle: "Flat or terraced",
      modelNumberOfCommonRooms: 2,
      modelNumberOfBedrooms: 2,
      modelNumberOfBaths: 3,
      modelFlooringOfRooms: ["Laminate"],
      modelLightingOfRooms: ["Track lighting"],
      modelCeilingHeight: 9.0,
      modelKitchenCountertops: "Laminate",
      modelKitchenCabinetry: "Flat Panel",
      modelFlooringOfKitchen: "Vinyl",
      modelBathroomVanity: "Pedestal Sink Vanity",
      modelFlooringOfBathrooms: "Laminate",
      modelYard: true,
      modelDeck: false,
      modelPatio: false,
      modelGarageNumOfParkings: 2,
      modelPool: false,
      modelLandscapingStyle: "Japanese Garden",
      modelTechnologyAndSmartFeatures: ["Smart thermostat"],
      modelEnergyEfficiencyTools: ["Solar panels"],
    ),
    Models3D(
      modelId: '4',
      modelImageURL: "assets/imagesModels/Villa3.png",
      model3dURL: "assets/3dModels/Villa3.glb",
      modelName: "Seaside Retreat",
      modelPrice: 70,
      modelEstimatedPrice: 10000000,
      modelArchitectname: "Jonita Gandhi",
      modelArchitectID: "1",
      modelColorScheme: "Monochromatic",
      modelFloors: 1,
      modelTotalSquareFootage: 400,
      modelRoofStyle: "Gambrel",
      modelNumberOfCommonRooms: 2,
      modelNumberOfBedrooms: 2,
      modelNumberOfBaths: 3,
      modelFlooringOfRooms: ["Laminate"],
      modelLightingOfRooms: ["Track lighting"],
      modelCeilingHeight: 9.0,
      modelKitchenCountertops: "Laminate",
      modelKitchenCabinetry: "Flat Panel",
      modelFlooringOfKitchen: "Vinyl",
      modelBathroomVanity: "Pedestal Sink Vanity",
      modelFlooringOfBathrooms: "Laminate",
      modelYard: true,
      modelDeck: false,
      modelPatio: false,
      modelGarageNumOfParkings: 2,
      modelPool: false,
      modelLandscapingStyle: "Japanese Garden",
      modelTechnologyAndSmartFeatures: ["Smart thermostat"],
      modelEnergyEfficiencyTools: ["Solar panels"],
    ),
    Models3D(
      modelId: '5',
      modelImageURL: "assets/imagesModels/Villa4.png",
      model3dURL: "assets/3dModels/Villa4.glb",
      modelName: "Tranquility Manor",
      modelPrice: 67,
      modelEstimatedPrice: 10000000,
      modelArchitectname: "Tara Shetkar",
      modelArchitectID: "1",
      modelColorScheme: "Monochromatic",
      modelFloors: 1,
      modelTotalSquareFootage: 400,
      modelRoofStyle: "Gambrel",
      modelNumberOfCommonRooms: 2,
      modelNumberOfBedrooms: 2,
      modelNumberOfBaths: 3,
      modelFlooringOfRooms: ["Laminate"],
      modelLightingOfRooms: ["Track lighting"],
      modelCeilingHeight: 9.0,
      modelKitchenCountertops: "Laminate",
      modelKitchenCabinetry: "Flat Panel",
      modelFlooringOfKitchen: "Vinyl",
      modelBathroomVanity: "Pedestal Sink Vanity",
      modelFlooringOfBathrooms: "Laminate",
      modelYard: true,
      modelDeck: false,
      modelPatio: false,
      modelGarageNumOfParkings: 2,
      modelPool: false,
      modelLandscapingStyle: "Japanese Garden",
      modelTechnologyAndSmartFeatures: ["Smart thermostat"],
      modelEnergyEfficiencyTools: ["Solar panels"],
    ),
    Models3D(
      modelId: '6',
      modelImageURL: "assets/imagesModels/Villa5.png",
      model3dURL: "assets/3dModels/Villa6.glb",
      modelName: "Sunrise Haven",
      modelPrice: 42,
      modelEstimatedPrice: 10000000,
      modelArchitectname: "Vishwas Kapadi",
      modelArchitectID: "1",
      modelColorScheme: "Monochromatic",
      modelFloors: 1,
      modelTotalSquareFootage: 400,
      modelRoofStyle: "Gambrel",
      modelNumberOfCommonRooms: 2,
      modelNumberOfBedrooms: 2,
      modelNumberOfBaths: 3,
      modelFlooringOfRooms: ["Laminate"],
      modelLightingOfRooms: ["Track lighting"],
      modelCeilingHeight: 9.0,
      modelKitchenCountertops: "Laminate",
      modelKitchenCabinetry: "Flat Panel",
      modelFlooringOfKitchen: "Vinyl",
      modelBathroomVanity: "Pedestal Sink Vanity",
      modelFlooringOfBathrooms: "Laminate",
      modelYard: true,
      modelDeck: false,
      modelPatio: false,
      modelGarageNumOfParkings: 2,
      modelPool: false,
      modelLandscapingStyle: "Japanese Garden",
      modelTechnologyAndSmartFeatures: ["Smart thermostat"],
      modelEnergyEfficiencyTools: ["Solar panels"],
    ),
  ];

  RangeValues currentRangeValuesPrice = const RangeValues(4000, 12000);
  RangeValues currentRangeValuesArea = const RangeValues(1800, 3000);
  double currentValueFloor = 3;
  double currentValueBeds = 6;
  double currentValueBaths = 5;

  List<Models3D> get getModel {
    return [...models];
  }

  List<Models3D> get getFilteredModel {
    print("currentRangeValuesPrice $currentRangeValuesPrice");
    print("currentRangeValuesArea $currentRangeValuesArea");
    print("currentValueFloor $currentValueFloor");
    print("currentValueBeds $currentValueBeds");
    List<Models3D> w3 = models
        .where((e) =>
            (e.modelPrice >= currentRangeValuesPrice.start &&
                e.modelPrice <= currentRangeValuesPrice.end) &&
            (e.modelTotalSquareFootage >= currentRangeValuesArea.start &&
                e.modelTotalSquareFootage <= currentRangeValuesArea.end) &&
            (e.modelFloors >= currentValueFloor) &&
            (e.modelNumberOfBedrooms >= currentValueBeds) &&
            (e.modelNumberOfBaths >= currentValueBaths))
        .toList();
    //models = w3;
    print(w3.length);
    return w3;
  }

  Models3D getModelById(String id) {
    return models.firstWhere((prod) => prod.modelId == id);
  }
}
