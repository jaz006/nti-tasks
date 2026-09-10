import 'package:api01/core/endpoint.dart';
import 'package:api01/core/handleeception.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true
  ),
);


Future<void> getSliders()async{
  try {
    var response = await dio.get(
      EndPoints.getSliders,
      
  );

  print(response.toString());

}
  catch (e) {
    handleException(e);
  }
}