import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:icarros_chat/app/modules/user_list/user_list_controller.dart';
import 'package:icarros_chat/app/modules/user_list/user_list_module.dart';
import 'package:icarros_chat/app/modules/user_list/widgets/category_selector.dart';
import 'package:icarros_chat/app/modules/user_list/widgets/favorite_list.dart';
import 'package:icarros_chat/app/modules/user_list/widgets/friends_list.dart';
import 'package:icarros_chat/app/utils/loader.dart';
import 'package:icarros_chat/model/user.dart';

class UserListPage extends StatefulWidget {
  final String title;
  const UserListPage({Key key, this.title = "Lista de usuários"}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();

}

class _UserListPageState extends State<UserListPage> {
  UserListController _controller = UserListModule.to.getBloc();

  @override 
  void initState() {
    super.initState();
    _controller.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading:  IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          iconSize: 30.0, 
          onPressed: () {},
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          buildObserver()
        ],
      )
      );
  }

 Observer buildObserver() {
    return Observer(
      builder: (_) {
        if(_controller.result == null) {
          return Loader();
        } 

        if(_controller.result.isLoading()) {
            return Loader();
        }

        if(_controller.result.hasErrorData()) {
          return ErrorWidget(_controller.result.getErrorData().message);
        }

        if(_controller.result.hasSuccessData()) { 
          return buildBody();
        }

        return Loader();

      });
 }

  Widget buildBody() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight:  Radius.circular(30.0),
            )
          ),
        child: Column(
          children: <Widget>[
            FavoriteContacts(favorites: _controller.list, callback: segueToChat),
            FriendsList(friends: _controller.list)
          ],
        ),
      ),
    );
  }

  segueToChat(User user) {
    print(user.name);
  }

}


