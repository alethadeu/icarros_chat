import 'package:flutter/material.dart';

customTextField({String label, TextEditingController tController, String Function() errorText, bool hideText, Icon icon}) {
  return TextField(
    controller: tController,
    obscureText: hideText != null ? hideText : false,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      errorText: errorText == null ? null : errorText(),
      icon: icon
    ),
  );
}