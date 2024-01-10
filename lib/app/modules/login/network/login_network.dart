import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:kafiil/app/resources/string_manager.dart';

class LoginNetwork {
  final dio = GetIt.instance<Dio>();
  final hive = GetIt.instance<Box>();

  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      var response = await dio.post('${AppLinks.baseUrl}/user/login',
          data: {
            AttributeStrings.email: email,
            AttributeStrings.password: password,
          },
          options: Options(contentType: 'application/json', headers: {
            "Accept": "application/json; charset=UTF-8",
            "Accept-Language": "ar",
            "Content-Type": "application/json",
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
}
