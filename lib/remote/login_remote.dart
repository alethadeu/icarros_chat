import 'package:dio/dio.dart';
import 'package:icarros_chat/commom.dart';
import 'package:icarros_chat/model/login_response.dart';

class LoginRemote {
  Future<Result<LoginResponse, Error>> doLogin(String email, String password) async {
    final dio = Dio();
    final result = Result();
    final endpoint = "http://192.168.1.213:8888/api/access/login";

    try {
      final response = await dio.post(endpoint, data: {"email": email, "password": password});
      final loginResponse = response.data as LoginResponse;
      result.data = loginResponse;
      return result;
    } catch (error) {
        result.error = error;
        return result;
    }
  }
}