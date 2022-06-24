// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:bloc_demo/application/application.dart';
import 'package:bloc_demo/model/user_response.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient api = ApiClient._internal();

  ApiClient._internal();

  final Dio _dio = Dio();
  String baseUrl = Application.baseUrl;

  Future<UserResponse> login(String? email, String? password) async {
    Response response =
        await _dio.post(baseUrl + "/api/v1/sign_in", queryParameters: {
      'user_name': email,
      'password': password,
    });
    return UserResponse.fromJson(response.data);
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
