import 'package:flutter/material.dart';

void showDialogWithClose(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        content: new Text(content),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
