import 'package:icarros_chat/app/modules/user_list/user_list_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:icarros_chat/app/modules/user_list/user_list_page.dart';
import 'package:icarros_chat/app/repository/user_repository.dart';
import 'package:icarros_chat/remote/user_list_remote.dart';

class UserListModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => UserListController(i.getDependency())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => UserRepository(i.getDependency())),
    Dependency((i) => UserListRemote()) 
  ];

  @override
  Widget get view => UserListPage();

  static Inject get to => Inject<UserListModule>.of();
}
