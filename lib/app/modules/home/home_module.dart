import 'package:icarros_chat/app/modules/home/home_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:icarros_chat/app/modules/home/home_page.dart';
import 'package:icarros_chat/app/repository/login_repository.dart';
import 'package:icarros_chat/remote/login_remote.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeController(i.getDependency())),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => LoginRepository(i.getDependency())),
    Dependency((i) => LoginRemote())
  ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
