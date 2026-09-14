import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/end_points.dart';
import 'package:todo/features/auth/data/models/user_model.dart';


class AuthRepo {
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, UserModel>> login({
    required String username,
    required String password,
})async
  {
    try{
      var response = await apiHelper.postRequest(
          endPoint: EndPoints.login,
          data: {
            'username': username,
            'password': password,
          }
      );
      var jsonResponse = response.data as Map<String, dynamic>;
      accessToken =  jsonResponse['access_token'];
      refreshToken = jsonResponse['refresh_token'];
      print(response.data.toString());

      UserModel userModel = UserModel.fromJson(jsonResponse['user']);
      return right(userModel);
    }
    catch(e){
      return left(apiHelper.handleException(e));
    }
  }

  Future<Either<String, String>> register({
    required String username,
    required String password,
    String? imagePath
})async
  {
    try{
      var response = await apiHelper.postRequest(
          endPoint: EndPoints.register,
          data: {
            'username': username,
            'password': password,
            if(imagePath != null) 'image': await MultipartFile.fromFile(imagePath)
          }
      );
      var jsonResponse = response.data as Map<String, dynamic>;
      return right(jsonResponse['message']);
    }
    catch(e){
      return left(apiHelper.handleException(e));
    }
  }
}