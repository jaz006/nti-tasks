import 'package:dio/dio.dart';
import 'package:todo/core/network/end_points.dart';



String? accessToken;
String? refreshToken;

class ApiHelper {
  Dio _dio = Dio(BaseOptions(
    baseUrl: EndPoints.baseUrl
  ));


  Future<Response> postRequest({
  required String endPoint,
  dynamic data,
  bool isFormData = true,
  bool isPrivate = false,
}) async {
  return _dio.post(
    endPoint,
    data: data != null
        ? isFormData && data is! FormData
            ? FormData.fromMap(data)
            : data
        : null,
    options: Options(
      headers: {
        if (isPrivate) 'Authorization': 'Bearer $accessToken',
      },
    ),
  );
}

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    bool isPrivate = false,
})async{
    return _dio.get(endPoint,
        queryParameters: queryParams,
        options: Options(
            headers: {
              if(isPrivate) 'Authorization': 'Bearer $accessToken'
            }
        )
    );

  }
  Future<Response> putRequest({
  required String endPoint,
  dynamic data,
  bool isFormData = true,
  bool isPrivate = false,
}) async {
  print('PUR URL: ${_dio.options.baseUrl}$endPoint');
  print('PUT DAT: $data');
  return _dio.put(
    endPoint,
    data: data != null
        ? isFormData
            ? FormData.fromMap(data)
            : data
        : null,
    options: Options(
      headers: {
        if (isPrivate) 'Authorization': 'Bearer $accessToken',
      },
    ),
  );
  }
  Future<Response> deleteRequest({
  required String endPoint,
  bool isPrivate = false,
}) async {
  return _dio.delete(
    endPoint,
    options: Options(
      headers: {
        if (isPrivate) 'Authorization': 'Bearer $accessToken',
      },
    ),
  );
}

  String handleException(Object e) {
  if (e is DioException) {
    if (e.response?.data != null) {
      final data = e.response!.data;

      if (data is Map<String, dynamic>) {
        return data['message']?.toString() ??
            'Something went wrong';
      }

      return data.toString();
    }

    return 'Network error happened, try again later';
  }

  return 'Error happened, try again later';
}
}