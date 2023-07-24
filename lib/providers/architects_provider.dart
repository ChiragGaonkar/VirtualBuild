import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/models/architects_model.dart';

class ArchitectsProvider with ChangeNotifier {
  final List<ArchitectModel> _architects = [];
  RangeValues currentRangeValuesExperience = const RangeValues(30, 50);

  Stream<List<ArchitectModel>> get getArchitects {
    var result =
        FirebaseFirestore.instance.collection("architects").snapshots().map(
              (snapshot) => snapshot.docs
                  .map((docs) => ArchitectModel.fromJson(docs.data()))
                  .toList(),
            );
    // add the entire list to the _architects list
    // result.listen((architects) {
    //   _architects.addAll(architects);
    // });
    return result;
  }

  Stream<List<ArchitectModel>> searchArchitects(String value) {
    return FirebaseFirestore.instance
        .collection("architects")
        .where("architectName",
            isGreaterThanOrEqualTo: value, isLessThan: value + 'z')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((docs) => ArchitectModel.fromJson(docs.data()))
              .toList(),
        );
  }

  Future<bool> addFavouriteArchitect(String id) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        "favArchitects": FieldValue.arrayUnion([id])
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  showParticularArchitect(String architectId) async {
    try {
      final architectDetail = await FirebaseFirestore.instance
          .collection("architects")
          .doc(architectId)
          .get();
      final data = ArchitectModel.fromJson(
          architectDetail.data() as Map<String, dynamic>);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> removeFavouriteArchitect(String id) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        "favArchitects": FieldValue.arrayRemove([id])
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ArchitectModel>> getFavArchitects() async {
    List<ArchitectModel> favArchitects = [];
    try {
      var favArch = [];
      final userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();
      favArch = userData["favArchitects"];
      for (var element in favArch) {
        var result = await FirebaseFirestore.instance
            .collection("architects")
            .doc(element)
            .get();
        favArchitects.add(
            ArchitectModel.fromJson(result.data() as Map<String, dynamic>));
      }
      return favArchitects;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<dynamic>> getFavArchList() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();
      return userData["favArchitects"];
    } catch (e) {
      print(e);
      return [];
    }
  }

  bool checkFavArch(List<String> list, String id) {
    if (list.contains(id)) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ArchitectModel>> filter() async {
    var data = await FirebaseFirestore.instance.collection("architects").get();
    var l =
        data.docs.map((docs) => ArchitectModel.fromJson(docs.data())).toList();
    List<ArchitectModel> w3 = l.where((e) {
      int exp = int.parse(e.architectExperience);
      return exp >= currentRangeValuesExperience.start &&
          exp <= currentRangeValuesExperience.end;
    }).toList();
    return w3;
  }
}
