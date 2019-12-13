import 'package:icarros_chat/model/login_response.dart';
import 'package:icarros_chat/remote/login_remote.dart';
import '../../commom.dart';

class LoginRepository {
  LoginRemote _loginRemote;
  LoginRepository(this._loginRemote);

  Future<Result<LoginResponse, Error>> doLogin(String email, String password) {
    return _loginRemote.doLogin(email, password);
  }
}