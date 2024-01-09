import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:kafiil/app/resources/string_manager.dart';

class HomeNetwork {
  final dio = GetIt.instance<Dio>();
  final hive = GetIt.instance<Box>();

  Future<dynamic> getUser({required String token}) async {
    try {
      var response = await dio.get('${AppLinks.baseUrl}/user/who-am-i',
          options: Options(contentType: 'application/json', headers: {
            "Accept-Language": "ar",
            "Authorization": token,
          }));
      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getDependencies() async {
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

  Future<Map<String, dynamic>> getServices() async {
    try {
      var response = await dio.get(
        '${AppLinks.baseUrl}/service',
      );

      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }

  Future<Map<String, dynamic>> getPopularServices() async {
    try {
      var response = await dio.get(
        '${AppLinks.baseUrl}/service/popular',
      );

      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }

  Future<Map<String, dynamic>> getCountries({required String url}) async {
    try {
      var response = await dio.get(url,
          options: Options(contentType: 'application/json', headers: {
            "Accept-Language": "ar",
          }));
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }
}
