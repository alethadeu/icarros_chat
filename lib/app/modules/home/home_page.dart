import 'package:flutter/material.dart';
import 'package:icarros_chat/app/modules/home/home_controller.dart';
import 'package:icarros_chat/app/modules/home/home_module.dart';
import 'package:icarros_chat/app/modules/home/widgets/header_login.dart';
import 'package:icarros_chat/app/modules/home/widgets/textfield.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = HomeModule.to.getBloc();

  final CustomTextField emailTextField = CustomTextField(textType: TextType.EMAIL);
  final CustomTextField passwordTextField = CustomTextField(textType: TextType.PASSWORD);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderLogin(),
        Container(
          padding: EdgeInsets.only(
            top: 32.0,
            left: 32.0,
            right: 32.0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: emailTextField,
                height: 75.0,
              ),
              Container(
                child: passwordTextField,
                height: 75.0,
              ),
              RaisedButton(
                textColor: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration ( 
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFf45d27),
                        Color(0xFFf5851f)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                    ),
                  )
                ), 
                onPressed: () {
                  _controller.doLogin(emailTextField.controller.text, passwordTextField.controller.text);
                },
              )
            ],
          ),
        )
        ],
      )
    );
  }
}



