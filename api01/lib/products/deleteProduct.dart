import 'package:api01/core/endpoint.dart';
import 'package:api01/core/handleeception.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true
  ),
);


Future<void> deleteProduct()async{
  try {
    var response = await dio.delete(
      EndPoints.deleteProduct,
      options: Options(
        headers: {
          "Authorization" : "Bearer ${EndPoints.token}"
        }
      )
  );

  print(response.toString());

}
  catch (e) {
    handleException(e);
  }
}