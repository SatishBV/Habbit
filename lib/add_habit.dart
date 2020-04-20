import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habbit/Views/curved_sheet_view.dart';
import 'Constants/styles.dart';
import 'Models/habit.dart';
import 'Views/text_field_view.dart';

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
  void dispose() {
    super.dispose();
    _nameTextEditingController.dispose();
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
                SizedBox(height: 20.0),
                HabbitTextField(
                  controller: _nameTextEditingController,
                  helperText: 'Name',
                  onFinish: (value) {
                    habit.title = value;
                  },
                ),
                SizedBox(height: 10.0),
                HabbitTextField(
                  controller: _descriptionEditingController,
                  helperText: 'Description',
                  onFinish: (value) {
                    habit.description = value;
                  },
                ),
                SizedBox(height: 20.0),
                Container(
                  // Implement choice chip for days of the week
                  color: Colors.blue,
                  height: 100.0,
                )
              ],
            ),
          )),
    );
  }
}
