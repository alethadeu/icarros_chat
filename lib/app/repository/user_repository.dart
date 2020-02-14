import 'package:icarros_chat/commom.dart';
import 'package:icarros_chat/model/user.dart';
import 'package:icarros_chat/remote/user_list_remote.dart';

class UserRepository {
  UserListRemote _userListRemote;
  
  UserRepository(this._userListRemote);

  Future<Result> fetchUsers() {
    return _userListRemote.getUsers();
  }
}