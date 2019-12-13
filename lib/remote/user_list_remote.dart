import 'package:dio/dio.dart';
import 'package:icarros_chat/commom.dart';
import 'package:icarros_chat/model/user.dart';

class UserListRemote {  
  Future<Result<List<User>, Error>> getUsers() async {
    final dio = Dio();
    final map = Map<String, dynamic>();
    final result = Result();

    map["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1NzYyNjE5MTAsImlhdCI6MTU3NjI1ODMxMCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4ODg4Iiwic3ViIjoiNSJ9.au5t0o_7LQ8VTYQRszW3q-u4ZUWYIf9P3E4_eW7Kx2s";
    dio.options.headers = map;
    
    try {
      final response = await dio.get("http://192.168.1.213:8888/api/user/list");
      final list = response.data as List;
      final listUser = list.map((user) => User.fromJson(user)).toList();
      result.data = listUser;
    } catch (error) {
       result.error = error;
    }

    return result;
  }
}