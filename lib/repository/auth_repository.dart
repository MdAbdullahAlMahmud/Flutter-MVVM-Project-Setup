
import 'package:flutter_mvvm_project_practise/data/network/BaseApiServices.dart';
import 'package:flutter_mvvm_project_practise/data/network/NetworkApiService.dart';
import 'package:flutter_mvvm_project_practise/res/app_url.dart';

class AuthRepository{

  BaseApiServices apiServices  = NetworkApiService();

  Future<dynamic> loginCredential (dynamic data ) async {

    try{
      var response = await apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;

    }catch(e){
      throw e;
    }


  }
}