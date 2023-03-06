import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_project_practise/repository/user_repository.dart';

import '../model/client_model.dart';

class ClientViewModel extends ChangeNotifier{



  final _userRepository = UserRepository();

  bool _loading = false;

  bool get loading => _loading;

  ClientModel? _clientModel ;

  ClientModel? get getClientList => _clientModel;


  setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }


  Future<void> getUserList() async {

    setLoading(true);
    _userRepository.getAllUser().then((value)  async {
      debugPrint("User List Value json   ----->     ${value.toString()}");

      try{
        _clientModel =   ClientModel.fromJson(value);
        debugPrint("Data convertion completed ");
        setLoading(false);
        debugPrint("Loading false ");
        //notifyListeners();

      }catch(e){
        debugPrint("Ex. ------------------->   ${e.toString()}");
        _clientModel = ClientModel();
        debugPrint("Exception $e");
      }

    });


  }


}