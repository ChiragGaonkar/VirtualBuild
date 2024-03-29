import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/models/models3d_model.dart';
import '../firebase/firestore_database.dart';

class ModelsProvider with ChangeNotifier {
  bool init = false;
  List<Models3D> models = [];

  RangeValues currentRangeValuesPrice = const RangeValues(0, 200000);
  RangeValues currentRangeValuesArea = const RangeValues(6000, 12000);
  double currentValueFloor = 3;
  double currentValueBeds = 6;
  double currentValueBaths = 5;

  void resetValues() {
    currentRangeValuesPrice = const RangeValues(0, 120000);
    currentRangeValuesArea = const RangeValues(6000, 12000);
    currentValueFloor = 3;
    currentValueBeds = 6;
    currentValueBaths = 5;
  }

  List<Models3D> get getModel {
    return [...models];
  }

  Stream<List<Models3D>> get getMyModels {
    var result = FirebaseFirestore.instance.collection("models").snapshots().map(
          (snapshot) => snapshot.docs.map((docs) => Models3D.fromJson(docs.data())).toList(),
        );
    return result;
  }

  Future<List<Models3D>> get getMyProjects async {
    List<Models3D> myProjects = [];
    try {
      var myProjs = [];
      final userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      myProjs = userData["orderedModels"];
      for (var element in myProjs) {
        var result = await FirebaseFirestore.instance.collection("models").doc(element).get();
        myProjects.add(Models3D.fromJson(result.data() as Map<String, dynamic>));
      }
      return myProjects;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Stream<List<Models3D>> searchModels(String value) {
    return FirebaseFirestore.instance.collection("models").where("modelName", isGreaterThanOrEqualTo: value, isLessThan: value + 'z').snapshots().map(
          (snapshot) => snapshot.docs.map((docs) => Models3D.fromJson(docs.data())).toList(),
        );
  }

  Stream<List<Models3D>> getArchitectSpecificModels(String architectID) {
    var result = FirebaseFirestore.instance.collection("models").where("modelArchitectID", isEqualTo: architectID).snapshots().map(
          (snapshot) => snapshot.docs.map((docs) => Models3D.fromJson(docs.data())).toList(),
        );
    return result;
  }

  Future<List<Models3D>> getFilteredModel() async {
    print("currentRangeValuesPrice $currentRangeValuesPrice");
    print("currentRangeValuesArea $currentRangeValuesArea");
    print("currentValueFloor $currentValueFloor");
    print("currentValueBeds $currentValueBeds");
    var data = await FirebaseFirestore.instance.collection("models").get();
    var l = data.docs.map((docs) => Models3D.fromJson(docs.data())).toList();
    print("l.length ${l[0].modelName}");
    List<Models3D> w3 = l.where((e) {
      double price = double.parse(e.modelPrice.substring(0, e.modelPrice.length - 1));
      // int price = 0;
      String ch = e.modelPrice[e.modelPrice.length - 1];
      switch (ch) {
        case "k":
          price *= 1000;
          break;
        case "L":
          price *= 100000;
          break;
        case "Cr":
          price *= 10000000;
          break;
      }
      // print("----------------------------");
      // print("modelName ${e.modelName} ");
      // print(
      //     "price ${price} ch ${ch} ${(price >= currentRangeValuesPrice.start && price <= currentRangeValuesPrice.end)}");
      // print(
      //     "area ${e.modelTotalSquareFootage} ${(e.modelTotalSquareFootage >= currentRangeValuesArea.start && e.modelTotalSquareFootage <= currentRangeValuesArea.end)}");
      // print(
      //     "modelFloors ${e.modelFloors} ${(e.modelFloors <= currentValueFloor)}");
      // print(
      //     "modelNumberOfBedrooms ${e.modelNumberOfBedrooms} ${(e.modelNumberOfBedrooms <= currentValueBeds)}");
      // print(
      //     "modelNumberOfBaths ${e.modelNumberOfBaths} ${(e.modelNumberOfBaths <= currentValueBaths)}");
      // print((price >= currentRangeValuesPrice.start &&
      //         price <= currentRangeValuesPrice.end) &&
      //     (e.modelTotalSquareFootage >= currentRangeValuesArea.start &&
      //         e.modelTotalSquareFootage <= currentRangeValuesArea.end) &&
      //     (e.modelFloors <= currentValueFloor) &&
      //     (e.modelNumberOfBedrooms <= currentValueBeds) &&
      //     (e.modelNumberOfBaths <= currentValueBaths));
      return (price >= currentRangeValuesPrice.start && price <= currentRangeValuesPrice.end) &&
          (e.modelTotalSquareFootage >= currentRangeValuesArea.start && e.modelTotalSquareFootage <= currentRangeValuesArea.end) &&
          (e.modelFloors <= currentValueFloor) &&
          (e.modelNumberOfBedrooms <= currentValueBeds) &&
          (e.modelNumberOfBaths <= currentValueBaths);
    }).toList();
    //models = w3;
    print("w3 ${w3.length}");
    return w3;
  }

  // Future<List<Models3D>> search(String input) async {
  //   input = input.toLowerCase();
  //   var data = await FirebaseFirestore.instance.collection("models").get();
  //   var l = data.docs.map((docs) => Models3D.fromJson(docs.data())).toList();
  //   List<Models3D> w3 = l.where((e) => ).toList();

  //   return w3;
  // }

  Future<bool> addFavourite(String id) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        "favModels": FieldValue.arrayUnion([id])
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFavourite(String id) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        "favModels": FieldValue.arrayRemove([id])
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<List<Models3D>> get getFavModel async {
  //   List<Models3D> favArchitects = [];
  //   try {
  //     var favArch = [];
  //     final userId = FirebaseAuth.instance.currentUser!.uid;
  //     DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  //     favArch = userData["favModels"];
  //     for (var element in favArch) {
  //       var result = await FirebaseFirestore.instance.collection("models").doc(element).get();
  //       favArchitects.add(Models3D.fromJson(result.data() as Map<String, dynamic>));
  //     }
  //     return favArchitects;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  Stream<List<Models3D>> getFavModelStream() async* {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

//       DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
//           .instance
//           .collection('users')
//           .doc(userId)
//           .get();
//       favArch = userData["favModels"];
//       for (var element in favArch) {
//         var result = await FirebaseFirestore.instance
//             .collection("models")
//             .doc(element)
//             .get();
//         favArchitects
//             .add(Models3D.fromJson(result.data() as Map<String, dynamic>));

      Stream<DocumentSnapshot<Map<String, dynamic>>> userStream = FirebaseFirestore.instance.collection('users').doc(userId).snapshots();

      await for (DocumentSnapshot<Map<String, dynamic>> userData in userStream) {
        var favArch = userData["favModels"];
        List<Models3D> favModels = [];

        for (var element in favArch) {
          var result = await FirebaseFirestore.instance.collection("models").doc(element).get();
          favModels.add(Models3D.fromJson(result.data() as Map<String, dynamic>));
        }

        yield favModels;
      }
    } catch (e) {
      print(e);
      yield [];
    }
  }

  Future<List<dynamic>> getFavModelList() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      return userData["favModels"];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> checkFavModel(String id) async {
    List<dynamic> list = await FireDatabase.getFavList();
    if (list.contains(id)) {
      return true;
    } else {
      return false;
    }
  }

  Models3D getModelById(String id) {
    return models.firstWhere((prod) => prod.modelId == id);
  }
}
