import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habbit/Constants/activity_icons.dart';
import 'package:habbit/Views/curved_sheet_view.dart';
import 'Views/icon_picker_card.dart';
import 'Constants/styles.dart';
import 'Models/habit.dart';
import 'Views/text_field_view.dart';
import 'Views/day_picker.dart';
import 'Views/color_picker_card.dart';

class CreateHabbit extends StatefulWidget {
  final Function onSave;
  static String id = 'CreateHabbit';

  CreateHabbit({@required this.onSave});

  @override
  _CreateHabitState createState() => _CreateHabitState();
}

class _CreateHabitState extends State<CreateHabbit> {
  Habit habit;
  TextEditingController _nameTextEditingController = TextEditingController();
  Color _activeColor = kGreenColor;
  ActivityIcon _activeIcon = ActivityIcon.none;

  @override
  void initState() {
    super.initState();
    habit = Habit();
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _activeColor,
      appBar: AppBar(
        backgroundColor: _activeColor,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: kPrimaryBlackColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: CurvedSheet(
          title: 'Add a new Habbit',
          backgroundColor: kPrimaryBlackColor,
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              HabbitTextField(
                controller: _nameTextEditingController,
                placeHolder: 'Name',
              ),
              SizedBox(height: 20.0),
              WeekDayPicker(
                days: habit.selectedDays,
                accentColor: _activeColor,
                onDayTap: (days) {
                  updateSelectedDays(days);
                },
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: ColorPickerCard(
                        activeColor: _activeColor,
                        onColorChanged: (color) {
                          changeColor(color);
                        },
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: IconPickerCard(
                        activeIcon: _activeIcon,
                        activeColor: _activeColor,
                        onIconChanged: (icon) {
                          changeIcon(icon);
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                color: _activeColor,
                child: Text('Save'),
                onPressed: () {
                  if (validateInformation()) {
                    Navigator.pop(context, widget.onSave(habit));
                  } else {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeColor(Color color) => setState(() => _activeColor = color);

  void changeIcon(ActivityIcon icon) => setState(() => _activeIcon = icon);

  void updateSelectedDays(Map<WeekDay, bool> days) {
    setState(() {
      habit.selectedDays = days;
    });
  }

  bool validateInformation() {
    habit.title = _nameTextEditingController.text;
    habit.habitColor = _activeColor;
    habit.icon = _activeIcon;

    if (habit.title.isEmpty) {
      return false;
    } else if (!habit.selectedDays.values.contains(true)) {
      return false;
    } else {
      return true;
    }
  }
}