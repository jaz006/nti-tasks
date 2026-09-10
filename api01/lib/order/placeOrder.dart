import 'package:api01/core/endpoint.dart';
import 'package:api01/core/handleeception.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: EndPoints.baseUrl,
    receiveDataWhenStatusError: true
  ),
);


Future<void> placeOrder()async{
  try {
    var response = await dio.post(
      EndPoints.placeOrder,
      data: {
    "items": [
        {
            "product_id": 1,
            "quantity": 2
        },
        {
            "product_id": 2,
            "quantity": 1
        },
       
    ]
},
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