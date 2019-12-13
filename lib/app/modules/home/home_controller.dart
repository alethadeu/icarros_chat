import 'package:icarros_chat/app/repository/login_repository.dart';
import 'package:icarros_chat/model/login_response.dart';
import 'package:mobx/mobx.dart';

import '../../../commom.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  LoginRepository _loginRepository;
  _HomeBase(this._loginRepository);


  @observable
  Error _error;

  @observable
  LoginResponse _loginResponse;

  @action 
  Future doLogin(String email, String password) async {
     Result<LoginResponse, Error> result  = await _loginRepository.doLogin(email, password);
     if(result.error != null) {
       _error = result.error;
     } else {
       _loginResponse = result.data;
     } 
  }

  void validateFields() {
    
  }
}
