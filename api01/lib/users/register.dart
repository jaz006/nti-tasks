import 'package:api01/core/endpoint.dart';
import 'package:api01/core/handleeception.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true
  ),
);


Future<void> register()async{
  try {
    var response = await dio.post(
      EndPoints.register,
      data: FormData.fromMap({
        "name": "yasmine Amgad",
        "password": "123456",
        "email": "yasmine@gmail.com",
        "phone": "01118021287", 
      })
  );

  print(response.toString());

}
  catch (e) {
    handleException(e);
  }
}
