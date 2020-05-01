import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habbit/Views/curved_sheet_view.dart';
import 'Constants/styles.dart';
import 'Models/habit.dart';
import 'Views/text_field_view.dart';
import 'Views/day_picker.dart';

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
  TextEditingController _descriptionEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    habit = Habit();
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextEditingController.dispose();
    _descriptionEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
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
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: CurvedSheet(
          title: 'Create a\nnew Habbit',
          backgroundColor: kPrimaryBlackColor,
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.0),
              HabbitTextField(
                controller: _nameTextEditingController,
                placeHolder: 'Name',
                onFinish: (value) {
                  habit.title = value;
                },
              ),
              SizedBox(height: 20.0),
              HabbitTextField(
                controller: _descriptionEditingController,
                placeHolder: 'Description',
                onFinish: (value) {
                  habit.description = value;
                },
              ),
              SizedBox(height: 20.0),
              WeekDayPicker(
                days: habit.selectedDays,
                onDayTap: (days) {
                  updateSelectedDays(days);
                },
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 167.0,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Color',
                            style: kPickerTitleStyle,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: kGreenColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 40.0,
                    // ),
                    Container(
                      height: 60.0,
                      width: 167.0,
                      decoration: BoxDecoration(
                        color: kCardColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Icon',
                            style: kPickerTitleStyle,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: kGreenColor,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                // color: Colors.blue,
              ),
              FlatButton(
                color: kGreenColor,
                child: Text('Save'),
                onPressed: () {
                  Navigator.pop(context, widget.onSave(habit));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelectedDays(Map<WeekDay, bool> days) {
    setState(() {
      habit.selectedDays = days;
    });
  }
}
