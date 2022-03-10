import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {

  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  CustomDialog (this.title,this.content,this.callback,[this.actionText ="Reset"]);

  @override
  Widget build (BuildContext context) {

      return new AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        new FlatButton(
        onPressed: callback,
        child: Text(actionText),
    )
    ],
    );

  }
}