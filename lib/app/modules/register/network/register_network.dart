import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:kafiil/app/resources/string_manager.dart';

class RegisterNetwork {
  final dio = GetIt.instance<Dio>();
  final hive = GetIt.instance<Box>();

  Future<Map<String, dynamic>> findDependencies() async {
    try {
      var response = await dio.get(
        '${AppLinks.baseUrl}/dependencies',
      );

      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }

  Future<dynamic> register(
      Map<String, dynamic> data, File selectedImage) async {
    try {
      String fileName = selectedImage.path.split('/').last;
      FormData formData = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(selectedImage.path,
            filename: fileName),
        ...data
      });

      final response = await dio.post("${AppLinks.baseUrl}/user/register",
          data: formData,
          options: Options(contentType: "multipart/form-data", headers: {
            "Accept": "application/json",
            "Accept-Language": "ar",
          }));
      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }
}
