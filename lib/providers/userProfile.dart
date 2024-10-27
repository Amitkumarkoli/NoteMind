 import 'package:flutter/material.dart';
import 'dart:io';

class UserProfileProvider extends ChangeNotifier {
  String _name = "MLSA";
  String _email = "mlsa@gmail.com";
  String _roll = "12345";
  File? _profileImage;

  String get name => _name;
  String get email => _email;
  String get roll => _roll;
  File? get profileImage => _profileImage;

  void updateProfileImage(File newImage) {
    _profileImage = newImage;
    notifyListeners();
  }

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updateRoll(String newRoll) {
    _roll = newRoll;
    notifyListeners();
  }
} 