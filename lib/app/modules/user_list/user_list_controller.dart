import 'package:icarros_chat/app/repository/user_repository.dart';
import 'package:icarros_chat/model/user.dart';
import 'package:mobx/mobx.dart';

import '../../../commom.dart';


part 'user_list_controller.g.dart';

class UserListController = _UserListBase with _$UserListController;

abstract class _UserListBase with Store {
  UserRepository _repository;
  _UserListBase(this._repository);

  @observable
  ObservableList<User> list;

  @observable
  Result result;

  @action 
  Future getUsers() async {
    result = Result.loading();
    result =  await _repository.fetchUsers();

    if (result.hasSuccessData())
      list = result.getSuccessData() as ObservableList<User>;  
  }

  
  

}
