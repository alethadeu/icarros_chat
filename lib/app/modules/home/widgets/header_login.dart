import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/3,
          decoration: BoxDecoration ( 
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFf45d27),
                Color(0xFFf5851f)
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Icon(Icons.chat,
                    size: 80,
                    color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Chat iCarlos",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white
                  ),
                ),
              )
            ],
        ),
    );
  }
}