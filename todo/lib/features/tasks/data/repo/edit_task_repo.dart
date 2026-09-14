import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/end_points.dart';
import 'package:todo/features/tasks/data/models/task_model.dart';

class EditTaskRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> editTask({
    required int id,
    required TaskModel task,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'title': task.title,
        'description': task.description,
      });

      var response = await apiHelper.putRequest(
        endPoint: '${EndPoints.Tasks}/$id',
        data: formData,
        isFormData: false,
        isPrivate: true,
      );

      return right(response.data['message']);
    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }



  
}