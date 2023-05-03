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

  Future<List<ArchitectModel>> getFavArchitects() async {
    List<ArchitectModel> r = [];
    try {
      var favArch = [];
      final userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();
      favArch = userData["archFav"];
      for (var element in favArch) {
        var result = await FirebaseFirestore.instance
            .collection("architects")
            .doc(element)
            .get();
        //print("name ${result["architectName"]}");
        r.add(ArchitectModel.fromJson(result.data() as Map<String, dynamic>));
        //print(r.length);
      }
      //print("fav $favArch");
      return r;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // List<ArchitectModel> get myArchitects {
  //   getArchitects;
  //   return [..._architects];
  // }
}
