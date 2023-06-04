import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/models/models3d_model.dart';

class ModelsProvider with ChangeNotifier {
  bool init = false;
  List<Models3D> models = [];

  RangeValues currentRangeValuesPrice = const RangeValues(4000, 12000);
  RangeValues currentRangeValuesArea = const RangeValues(1800, 3000);
  double currentValueFloor = 3;
  double currentValueBeds = 6;
  double currentValueBaths = 5;

  List<Models3D> get getModel {
    return [...models];
  }

  Stream<List<Models3D>> get getMyModels {
    var result =
        FirebaseFirestore.instance.collection("models").snapshots().map(
              (snapshot) => snapshot.docs
                  .map((docs) => Models3D.fromJson(docs.data()))
                  .toList(),
            );
    return result;
  }

  Stream<List<Models3D>> getArchitectSpecificModels(String architectID) {
    var result = FirebaseFirestore.instance
        .collection("models")
        .where("modelArchitectID", isEqualTo: architectID)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((docs) => Models3D.fromJson(docs.data()))
              .toList(),
        );
    return result;
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

  Future<List<Models3D>> get getFavModel async {
    List<Models3D> favArchitects = [];
    try {
      var favArch = [];
      final userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();
      favArch = userData["favModels"];
      for (var element in favArch) {
        var result = await FirebaseFirestore.instance
            .collection("models")
            .doc(element)
            .get();
        favArchitects
            .add(Models3D.fromJson(result.data() as Map<String, dynamic>));
      }
      print("fav $favArch");
      return favArchitects;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<String>> getFavModelList() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();
      return userData["favModels"];
    } catch (e) {
      print(e);
      return [];
    }
  }

  bool checkFavModel(List<String> list, String id) {
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
