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
  List<User> _list;

  @observable
  Error _error;

  @action 
  Future getUsers() async {
    Result<List<User>, Error> result =  await _repository.fetchUsers();
    if(result.error != null) {
      _error = result.error;
    } else {
      _list = result.data;
    }
  }
  

}
