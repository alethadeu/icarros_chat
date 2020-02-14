import 'package:icarros_chat/remote/login_remote.dart';
import '../../commom.dart';

class LoginRepository {
  LoginRemote _loginRemote;
  LoginRepository(this._loginRemote);

  Future<Result> doLogin(String email, String password) {
    final result = _loginRemote.doLogin(email, password);
    return result;
  }
}