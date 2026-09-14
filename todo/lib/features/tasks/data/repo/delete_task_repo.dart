import 'package:dartz/dartz.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/end_points.dart';


class DeleteTaskRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> deleteTask({
    required int id,
  }) async {
    try {
      var response = await apiHelper.deleteRequest(
        endPoint: '${EndPoints.Tasks}/$id',
        isPrivate: true,
      );

      return right(response.data['message']);
    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}