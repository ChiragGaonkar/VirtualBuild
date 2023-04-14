class Models3D {
  //General
  final String modelId;
  final String modelImageURL;
  final String model3dURL;
  final String modelName;
  final double modelPrice;
  final double modelEstimatedPrice;
  final String modelArchitectname;
  final String modelArchitectID;

  //Exterior
  final String modelColorScheme;
  final int modelFloors;
  final int modelTotalSquareFootage;
  final String modelRoofStyle;

  //Interior
  final int modelNumberOfCommonRooms;
  final int modelNumberOfBedrooms;
  final int modelNumberOfBaths;
  final List modelFlooringOfRooms;
  final List modelLightingOfRooms;
  final double modelCeilingHeight;

  //Kitchen
  final String modelKitchenCountertops;
  final String modelKitchenCabinetry;
  final String modelFlooringOfKitchen;

  //Bathrooms
  final String modelBathroomVanity;
  final String modelFlooringOfBathrooms;

  //Outdoor Space
  final bool modelYard;
  final bool modelDeck;
  final bool modelPatio;
  final int modelGarageNumOfParkings;
  final bool modelPool;
  final String modelLandscapingStyle;

  //Technology and smart features
  final List modelTechnologyAndSmartFeatures;

  //EnergyEfficiency
  final List modelEnergyEfficiencyTools;

  Models3D({
    required this.modelId,
    required this.modelImageURL,
    required this.model3dURL,
    required this.modelName,
    required this.modelPrice,
    required this.modelEstimatedPrice,
    required this.modelArchitectname,
    required this.modelArchitectID,
    required this.modelColorScheme,
    required this.modelFloors,
    required this.modelTotalSquareFootage,
    required this.modelRoofStyle,
    required this.modelNumberOfCommonRooms,
    required this.modelNumberOfBedrooms,
    required this.modelNumberOfBaths,
    required this.modelFlooringOfRooms,
    required this.modelLightingOfRooms,
    required this.modelCeilingHeight,
    required this.modelKitchenCountertops,
    required this.modelKitchenCabinetry,
    required this.modelFlooringOfKitchen,
    required this.modelBathroomVanity,
    required this.modelFlooringOfBathrooms,
    required this.modelYard,
    required this.modelDeck,
    required this.modelPatio,
    required this.modelGarageNumOfParkings,
    required this.modelPool,
    required this.modelLandscapingStyle,
    required this.modelTechnologyAndSmartFeatures,
    required this.modelEnergyEfficiencyTools,
  });
}
