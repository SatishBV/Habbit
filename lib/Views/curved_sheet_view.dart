import 'package:flutter/material.dart';

class CurvedSheet extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final Widget child;

  CurvedSheet({
    @required this.title,
    @required this.child,
    @required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}
