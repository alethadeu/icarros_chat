import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

Widget buildLoadingWidget(context) {
  ProgressDialog pd = ProgressDialog(context);
  pd.style();
}

Widget buildErrorWidget(String error) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[ 
        Text("Error occured: $error")
      ],
    ),
  );
}