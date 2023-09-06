import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurd_coders/src/models/user_model.dart';

class AppProvider extends ChangeNotifier {
  UserModel? myUser;

  int selectedNavigatorIndex = 0;

  changeIndex(int index) {
    selectedNavigatorIndex = index;
    print("index changed to $index");
    notifyListeners();
  }

  signInTheUser(String email) {
    myUser = UserModel(
      uid: "1",
      avatarUrl:
          "https://media.sketchfab.com/models/624acae4597c40eb90aebc2650bc99bf/thumbnails/09e3261cc6204116b5fc611acb4eda6d/f4957ec96b79488298ec52c245986898.jpeg",
      bio: "Flutter app developer",
      birthday: Timestamp.fromDate(DateTime(1997, 3, 30)),
      email: email,
      name: "Salar Khalid",
      username: "salarpro",
    );

    notifyListeners();
  }

  signOut() {
    myUser = null;
    notifyListeners();
  }

  bool isDarkMood = false;

  updateAppearance(bool isDark) {
    isDarkMood = isDark;
    notifyListeners();
  }

  Color get scafoldBackground {
    if (isDarkMood) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color get background {
    if (isDarkMood) {
      return Color.fromARGB(255, 35, 34, 43);
    } else {
      return Color.fromARGB(255, 223, 223, 223);
    }
  }

  Color get TextColor {
    if (isDarkMood) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color get TextColor1 {
    if (isDarkMood) {
      return Color.fromARGB(255, 173, 173, 173);
    } else {
      return Color.fromARGB(255, 78, 78, 78);
    }
  }
}
