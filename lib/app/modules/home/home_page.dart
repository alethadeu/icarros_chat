import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:icarros_chat/app/modules/home/home_controller.dart';
import 'package:icarros_chat/app/modules/home/home_module.dart';
import 'package:icarros_chat/app/modules/home/widgets/header_login.dart';
import 'package:icarros_chat/app/modules/home/widgets/textfield.dart';
import 'package:icarros_chat/app/modules/home/widgets/networking_widgets.dart';
import 'package:icarros_chat/app/modules/user_list/user_list_module.dart';
import 'package:icarros_chat/app/utils/loader.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = HomeModule.to.getBloc();

  @override 
  void initState() {
    super.initState();
    _controller.loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        children: <Widget>[
          HeaderLogin(),
        Container(
          padding: EdgeInsets.only(
            top: 32.0,
            left: 32.0,
            right: 32.0,
          ),
          child: buildObserver()
        )
        ],
      ),
    );
  }

  Column buildForm() {
    return Column(
      children: <Widget>[
        
        Container(
          child: customTextField(label: "E-mail", tController: _controller.emailTController, errorText: _controller.validateName),
          height: 75.0,
        ),

      Container(
        child: customTextField(label: "Password", tController: _controller.passwordTController, hideText: true),
        height: 75.0,
      ),
      
      RaisedButton(
        onPressed: () {
          _controller.doLogin(); 
        },
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.orange,
                Colors.deepOrange,
              ] 
            ),
          ),
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  ]);
}

  Observer buildObserver() {
    return Observer(
      builder: (_) {
        if(_controller.result == null) {
          return buildForm();
        }
        
        if(_controller.result.hasErrorData()) {
          WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
            context: context, 
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(_controller.result.getErrorData().message),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      _controller.resetResult();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
          )); 
         return buildForm();
        }

        if(_controller.result.isLoading()) {
          return Loader();
        }

        if(_controller.result.hasSuccessData()) {
          WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_) => UserListModule())));
        }

        return buildForm();
      },
    );
  }
}



