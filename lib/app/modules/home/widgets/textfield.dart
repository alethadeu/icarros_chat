import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  
  TextType textType;
  TextEditingController controller = TextEditingController();

   CustomTextField({
    Key key,
    TextType textType, 
  }) : super(key: key) {
    this.textType = textType;
  }

  String hintText() {
    switch (textType) {
      case TextType.EMAIL:
        return "E-mail";
        break;
      case TextType.PASSWORD:
        return "Password";
        break;
      case TextType.NAME:
        return "Name";
        break;
      case TextType.PHONE:
        return "Phone";
        break;
    }
    return "";
  }

  Icon textIcon() {
    switch (textType) {
      case TextType.EMAIL:
        return Icon(Icons.email);
        break;
      case TextType.PASSWORD:
        return Icon(Icons.lock);
        break;
      case TextType.NAME:
        return Icon(Icons.person);
        break;
      case TextType.PHONE:
        return Icon(Icons.phone);
        break;
    }
  } 

  @override
  Widget build(BuildContext context) {
   return TextField(
          controller: controller,
          
          decoration: InputDecoration(
            labelText: hintText(),
            border: OutlineInputBorder(),
            prefixIcon: textIcon(),
            focusColor: Colors.orange
        ),
        obscureText: textType == TextType.PASSWORD ? true : false,
      );
  }
}

enum TextType {
  EMAIL, PASSWORD, NAME, PHONE
}