import 'package:flutter/material.dart';
import 'package:virtualbuild/models/architects_model.dart';

class ArchitectsProvider with ChangeNotifier {
  final List<ArchitectsModel> _architects = [
    ArchitectsModel(
      architectId: "1",
      architectAboutMe:
          "Dedicated architect with a passion for creating inspiring spaces that enhance people's lives.",
      architectImage:
          "https://images.unsplash.com/photo-1484399172022-72a90b12e3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      architectType: "Residential",
      architectClients: [],
      architectExperience: 7,
      architectName: "Sita Gaonkar",
      architectOfficeLocation: {"city": "Panaji", "state": "Goa"},
      architectProjects: [],
      architectRegNumber: "CA/2014/63827",
      skills: [],
    ),
    ArchitectsModel(
      architectId: "2",
      architectAboutMe:
          "Creative and detail-oriented architect with a focus on sustainability and functionality",
      architectImage:
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      architectType: "Residential",
      architectClients: [],
      architectExperience: 7,
      architectName: "Tanya Gaonkar",
      architectOfficeLocation: {"city": "Panaji", "state": "Goa"},
      architectProjects: [],
      architectRegNumber: "CA/2014/63827",
      skills: [],
    ),
    ArchitectsModel(
      architectId: "3",
      architectAboutMe:
          "Creative and detail-oriented architect with a focus on sustainability and functionality",
      architectImage:
          "https://images.unsplash.com/photo-1485462537746-965f33f7f6a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      architectType: "Residential",
      architectClients: [],
      architectExperience: 7,
      architectName: "Shreya Gaonkar",
      architectOfficeLocation: {"city": "Panaji", "state": "Goa"},
      architectProjects: [],
      architectRegNumber: "CA/2014/63827",
      skills: [],
    ),
    ArchitectsModel(
      architectId: "4",
      architectAboutMe:
          "Creative and detail-oriented architect with a focus on sustainability and functionality",
      architectImage:
          "https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1148&q=80",
      architectType: "Residential",
      architectClients: [],
      architectExperience: 7,
      architectName: "Vishnu Gaonkar",
      architectOfficeLocation: {"city": "Panaji", "state": "Goa"},
      architectProjects: [],
      architectRegNumber: "CA/2014/63827",
      skills: [],
    ),
  ];

  List<ArchitectsModel> get getArchitects {
    return [..._architects];
  }
  
}
