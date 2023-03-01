
import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_project_practise/data/app_exceptions.dart';
import 'package:flutter_mvvm_project_practise/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class NetworkApiService extends BaseApiServices{



  @override
  Future getGetApiResponse(String url) async{

    dynamic responseJson ;
    try{
      final response =await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchException('No Internet Exception');
    }

    return responseJson;

  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson ;
    try{

      Response response =await http.post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10)) ;

      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchException('No Internet Exception');
    }

    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){

      case 200:
        dynamic responseJson = jsonEncode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());



      default:
        throw FetchException('Error occurred while communicating with server with status code ${response.statusCode.toString()}');

    }

  }


}