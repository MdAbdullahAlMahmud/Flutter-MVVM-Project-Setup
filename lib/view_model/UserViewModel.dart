
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_project_practise/data/local/shred_pref.dart';
import 'package:flutter_mvvm_project_practise/model/user_model.dart';

class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(UserModel model) async {

    //MyShredPref shredPref = MyShredPref();

    //debugPrint("User Token ---> ${shredPref.getUserToken()}");


    return true;
  }
}