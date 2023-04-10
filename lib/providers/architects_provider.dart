import 'package:cloud_firestore/cloud_firestore.dart';
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

  // List<ArchitectModel> get myArchitects {
  //   getArchitects;
  //   return [..._architects];
  // }
}
