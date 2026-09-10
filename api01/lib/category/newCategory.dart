import 'package:api01/core/endpoint.dart';
import 'package:api01/core/handleeception.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true
  ),
);


Future<void> newCategory()async{
  try {
    var response = await dio.post(
      EndPoints.newCategory,
      data: FormData.fromMap({
        "title": "pants",
        "description": "wide leg pants lol",
        "image": await MultipartFile.fromFile(
        "C:/Users/DDR3store/Pictures/Saved Pictures/myphoto.jpeg",
        filename: "myphoto.jpeg",
      ),
      }), 
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