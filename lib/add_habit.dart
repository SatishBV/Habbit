import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants/styles.dart';
import 'Models/habit.dart';

class CreateHabbit extends StatefulWidget {
  final Function onSave;

  CreateHabbit({@required this.onSave});

  @override
  _CreateHabitState createState() => _CreateHabitState();
}

class _CreateHabitState extends State<CreateHabbit> {
  Habit habit;

  @override
  Widget build(BuildContext context) {
    habit = Habit();
    habit.title = 'Yoga';
    habit.description = 'Get flexing';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreenColor,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: textColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        title: Text(
          'Create new Habbit',
          style: kAddHabitPageTitleLabel,
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop(widget.onSave(habit));
          },
          color: kGreenColor,
          child: Text('Save'),
        ),
      ),
    );
  }
}
