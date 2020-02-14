import 'package:dio/dio.dart';
import 'package:icarros_chat/app/service/dio_config/base_dio.dart';
import 'package:icarros_chat/app/service/dio_config/logging_interceptors.dart';
import 'package:icarros_chat/app/utils/shared_pref.dart';
import 'package:icarros_chat/commom.dart';
import 'package:icarros_chat/model/user.dart';
import 'package:icarros_chat/app/utils/constants.dart' as Constants;
import 'package:mobx/mobx.dart';

class UserListRemote {  
  Future<Result> getUsers() async {
    final dio = createDio();
    dio.interceptors.add(LogginInterceptors());
    final map = Map<String, dynamic>();
    Result result;
    final path = Constants.USERLIST_PATH;
    SharedPref sharedPref = SharedPref();

    try {
      String token = await sharedPref.read("token");
      map["Authorization"] = "Bearer $token";
      dio.options.headers = map;
    } catch (Exception) {
      print("fon");
    }
    
    try {
      final response = await dio.get(path);
      final list = response.data as List;
      final listUser = list.map((user) => User.fromJson(user)).toList();
      ObservableList<User> observableList = ObservableList<User>();
      observableList.addAll(listUser);
      result = Result.success(observableList);
    } on DioError catch (error) {
        result = Result.error(CustomError(error.message));
        return result; 
    }

    return result;
  }
}