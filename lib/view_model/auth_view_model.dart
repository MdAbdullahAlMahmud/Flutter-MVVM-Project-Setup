import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_project_practise/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, context) async {
    setLoading(true);

    debugPrint("Request Param ${data.toString()}");
    _authRepo.loginCredential(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        print("Login Success with token _> ${value.toString()}");
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
