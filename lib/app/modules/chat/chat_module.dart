import 'package:icarros_chat/app/modules/chat/chat_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:icarros_chat/app/modules/chat/chat_page.dart';

class ChatModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ChatController()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ChatPage();

  static Inject get to => Inject<ChatModule>.of();
}
