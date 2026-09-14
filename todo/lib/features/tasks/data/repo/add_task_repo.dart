import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/end_points.dart';
import 'package:todo/features/tasks/data/models/task_model.dart';


class AddTaskRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> addTask({
    required TaskModel task,
    File? image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'title': task.title,
        'description': task.description,

        if (image != null)
          'image': image != null ? File(image!.path) : null,
          
      });

      var response = await apiHelper.postRequest(
        endPoint: EndPoints.newTask,
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