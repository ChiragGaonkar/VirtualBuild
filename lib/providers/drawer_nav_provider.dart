import 'package:flutter/material.dart';

class DrawerNavProvider with ChangeNotifier {
  bool isHome = true;
  bool isModels = false;
  bool isArchitects = false;
  bool isFavorites = false;
  bool isChats = false;
  bool isAccount = false;

  void highlightDrawerMenu(int loc) {
    switch (loc) {
      case 1:
        isHome = true;
        isModels = false;
        isArchitects = false;
        isFavorites = false;
        isChats = false;
        isAccount = false;
        break;

      case 2:
        isHome = false;
        isModels = true;
        isArchitects = false;
        isFavorites = false;
        isChats = false;
        isAccount = false;
        break;

      case 3:
        isHome = false;
        isModels = false;
        isArchitects = true;
        isFavorites = false;
        isChats = false;
        isAccount = false;
        break;

      case 4:
        isHome = false;
        isModels = false;
        isArchitects = false;
        isFavorites = true;
        isChats = false;
        isAccount = false;
        break;

      case 5:
        isHome = false;
        isModels = false;
        isArchitects = false;
        isFavorites = false;
        isChats = true;
        isAccount = false;
        break;

      case 6:
        isHome = false;
        isModels = false;
        isArchitects = false;
        isFavorites = false;
        isChats = false;
        isAccount = true;
        break;
    }
    notifyListeners();
  }
}
