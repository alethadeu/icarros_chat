import 'package:flutter/material.dart';
import 'package:icarros_chat/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iCarros Chat',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.white,
        buttonColor: Colors.deepOrange
      ),
      home: HomeModule(),
    );
  }
}
