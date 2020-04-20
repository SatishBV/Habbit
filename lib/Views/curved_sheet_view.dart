import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: kAddHabitPageTitleLabel,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Container(
                height: 500.0,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: child),
          ),
        )
      ],
    );
  }
}
