import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class UserRepository{
  BaseApiServices apiServices  = NetworkApiService();

  Future<dynamic> getAllUserApiCall () async {
    try{
      var response = await apiServices.getGetApiResponse(AppUrl.userApiUrl);
      return response;
    }catch(e){
      throw e;
    }
  }

}