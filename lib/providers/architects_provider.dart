import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/models/architects_model.dart';

class ArchitectsProvider with ChangeNotifier {
  final List<ArchitectModel> _architects = [];

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

  Future<List<String>> getFavArchList() async {
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
}
