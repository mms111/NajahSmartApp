import 'package:flutter/material.dart';

class AlertDialogBox{

  AlertDialogBox(BuildContext context, String title, String content)
  {
    getDialogBox(context, title, content );
  }

  getDialogBox(BuildContext context, String title, String content) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.green,
          )
        ],
        backgroundColor: Colors.blueGrey[50],
      )
    );
  }
}