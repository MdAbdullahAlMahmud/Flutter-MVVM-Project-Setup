import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_project_practise/repository/user_repository.dart';

import '../model/client_model.dart';

class ClientViewModel extends ChangeNotifier{



  final _userRepository = UserRepository();
  bool _loading = false;
  ClientModel? _clientModel ;
  List<ClientPojo> _clientArrayList = [];



  bool get loading => _loading;
  ClientModel? get getClientList => _clientModel;
  List<ClientPojo> get getClientArrayList => _clientArrayList;



  setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }


  Future<void> getUserList(int pageLimit, int pageIndex) async {

    setLoading(true);
    _userRepository.getAllUser(pageLimit , pageIndex).then((value)  async {
      debugPrint("User List Value json   ----->     ${value.toString()}");

      try{
        _clientModel =   ClientModel.fromJson(value);

        _clientArrayList.clear();

        _clientModel!.data!.forEach((element) {

          element.id = Random().nextInt(5000);
        });

        _clientArrayList.addAll(_clientModel!.data!);

        debugPrint("Data convertion completed ");
        setLoading(false);
        debugPrint("Loading false ");

      }catch(e){
        debugPrint("Ex. ------------------->   ${e.toString()}");
        _clientModel = ClientModel();
        debugPrint("Exception $e");
      }
    });

  }


}