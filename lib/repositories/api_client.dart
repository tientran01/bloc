// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:bloc_demo/application/application.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  String baseUrl = Application.baseUrl;

  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(baseUrl + "/users", data: {
        'email': email,
        'password': password,
      });
      return response.data;
    } on DioError catch (e) {
      return e.response?.data;
    }
  }

  Future<Response> getUser(int id) async {
    try {
      Response response = await _dio.get(baseUrl + "/users/$id");
      return response.data;
    } on DioError catch (e) {
      return e.response?.data;
    }
  }

  // Future<Response> logout() async{

  // }
}
