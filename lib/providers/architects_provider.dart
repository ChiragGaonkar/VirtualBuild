import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtualbuild/models/architects_model.dart';

class ArchitectsProvider with ChangeNotifier {
  final List<ArchitectModel> _architects = [];
  List<ArchitectModel> _allArchitects = [];

  Stream<List<ArchitectModel>> get getArchitects {
    var result = FirebaseFirestore.instance
        .collection("architects")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((docs) =>
                  ArchitectModel.fromJson(docs.data() as Map<String, dynamic>))
              .toList(),
        );

    // Store all architects in the local list
    result.listen((architects) {
      _allArchitects = architects;
    });

    return result;
  }

  Stream<List<ArchitectModel>> searchArchitects(String value) {
    value = value.toLowerCase();

    // Filter architects whose names start with the search query
    var startsWithQuery = _allArchitects.where((architect) {
      var name = architect.architectName.toLowerCase();
      return name.startsWith(value);
    }).toList();

    // Filters remaining architects by name or any element of location
    var filteredArchitects = _allArchitects.where((architect) {
      var name = architect.architectName.toLowerCase();
      var officeLocation = architect.architectOfficeLocation;

      // Check for case-insensitive matches in name and elements of office location
      return !name.startsWith(value) &&
          (name.contains(value) ||
              containsIgnoreCase(officeLocation['city']?.toString(), value) ||
              containsIgnoreCase(
                  officeLocation['companyName']?.toString(), value) ||
              containsIgnoreCase(
                  officeLocation['companyStreetAddress']?.toString(), value) ||
              containsIgnoreCase(
                  officeLocation['country']?.toString(), value) ||
              containsIgnoreCase(officeLocation['state']?.toString(), value) ||
              containsIgnoreCase(officeLocation['zipCode']?.toString(), value));
    }).toList();

    // Combines the two filtered lists, giving priority to names that start with the search query
    var finalArchitects = [...startsWithQuery, ...filteredArchitects];

    // Returns the filtered architects as a stream
    return Stream.value(finalArchitects);
  }

  // Helper method for case-insensitive search
  bool containsIgnoreCase(String? source, String query) {
    if (source == null) return false;
    return source.toLowerCase().contains(query);
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
