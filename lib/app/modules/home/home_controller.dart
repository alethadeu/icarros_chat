import 'package:flutter/material.dart';
import 'package:icarros_chat/app/repository/login_repository.dart';
import 'package:icarros_chat/app/utils/shared_pref.dart';
import 'package:icarros_chat/model/login_response.dart';
import 'package:mobx/mobx.dart';

import '../../../commom.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  LoginRepository _loginRepository;
  _HomeBase(this._loginRepository);

  @observable
  Result result;

  TextEditingController emailTController = TextEditingController();
  TextEditingController passwordTController = TextEditingController();
  SharedPref sharedPref = SharedPref();


  @observable
  LoginResponse _loginResponse;

  @action 
  Future doLogin() async {
     result = Result.loading();
     Future.delayed(Duration(seconds: 5), () async {
      result  = await _loginRepository.doLogin(emailTController.text, passwordTController.text);
     });
     
     if(result.hasSuccessData()) {
       _loginResponse =  result.getSuccessData() as LoginResponse;

     }
  }

 String validateName() {
   return null;
 }

 resetResult() {
   result = null;
 }

 loadUser() async {
   String email = await sharedPref.read("email") ?? "";
   String pass = await sharedPref.read("pass") ?? "";

   emailTController.text = email;
   passwordTController.text = pass;

   if(email != null && pass != null && email.isNotEmpty && pass.isNotEmpty) {
     doLogin();
   }
 }
}
