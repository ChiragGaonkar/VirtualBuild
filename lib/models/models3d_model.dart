class Models3D {
  //General
  final String modelId;
  final String modelImageURL;
  final String model3dURL;
  final String model3dBirdsView;
  final String modelName;
  final double modelPrice;
  final double modelEstimatedBuildPrice;
  final String modelArchitectname;
  final String modelArchitectID;

  //Exterior
  final List modelColorScheme;
  final int modelFloors;
  final int modelTotalSquareFootage;
  final List modelRoofStyle;

  //Interior
  final int modelNumberOfCommonRooms;
  final int modelNumberOfBedrooms;
  final int modelNumberOfBaths;
  final double modelCeilingHeight;
  final List modelFlooringOfRooms;
  final List modelLightingOfRooms;

  //Kitchen and Bathrooms
  final List modelKitchenCountertops;
  final List modelKitchenCabinetry;
  final List modelFlooringOfKitchen;
  final List modelBathroomVanity;

  //Outdoor Space
  final bool modelYard;
  final bool modelDeck;
  final bool modelPatio;
  final bool modelParkings;
  final bool modelPool;

  //Technology and smart features & EnergyEfficiency
  final List modelTechnologyAndSmartFeatures;

  //Other Designs
  // final Map<String, dynamic> modelOtherDesignLinks;

  Models3D({
    required this.modelId,
    required this.modelImageURL,
    required this.model3dURL,
    required this.model3dBirdsView,
    required this.modelName,
    required this.modelPrice,
    required this.modelEstimatedBuildPrice,
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
    required this.modelYard,
    required this.modelDeck,
    required this.modelPatio,
    required this.modelParkings,
    required this.modelPool,
    required this.modelTechnologyAndSmartFeatures,
    // required this.modelOtherDesignLinks,
  });

  Map<String, dynamic> toJson() => {
        'modelId': modelId,
        'modelImageURL': modelImageURL,
        'model3dURL': model3dURL,
        'model3dBirdsView': model3dBirdsView,
        'modelName': modelName,
        'modelPrice': modelPrice,
        'modelEstimatedBuildPrice': modelEstimatedBuildPrice,
        'modelArchitectname': modelArchitectname,
        'modelArchitectID': modelArchitectID,
        'modelColorScheme': modelColorScheme,
        'modelFloors': modelFloors,
        'modelTotalSquareFootage': modelTotalSquareFootage,
        'modelRoofStyle': modelRoofStyle,
        'modelNumberOfCommonRooms': modelNumberOfCommonRooms,
        'modelNumberOfBedrooms': modelNumberOfBedrooms,
        'modelNumberOfBaths': modelNumberOfBaths,
        'modelFlooringOfRooms': modelFlooringOfRooms,
        'modelLightingOfRooms': modelLightingOfRooms,
        'modelCeilingHeight': modelCeilingHeight,
        'modelKitchenCountertops': modelKitchenCountertops,
        'modelKitchenCabinetry': modelKitchenCabinetry,
        'modelFlooringOfKitchen': modelFlooringOfKitchen,
        'modelBathroomVanity': modelBathroomVanity,
        'modelYard': modelYard,
        'modelDeck': modelDeck,
        'modelPatio': modelPatio,
        'modelParkings': modelParkings,
        'modelPool': modelPool,
        'modelTechnologyAndSmartFeatures': modelTechnologyAndSmartFeatures,
        // 'modelOtherDesignLinks': {},
      };

  static Models3D fromJson(Map<String, dynamic> json) => Models3D(
        modelId: json['modelId'],
        modelImageURL: json['modelImageURL'],
        model3dURL: json['model3dURL'],
        model3dBirdsView: "",
        modelName: json['modelName'],
        modelPrice: json['modelPrice'],
        modelEstimatedBuildPrice: json['modelEstimatedBuildPrice'],
        modelArchitectname: json['modelArchitectname'],
        modelArchitectID: json['modelArchitectID'],
        modelColorScheme: json['modelColorScheme'],
        modelFloors: json['modelFloors'],
        modelTotalSquareFootage: json['modelTotalSquareFootage'],
        modelRoofStyle: json['modelRoofStyle'],
        modelNumberOfCommonRooms: json['modelNumberOfCommonRooms'],
        modelNumberOfBedrooms: json['modelNumberOfBedrooms'],
        modelNumberOfBaths: json['modelNumberOfBaths'],
        modelFlooringOfRooms: json['modelFlooringOfRooms'],
        modelLightingOfRooms: json['modelLightingOfRooms'],
        modelCeilingHeight: json['modelCeilingHeight'],
        modelKitchenCountertops: json['modelKitchenCountertops'],
        modelKitchenCabinetry: json['modelKitchenCabinetry'],
        modelFlooringOfKitchen: json['modelFlooringOfKitchen'],
        modelBathroomVanity: json['modelBathroomVanity'],
        modelYard: json['modelYard'],
        modelDeck: json['modelDeck'],
        modelPatio: json['modelPatio'],
        modelParkings: json['modelParkings'],
        modelPool: json['modelPool'],
        modelTechnologyAndSmartFeatures:
            json['modelTechnologyAndSmartFeatures'],
        // modelOtherDesignLinks: json['modelOtherDesignLinks'],
      );
}
