import 'package:flutter/material.dart';
import 'Constants/styles.dart';

class CreateHabbit extends StatefulWidget {
  @override
  _CreateHabitState createState() => _CreateHabitState();
}

class _CreateHabitState extends State<CreateHabbit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        title: Text(
          'Create a new Habbit',
          style: kScreenTitleLabel,
        ),
      ),
    );
  }
}
