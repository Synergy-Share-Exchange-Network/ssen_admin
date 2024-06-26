import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssen_admin/Models/user_model.dart';
import 'package:ssen_admin/Repository/firebase/model%20methods/firebase_user_methods.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    UserModel user = await FirebaseUserMethods().read(id);
    _user = user;
    notifyListeners();
  }
}
