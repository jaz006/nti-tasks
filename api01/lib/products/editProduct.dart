import 'package:api01/core/endpoint.dart';
import 'package:api01/core/handleeception.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true
  ),
);


Future<void> editProduct()async{
  try {
    var response = await dio.put(
      EndPoints.editProduct,
      data: FormData.fromMap({
        "name": "jazzz",
        "description": "bluh bluh bluh",
        "rating": "3.5",
        "best_seller": "1",
        "price": "10000",
        "category_id": "3",
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