import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.text, this.animationController, this.name);
  final String text;
  final AnimationController animationController;
  final String name;
  
  @override
  Widget build(BuildContext context) {
    return  SizeTransition(                                    //new
    sizeFactor: new CurvedAnimation(                              //new
        parent: animationController, curve: Curves.easeOut),      //new
    axisAlignment: 0.0,                                           //new
    child: new Container(                                    //modified
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(name[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      )                                                           //new
    );
  }
}

class MyMessages extends StatelessWidget {
  MyMessages(this.text, this.animationController, this.name);
  final String text;
  final AnimationController animationController;
  final String name;

  @override
  Widget build(BuildContext context) {
    return  SizeTransition(                                    //new
    sizeFactor: new CurvedAnimation(                              //new
        parent: animationController, curve: Curves.easeOut),      //new
    axisAlignment: 0.0,                                           //new
    child: new Container(                                    //modified
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(name[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                ),
              ],
            ),
          ],
        ),
      )                                                           //new
    );
  }
}