import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualbuild/firebase/firestore_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'dart:io';

class UserDataProvide with ChangeNotifier {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  String name = "";
  String email = "";
  String address = "";
  String number = "";
  Map<String, dynamic> data = {"name": "", "email": "", "address": "", "phoneNumber": ""};

  Future<Map<String, dynamic>> getData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(userId).get().then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        data = await documentSnapshot.data() as Map<String, dynamic>;
        extractData();
      }
    });
    return data;
  }

  void extractData() async {
    final prefeb = await SharedPreferences.getInstance();
    name = data["name"];
    await prefeb.setString('name', name);
    address = data["address"];
    await prefeb.setString('address', address);
    number = data["phoneNumber"];
    await prefeb.setString('phoneNumber', number);
    email = data["email"];
    await prefeb.setString('email', email);
  }

  Future<void> updateData(String name, String address, String phone) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(userId).update({"name": name, "address": address, "phoneNumber": phone});
  }

  addProjectToOrders(String projectId) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("users").doc(userId).set({
        "orderedModels": FieldValue.arrayUnion([projectId])
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  void setData(
    String name,
    String email,
    String address,
    String number,
  ) {
    this.name = name;
    this.address = address;
    this.number = number;
    this.email = email;
  }

  Future<void> uploadDP() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ['png', 'jpg']);
    final userId = FirebaseAuth.instance.currentUser!.uid;
    if (result != null) {
      String location = "$userId/2d_images/";
      String fileName = result.files.single.name;
      location += fileName;
      deleteModel([await FireDatabase.getDPLink()]);
      print(fileName);
      print("iskweb ${kIsWeb}");
      if (kIsWeb) {
        Uint8List? uploadFile = result.files.single.bytes;
        final task = await storage.ref(location).putData(uploadFile!);
        var url = await task.ref.getDownloadURL();
        print(url);
        FireDatabase.updateDP(url);
        //await FireDatabase.addModelUrl(urlString, "Sample_image", id);
      } else {
        String filePath = result.files.single.path.toString();
        File file = File(filePath);
        try {
          final task = await storage.ref(location).putFile(file);
          final url = await task.ref.getDownloadURL();
          FireDatabase.updateDP(url);
          //await FireDatabase.addModelUrl(urlString, "Sample_image", id);
        } on firebase_core.FirebaseException catch (e) {
          print(e);
        }
      }
    }
    return null;
  }

  Future<void> deleteModel(
    List<dynamic> url,
  ) async {
    for (int i = 0; i < url.length; i++) {
      try {
        await storage.refFromURL(url[i]).delete();
      } catch (e) {
        print("error");
      }
    }
    // FireDatabase.deleteFromDb(url);
  }
}
