import '../data/network/baseApiService.dart';
import '../data/network/networkApiService.dart';
import '../res/appUrl.dart';

class AuthRepository {
  BaseApiService baseApiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await baseApiService.postApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await baseApiService.postApiResponse(AppUrl.signUpUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
