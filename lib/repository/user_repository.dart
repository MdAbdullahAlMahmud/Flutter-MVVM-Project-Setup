import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class UserRepository{
  BaseApiServices _apiServices  = NetworkApiService();

  Future<dynamic> getAllUserApiCall () async {
    try{
      var response = await _apiServices.getGetApiResponse(AppUrl.userApiUrl);
      return response;
    }catch(e){
      throw e;
    }
  }


  Future<dynamic> getAllUser(int pageLimit , int pageIndex )async {
    try{

      debugPrint("Page Limit $pageLimit , Page Number $pageIndex");
      await Future.delayed(const Duration(seconds: 1));

      var response =  await rootBundle.loadString('user_list.json');

      return jsonDecode(response);
    }catch(e){
      throw e;
    }

  }

}