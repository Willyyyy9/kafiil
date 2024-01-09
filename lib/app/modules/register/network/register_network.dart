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

  Future<dynamic> register(Map<String, String> data, File selectedImage) async {
    try {
      print(data);
      final request = http.MultipartRequest(
          'POST', Uri.parse("${AppLinks.baseUrl}/user/register"));
      request.files.add(
        http.MultipartFile.fromBytes(
          'avatar',
          await selectedImage.readAsBytes(),
          filename: selectedImage.path.split('/').last,
        ),
      );
      request.fields.addAll(data);
      final response = await request.send();
      // var response = await dio.post(
      //   '${AppLinks.baseUrl}/user/register',
      //   data: data,
      //   options: Options(),
      // );
      print(response.statusCode);
      EasyLoading.showError(response.reasonPhrase.toString());
      return response.toString();
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }
}
