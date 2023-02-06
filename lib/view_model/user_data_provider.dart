
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_data_model.dart';
import '../repository/user_repository.dart';

class UserDataProvider with ChangeNotifier{

  List<UserDataModel> get userModel => _userModel;

  // SORT COLUMN INDEX...

  int? get sortColumnIndex => _sortColumnIndex;

   set sortColumnIndex(int? sortColumnIndex) {
    _sortColumnIndex = sortColumnIndex;
    notifyListeners();
  }

  // SORT ASCENDING....

  bool get sortAscending => _sortAscending;

  set sortAscending(bool sortAscending) {
    _sortAscending = sortAscending;
    notifyListeners();
  }

  int get rowsPerPage => _rowsPerPage;

  set rowsPerPage(int rowsPerPage) {
    _rowsPerPage = rowsPerPage;
    notifyListeners();
  }

  // -------------------------------------- INTERNALS --------------------------------------------

  var _userModel = <UserDataModel>[];

  int? _sortColumnIndex;
  bool _sortAscending = true;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  Future<void> fetchData() async {
    debugPrint("Fetch Data Provider is calling ");
    _userModel = await UserRepository().getAllUserApiCall();
    notifyListeners();
  }






}